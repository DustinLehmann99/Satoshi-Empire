package ui.modules
{
    import events.ModelEvent;
    import ui.managers.ModelManager;
    import ui.modules.components.PlayerCard;
    import ui.modules.components.WalletCard;
    import ui.modules.components.MinerList;
    
    public class DashboardModule extends Module
    {
        
        private var playerCard:PlayerCard;
        
        private var walletCard:WalletCard;
        
        private var minerList:MinerList;
        
        public function DashboardModule()
        {
            super("Dashboard");
            this.build();
            ModelManager.addListener(ModelEvent.UPDATED,this.updated);
        }
        
        private function build() : void
        {
            this.playerCard = new PlayerCard();
            this.playerCard.x = 15;
            this.playerCard.y = 45;
            addChild(this.playerCard);
            this.walletCard = new WalletCard();
            this.walletCard.x = 260;
            this.walletCard.y = 45;
            addChild(this.walletCard);
            minerList =
				new MinerList();
			
			minerList.x =
				15;
			
			minerList.y =
				150;
			
			
			addChild(
				minerList
			);
        }
        
        override public function refresh() : void
        {
            this.playerCard.refresh();
            this.walletCard.refresh();
            minerList.refresh(
				ModelManager.player
			);
        }
        
        private function updated(event:ModelEvent) : void
        {
            if(event.model == "Player")
            {
                this.refresh();
            }
        }
    }
}

