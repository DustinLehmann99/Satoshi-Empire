package models
{
    public class MinerModel
    {
        public var id:String;
        
        public var name:String;
        
        public var hashrate:Number = 0;
        
        public var efficiency:Number = 0;
        
        public var condition:Number = 0;
        
        public var lastReward:Number = 0;
		
		public var active:Boolean = true;
        
        public function MinerModel()
        {
            super();
        }
    }
}

