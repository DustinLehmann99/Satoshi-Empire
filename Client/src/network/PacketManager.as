package network
{
    import models.MinerModel;
    import models.PlayerModel;
    import ui.managers.ModelManager;
    
    public class PacketManager
    {
        
        public function PacketManager()
        {
            super();
        }
        
        public function handle(data:Object) : void
        {
            switch(data.Type)
            {
                case "LoginResponse":
                    this.login(data);
                    break;
                case "PlayerStatusResponse":
                    this.playerStatus(data);
                    break;
                case "PlayerSync":
                    this.playerSync(data);
                    break;
                case "BuyMinerResponse":
					buyMiner(data);
					break;
				case "Error":
					error(data);
					break;
            }
        }
        
        private function updatePlayer(
			data:Object
		):void
		{
			parsePlayer(
				data.Player
			);
		
			ModelManager.notify(
				"Player"
			);
		}
        
        private function login(
			data:Object
		):void
		{
			updatePlayer(
				data
			);
		}
		
		private function error(
			data:Object
		):void
		{
			trace(
				"SERVER ERROR:",
				data.Message
			);
		}
		
		private function playerStatus(
			data:Object
		):void
		{
			updatePlayer(
				data
			);
		}
		
		
		private function playerSync(
			data:Object
		):void
		{
			updatePlayer(
				data
			);
		}
		
		private function buyMiner(
			data:Object
		):void
		{
			if(data.Success)
			{
				parsePlayer(
					data.Player
				);
		
		
				ModelManager.notify(
					"Player"
				);
			}
		}
        
        private function parsePlayer(data:Object) : void
        {
            var player:PlayerModel = null;
            var miner:Object = null;
            var model:MinerModel = null;
            player = ModelManager.player;
            player.id = data.Id;
            player.name = data.Name;
            player.created = data.Created;
            player.wallet.satoshi = data.Wallet.Satoshi;
            player.wallet.bitcoin = data.Wallet.Bitcoin;
            player.miners = [];
            for each(miner in data.Miners)
            {
                model = new MinerModel();
                model.id = miner.Id;
                model.name = miner.Name;
                model.hashrate = miner.Hashrate;
                model.efficiency = miner.Efficiency;
                model.condition = miner.Condition;
                model.lastReward = miner.LastReward;
				model.active = miner.Active;
                player.miners.push(model);
            }
        }
    }
}

