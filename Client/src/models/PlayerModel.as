package models
{
    public class PlayerModel
    {
        
        public var id:String;
        
        public var name:String;
        
        public var created:String;
        
        public var wallet:WalletModel;
        
        public var miners:Array;
        
        public function PlayerModel()
        {
            super();
            this.wallet = new WalletModel();
            this.miners = [];
        }
    }
}

