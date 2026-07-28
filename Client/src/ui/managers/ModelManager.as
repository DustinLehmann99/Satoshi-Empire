package ui.managers
{
    import events.ModelEvent;
    import flash.events.EventDispatcher;
    import models.PlayerModel;
    import models.ServerModel;
    
    public class ModelManager
    {
        
        public static var player:PlayerModel;
        
        public static var server:ServerModel;
        
        private static var dispatcher:EventDispatcher = new EventDispatcher();
        
        public function ModelManager()
        {
            super();
        }
        
        public static function initialize() : void
        {
            player = new PlayerModel();
            server = new ServerModel();
        }
        
        public static function notify(model:String) : void
        {
            dispatcher.dispatchEvent(new ModelEvent(model));
        }
        
        public static function addListener(type:String, listener:Function) : void
        {
            dispatcher.addEventListener(type,listener);
        }
        
        public static function removeListener(type:String, listener:Function) : void
        {
            dispatcher.removeEventListener(type,listener);
        }
    }
}

