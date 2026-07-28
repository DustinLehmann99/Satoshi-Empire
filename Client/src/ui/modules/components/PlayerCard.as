package ui.modules.components
{
    import ui.controls.Label;
    import ui.controls.Panel;
    import ui.managers.ModelManager;
    
    public class PlayerCard extends Panel
    {
        
        private var label:Label;
        
        public function PlayerCard()
        {
            super("Player",230,120);
            this.build();
        }
        
        private function build() : void
        {
            this.label = new Label("");
            this.label.x = 10;
            this.label.y = contentY;
            addChild(this.label);
            this.refresh();
        }
        
        public function refresh() : void
        {
            var player:* = ModelManager.player;
            this.label.setText("Name: " + player.name + "\nID: " + player.id);
        }
    }
}

