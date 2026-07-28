package core
{
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class UpdateTimer
   {
      
      private var timer:Timer;
      
      public var onTick:Function;
      
      public function UpdateTimer()
      {
         super();
         this.timer = new Timer(1000);
         this.timer.addEventListener(TimerEvent.TIMER,this.tick);
      }
      
      public function start() : void
      {
         this.timer.start();
      }
      
      public function stop() : void
      {
         this.timer.stop();
      }
      
      private function tick(event:TimerEvent) : void
      {
         if(this.onTick != null)
         {
            this.onTick();
         }
      }
   }
}

