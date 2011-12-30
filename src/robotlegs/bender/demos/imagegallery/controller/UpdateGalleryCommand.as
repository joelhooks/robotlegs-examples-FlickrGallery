package robotlegs.bender.demos.imagegallery.controller
{
	import robotlegs.bender.demos.imagegallery.events.GalleryEvent;
	import robotlegs.bender.demos.imagegallery.model.GalleryModel;

	public class UpdateGalleryCommand
	{
		[Inject]
		public var event:GalleryEvent;

		[Inject]
		public var galleryModel:GalleryModel;

		public function execute():void
		{
			this.galleryModel.gallery = event.gallery;
		}
	}
}