package ui.layout
{
    import core.UIColors;
    import core.UIConstants;
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFormat;
    
    public class StatusBar extends Sprite
    {
        
        public function StatusBar()
        {
            super();
            this.draw();
            this.createText();
        }
        
        private function draw() : void
        {
            graphics.beginFill(UIColors.HEADER);
            graphics.drawRect(0,0,UIConstants.WIDTH,UIConstants.STATUS_HEIGHT);
            graphics.endFill();
        }
        
        private function createText() : void
        {
            var text:TextField = new TextField();
            text.width = UIConstants.WIDTH;
            text.height = UIConstants.STATUS_HEIGHT;
            var format:TextFormat = new TextFormat();
            format.size = 12;
            format.color = UIColors.TEXT;
            text.defaultTextFormat = format;
            text.text = "Server: Online     Players: 1     Autosave: Ready";
            addChild(text);
        }
    }
}

