package core
{
    import flash.utils.Timer;
    import flash.events.TimerEvent;

    public class SyncManager
    {
        private var timer:Timer;
        private var http:HttpClient;
        private var playerId:String;


        public function SyncManager(
            httpClient:HttpClient,
            id:String
        )
        {
            http = httpClient;
            playerId = id;


            timer =
                new Timer(
                    1000
                );


            timer.addEventListener(
                TimerEvent.TIMER,
                sync
            );
        }


        public function start():void
        {
            timer.start();

            sync(null);
        }


        private function sync(
            event:TimerEvent
        ):void
        {
            http.playerSync(
                playerId
            );
        }
    }
}