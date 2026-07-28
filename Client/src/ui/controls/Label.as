package ui.controls
{
    import core.UIColors;
    import flash.text.TextField;
    import flash.text.TextFormat;
    
    public class Label extends Control
    {
        
        protected var field:TextField;
        
        public function Label(text:String = "")
        {
            super();
            this.field = new TextField();
            this.field.selectable = false;
            this.field.autoSize = "left";
            var format:TextFormat = new TextFormat();
            format.color = UIColors.TEXT;
            format.size = 12;
            this.field.defaultTextFormat = format;
            this.field.text = text;
            addChild(this.field);
        }
        
        public function setText(value:String) : void
        {
            this.field.text = value;
        }
        
        public function get text() : String
        {
            return this.field.text;
        }
        
        public function setSize(size:int) : void
        {
            var format:TextFormat = this.field.defaultTextFormat;
            format.size = size;
            this.field.setTextFormat(format);
        }
    }
}

