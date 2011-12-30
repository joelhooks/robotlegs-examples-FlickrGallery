package robotlegs.bender.demos.imagegallery.controller
{
	import robotlegs.bender.demos.imagegallery.model.GalleryModel;
	import robotlegs.bender.demos.imagegallery.view.events.GalleryImageEvent;

	public class SetSelectedImageCommand
	{
		[Inject]
		public var event:GalleryImageEvent;

		[Inject]
		public var proxy:GalleryModel;

		public function execute():void
		{
			if(event.image)
				proxy.setSelectedImage(event.image);
		}
	}
}