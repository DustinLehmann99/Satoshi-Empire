package events
{
    import flash.events.Event;

    public class ModelEvent extends Event
    {
        public static const UPDATED:String="modelUpdated";

        public var model:String;

        public function ModelEvent(model:String)
        {
            super(UPDATED);
            this.model=model;
        }

        override public function clone():Event
        {
            return new ModelEvent(model);
        }
    }
}