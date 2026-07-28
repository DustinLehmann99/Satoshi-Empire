package ui.layout
{
    import core.UIColors;
    import core.UIConstants;
    import flash.display.Sprite;
    import ui.managers.WorkspaceManager;
    
    public class Desktop extends Sprite
    {
        
        private var workspace:WorkspaceManager;
        
        public function Desktop()
        {
            super();
            this.draw();
            this.workspace = new WorkspaceManager(this);
        }
        
        private function draw() : void
        {
            graphics.beginFill(UIColors.PANEL);
            graphics.drawRect(0,0,UIConstants.WIDTH,UIConstants.DESKTOP_HEIGHT);
            graphics.endFill();
        }
        
        public function navigate(name:String) : void
        {
            this.workspace.navigate(name);
        }
    }
}

