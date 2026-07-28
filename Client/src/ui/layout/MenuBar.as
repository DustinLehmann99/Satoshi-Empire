package ui.layout
{
    import events.NavigationEvent;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import ui.controls.Button;
    
    public class MenuBar extends Sprite
    {
        
        private var buttons:Array = [];
        
        private var names:Array = ["Dashboard","Mining","Wallet","Market","Exchange","Research","Statistics","Settings"];
        
        public function MenuBar()
        {
            super();
            this.build();
        }
        
        private function build() : void
        {
            var name:String = null;
            var firstButton:Button = null;
            var button:Button = null;
            var position:int = 8;
            for each(name in this.names)
            {
                button = new Button(name,85,22);
                button.x = position;
                button.y = 3;
                button.addEventListener(MouseEvent.CLICK,this.selected);
                addChild(button);
                this.buttons.push(button);
                position += 90;
            }
            firstButton = this.buttons[0] as Button;
            firstButton.setSelected(true);
        }
        
        private function selected(event:MouseEvent) : void
        {
            var button:Button = null;
            for each(button in this.buttons)
            {
                button.setSelected(button == event.currentTarget);
            }
            dispatchEvent(new NavigationEvent(Button(event.currentTarget).text));
        }
    }
}

