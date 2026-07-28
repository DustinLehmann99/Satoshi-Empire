package ui.controls
{
    import core.UIColors;
    
    public class Panel extends Control
    {
        
        protected var title:String;
        
        protected var panelWidth:int;
        
        protected var panelHeight:int;
        
        public function Panel(title:String, width:int, height:int)
        {
            super();
            this.title = title;
            this.panelWidth = width;
            this.panelHeight = height;
            this.drawPanel();
        }
        
        private function drawPanel() : void
        {
            graphics.clear();
            graphics.lineStyle(1,UIColors.BORDER);
            graphics.beginFill(UIColors.PANEL);
            graphics.drawRect(0,0,this.panelWidth,this.panelHeight);
            graphics.endFill();
            graphics.beginFill(UIColors.HEADER);
            graphics.drawRect(0,0,this.panelWidth,28);
            graphics.endFill();
        }
        
        public function get contentY() : int
        {
            return 36;
        }
    }
}

