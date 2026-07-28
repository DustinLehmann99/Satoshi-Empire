package ui.modules.components
{
    import ui.controls.Label;
    import ui.controls.Panel;
    import ui.managers.ModelManager;
    
    public class WalletCard extends Panel
    {
        
        private var label:Label;
        
        public function WalletCard()
        {
            super("Wallet",230,120);
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
            var wallet:* = ModelManager.player.wallet;
            this.label.setText("Satoshi: " + wallet.satoshi + "\nBTC: " + wallet.bitcoin);
        }
    }
}

