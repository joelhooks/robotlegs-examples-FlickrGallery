package robotlegs.bender.demos.imagegallery.base
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	/**
	 * Provides some common functionality for basic application classes (models and services)
	 */
	public class BaseActor
	{
		[Inject]
		public var eventDispatcher:IEventDispatcher;

		protected function dispatch(e:Event):void
		{
			if(eventDispatcher.hasEventListener(e.type))
				eventDispatcher.dispatchEvent(e);
		}
	}
}