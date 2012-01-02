package robotlegs.bender.demos.imagegallery.service
{
	import mx.rpc.AsyncToken;
	import mx.rpc.Responder;
	import mx.rpc.http.HTTPService;
	import robotlegs.bender.demos.imagegallery.base.BaseActor;
	import robotlegs.bender.demos.imagegallery.view.events.GalleryEvent;
	import robotlegs.bender.demos.imagegallery.model.vo.Gallery;
	import robotlegs.bender.demos.imagegallery.model.vo.GalleryImage;

	public class XMLImageService extends BaseActor implements IGalleryImageService
	{
		protected static const BASE_URL:String = "assets/gallery/";

		public function XMLImageService()
		{
			super();
		}

		public function get searchAvailable():Boolean
		{
			return false;
		}

		public function loadGallery():void
		{
			var service:HTTPService = new HTTPService();
			var responder:Responder = new Responder(handleServiceResult, handleServiceFault);
			var token:AsyncToken;
			service.resultFormat = "e4x";
			service.url = BASE_URL+"gallery.xml";
			token = service.send();
			token.addResponder(responder);
		}

		public function search(searchTerm:String):void
		{
			trace("search is not available");
		}

		protected function handleServiceResult(event:Object):void
		{
			var gallery:Gallery = new Gallery();

			for each(var image:XML in event.result.image)
			{
				var photo:GalleryImage = new GalleryImage()
				photo.thumbURL = BASE_URL + "images/" + image.@name + '_s.jpg';
				photo.URL = BASE_URL + "images/" + image.@name + '.jpg';
				gallery.photos.addItem( photo );
			}

			dispatch(new GalleryEvent(GalleryEvent.GALLERY_LOADED, gallery));
		}

		protected function handleServiceFault(event:Object):void
		{
			trace(event);

		}
	}
}