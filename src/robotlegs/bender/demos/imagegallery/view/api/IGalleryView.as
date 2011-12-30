package robotlegs.bender.demos.imagegallery.view.api
{
	import flash.events.IEventDispatcher;

	import mx.collections.ArrayCollection;

	public interface IGalleryView extends IEventDispatcher
	{
		function get imageSource():String;

		function set imageSource(v:String):void;

		function get dataProvider():ArrayCollection;

		function set dataProvider(v:ArrayCollection):void;

		function setThumbScrollPosition(position:int):void;
	}
}