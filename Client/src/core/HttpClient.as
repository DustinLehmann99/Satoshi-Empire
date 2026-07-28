package core
{
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.net.URLLoader;
    import flash.net.URLRequest;
    import flash.net.URLRequestHeader;
    import flash.net.URLRequestMethod;
    import network.PacketManager;
    
    public class HttpClient
    {
        
        public var onResponse:Function;
        
        private var packets:PacketManager;
        
        private var url:String = "http://localhost:8080/";
        
        public function HttpClient()
        {
            super();
            this.packets = new PacketManager();
        }
        
        public function connect(playerId:String) : void
        {
            var packet:Object =
			{
				Type:"Login",
			
				PlayerId:playerId,
			
				Version:
					ClientConfig.VERSION
			};
            this.send(packet);
        }
        
        private function send(packet:Object) : void
        {
            var request:URLRequest = new URLRequest(this.url);
            request.method = URLRequestMethod.POST;
            request.requestHeaders = [new URLRequestHeader("Content-Type","application/json")];
            request.data = JSON.stringify(packet);
            var loader:URLLoader = new URLLoader();
            loader.addEventListener(Event.COMPLETE,this.received);
            loader.addEventListener(IOErrorEvent.IO_ERROR,this.error);
            loader.load(request);
        }
        
        public function requestStatus(playerId:String) : void
        {
            var packet:Object = {
                "Type":"PlayerStatus",
                "PlayerId":playerId
            };
            this.send(packet);
        }
        
        private function received(event:Event) : void
        {
            var data:Object = JSON.parse(event.target.data);
            this.packets.handle(data);
        }
        
        private function error(event:IOErrorEvent) : void
        {
            trace("Connection failed");
        }
        
        public function get packetManager() : PacketManager
        {
            return this.packets;
        }
        
        public function handshake():void
		{
			var packet:Object =
			{
				Type:"Handshake",
		
				Version:
					ClientConfig.VERSION
			};
		
		
			send(packet);
		}
        
        public function playerSync(
			playerId:String
		):void
		{
			var packet:Object =
			{
				Type:"PlayerSync",
				PlayerId:playerId
			};
			send(packet);
		}
    }
}

