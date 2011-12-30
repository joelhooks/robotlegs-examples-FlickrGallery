package robotlegs.bender.demos.imagegallery.controller
{
	import robotlegs.bender.demos.imagegallery.model.GalleryModel;
	import robotlegs.bender.demos.imagegallery.view.events.GalleryEvent;

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