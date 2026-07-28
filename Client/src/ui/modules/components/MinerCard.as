package ui.modules.components
{
    import ui.controls.Label;
    import ui.controls.Panel;
    import ui.managers.ModelManager;
    
    public class MinerCard extends Panel
    {
        
        private var label:Label;
        
        public function MinerCard()
        {
            super("Miner",230,150);
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
            if(ModelManager.player.miners.length == 0)
            {
                this.label.setText("No miners");
                return;
            }
            var miner:* = ModelManager.player.miners[0];
            this.label.setText(miner.name + "\nHashrate: " + miner.hashrate + "\nCondition: " + miner.condition);
        }
    }
}

