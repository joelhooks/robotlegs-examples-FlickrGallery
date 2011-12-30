package robotlegs.bender.demos.imagegallery.controller
{
	import robotlegs.bender.demos.imagegallery.service.IGalleryImageService;
	import robotlegs.bender.demos.imagegallery.view.events.GalleryEvent;

	public class LoadGalleryCommand
	{
		[Inject]
		public var event:GalleryEvent;

		[Inject]
		public var service:IGalleryImageService;

		public function execute():void
		{
			service.loadGallery();
		}
	}
}