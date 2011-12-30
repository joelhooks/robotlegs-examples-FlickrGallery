package robotlegs.bender.demos.imagegallery.test.services
{
	import flash.events.EventDispatcher;

	import robotlegs.bender.demos.imagegallery.events.GalleryEvent;
	import robotlegs.bender.demos.imagegallery.service.services.IGalleryImageService;
	import org.robotlegs.mvcs.Service;

	public class ImageGalleryDummyService extends Service implements IGalleryImageService
	{
		public function ImageGalleryDummyService()
		{
		}

		public function loadGallery():void
		{
			this.dispatcher.dispatchEvent(new GalleryEvent(GalleryEvent.GALLERY_LOADED))
		}

		public function search(searchTerm:String):void
		{
			this.dispatcher.dispatchEvent(new GalleryEvent(GalleryEvent.GALLERY_LOADED))
		}
	}
}