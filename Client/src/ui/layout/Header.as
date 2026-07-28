package ui.layout
{
    import core.UIColors;
    import core.UIConstants;
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFormat;
    
    public class Header extends Sprite
    {
        
        public function Header()
        {
            super();
            this.draw();
            this.createText();
        }
        
        private function draw() : void
        {
            graphics.beginFill(UIColors.HEADER);
            graphics.drawRect(0,0,UIConstants.WIDTH,UIConstants.HEADER_HEIGHT);
            graphics.endFill();
        }
        
        private function createText() : void
        {
            var text:TextField = new TextField();
            text.width = UIConstants.WIDTH;
            text.height = UIConstants.HEADER_HEIGHT;
            var format:TextFormat = new TextFormat();
            format.color = UIColors.TEXT;
            format.size = 16;
            text.defaultTextFormat = format;
            text.text = "SATOSHI EMPIRE                         Player                 Alpha 0.1";
            addChild(text);
        }
    }
}

