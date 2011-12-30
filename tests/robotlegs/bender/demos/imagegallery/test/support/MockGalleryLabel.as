package robotlegs.bender.demos.imagegallery.test.support
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;

	import robotlegs.bender.demos.imagegallery.view.api.IGalleryLabel;

	public class MockGalleryLabel implements IGalleryLabel, IEventDispatcher
	{
		private var _text:String;

		public function get text():String
		{
			return _text;
		}

		public function set text(value:String):void
		{
			_text = value;
		}

		public function set visible(value:Boolean):void
		{
		}

		public function set includeInLayout(value:Boolean):void
		{
		}

		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
		}

		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
		}

		public function dispatchEvent(event:Event):Boolean
		{
			return false;
		}

		public function hasEventListener(type:String):Boolean
		{
			return false;
		}

		public function willTrigger(type:String):Boolean
		{
			return false;
		}
	}
}