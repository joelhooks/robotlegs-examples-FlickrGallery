package robotlegs.bender.demos.imagegallery.controller
{
	import robotlegs.bender.demos.imagegallery.events.GalleryEvent;
	import robotlegs.bender.demos.imagegallery.service.IGalleryImageService;

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