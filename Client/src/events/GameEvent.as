package events
{
   import flash.events.Event;
   
   public class GameEvent extends Event
   {
      
      public var data:Object;
      
      public function GameEvent(type:String, data:Object)
      {
         super(type);
         this.data = data;
      }
      
      override public function clone() : Event
      {
         return new GameEvent(type,this.data);
      }
   }
}

