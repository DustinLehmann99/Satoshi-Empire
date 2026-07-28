package ui.managers
{
    import flash.display.Sprite;
    import ui.modules.Module;
    
    public class WorkspaceManager
    {
        
        private var container:Sprite;
        
        private var current:Module;
        
        public function WorkspaceManager(container:Sprite)
        {
            super();
            this.container = container;
            this.show("Dashboard");
        }
        
        public function navigate(name:String) : void
        {
            this.show(name);
        }
        
        private function show(name:String) : void
        {
            if(this.current != null)
            {
                this.current.destroy();
                this.container.removeChild(this.current);
            }
            this.current = ModuleRegistry.create(name);
            if(this.current == null)
            {
                this.current = ModuleRegistry.create("Dashboard");
            }
            this.container.addChild(this.current);
            this.current.refresh();
        }
    }
}

