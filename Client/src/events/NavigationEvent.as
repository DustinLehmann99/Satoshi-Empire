package events
{
   import flash.events.Event;
   
   public class NavigationEvent extends Event
   {
      
      public static const SELECTED:String = "navigationSelected";
      
      public var destination:String;
      
      public function NavigationEvent(destination:String)
      {
         super(SELECTED);
         this.destination = destination;
      }
      
      override public function clone() : Event
      {
         return new NavigationEvent(this.destination);
      }
   }
}

