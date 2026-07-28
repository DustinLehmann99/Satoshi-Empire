package ui.controls
{
    import flash.display.Sprite;
    
    public class Control extends Sprite
    {
        
        protected var background:uint = 2763306;
        
        protected var border:uint = 5263440;
        
        protected var borderSize:int = 1;
        
        public function Control()
        {
            super();
        }
        
        protected function drawBackground(width:int, height:int) : void
        {
            graphics.clear();
            graphics.lineStyle(this.borderSize,this.border);
            graphics.beginFill(this.background);
            graphics.drawRect(0,0,width,height);
            graphics.endFill();
        }
    }
}

