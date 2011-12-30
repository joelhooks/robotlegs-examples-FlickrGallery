package robotlegs.bender.demos.imagegallery.test.support
{
	import flash.events.Event;
	import flash.events.EventDispatcher;

	import mx.collections.ArrayCollection;

	import robotlegs.bender.demos.imagegallery.view.api.IGalleryView;

	public class MockGalleryView implements IGalleryView
	{
		private var _imageSource:String;

		public function get imageSource():String
		{
			return _imageSource;
		}

		[Bindable]
		public function set imageSource(v:String):void
		{
			_imageSource = v;
		}

		private var _dataProvider:ArrayCollection;

		public function get dataProvider():ArrayCollection
		{
			return _dataProvider;
		}

		[Bindable]
		public function set dataProvider(v:ArrayCollection):void
		{
			_dataProvider = v;
		}

		public var thumbScrollPosition:int;

		public function setThumbScrollPosition(position:int):void
		{
			thumbScrollPosition = position;
		}

		private var dispatcher:EventDispatcher = new EventDispatcher();

		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void
		{
			dispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}

		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void
		{
			dispatcher.removeEventListener(type, listener, useCapture);
		}

		public function dispatchEvent(event:Event):Boolean
		{
			return dispatcher.dispatchEvent(event);
		}

		public function hasEventListener(type:String):Boolean
		{
			return dispatcher.hasEventListener(type);
		}

		public function willTrigger(type:String):Boolean
		{
			return dispatcher.willTrigger(type);
		}
	}
}