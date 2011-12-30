package robotlegs.bender.demos.imagegallery.controller
{
	import robotlegs.bender.demos.imagegallery.service.IGalleryImageService;
	import robotlegs.bender.demos.imagegallery.view.events.GallerySearchEvent;

	public class LoadSearchGalleryCommand
	{
		[Inject]
		public var event:GallerySearchEvent;

		[Inject]
		public var service:IGalleryImageService;

		public function execute():void
		{
			service.search(event.searchTerm);
		}
	}
}