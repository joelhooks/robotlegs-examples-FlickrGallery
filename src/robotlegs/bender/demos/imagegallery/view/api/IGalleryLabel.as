package robotlegs.bender.demos.imagegallery.view.api
{
	public interface IGalleryLabel
	{
		function get text():String;

		function set text(value:String):void;

		function set visible(value:Boolean):void;

		function set includeInLayout(value:Boolean):void;
	}
}