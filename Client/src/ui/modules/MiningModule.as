package ui.modules
{
    import ui.controls.Label;
    
    public class MiningModule extends Module
    {
        
        public function MiningModule()
        {
            super("Mining");
            this.build();
        }
        
        private function build() : void
        {
            var label:Label = new Label("Mining System Online");
            label.x = 12;
            label.y = contentY;
            addChild(label);
        }
    }
}

