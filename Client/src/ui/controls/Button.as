package ui.controls
{
    import flash.events.MouseEvent;
    
    public class Button extends Label
    {
        
        private var normalColor:uint = 2763306;
        
        private var hoverColor:uint = 3158064;
        
        private var selectedColor:uint = 5809919;
        
        private var widthValue:int;
        
        private var heightValue:int;
        
        public var selected:Boolean = false;
        
        public function Button(text:String, width:int = 90, height:int = 24)
        {
            super(text);
            this.widthValue = width;
            this.heightValue = height;
            buttonMode = true;
            mouseChildren = false;
            this.draw();
            addEventListener(MouseEvent.MOUSE_OVER,this.hover);
            addEventListener(MouseEvent.CLICK,this.clicked);
            addEventListener(MouseEvent.MOUSE_OUT,this.out);
        }
        
        private function draw() : void
        {
            graphics.clear();
            graphics.beginFill(this.normalColor);
            graphics.drawRect(0,0,this.widthValue,this.heightValue);
            graphics.endFill();
        }
        
        private function hover(event:MouseEvent) : void
        {
            if(!this.selected)
            {
                graphics.clear();
                graphics.beginFill(this.hoverColor);
                graphics.drawRect(0,0,this.widthValue,this.heightValue);
                graphics.endFill();
            }
        }
        
        private function clicked(event:MouseEvent) : void
        {
            dispatchEvent(event);
        }
        
        private function out(event:MouseEvent) : void
        {
            if(!this.selected)
            {
                this.draw();
            }
        }
        
        public function setSelected(value:Boolean) : void
        {
            this.selected = value;
            graphics.clear();
            graphics.beginFill(this.selected ? this.selectedColor : this.normalColor);
            graphics.drawRect(0,0,this.widthValue,this.heightValue);
            graphics.endFill();
        }
    }
}

