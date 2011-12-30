package robotlegs.bender.demos.imagegallery.test.support
{
	import robotlegs.bender.demos.imagegallery.service.IGalleryImageService;

	public class StubGalleryService implements IGalleryImageService
	{
		public function loadGallery():void
		{
		}

		public function search(searchTerm:String):void
		{
		}

		public function get searchAvailable():Boolean
		{
			return false;
		}
	}
}