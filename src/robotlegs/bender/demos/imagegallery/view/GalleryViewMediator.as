/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery

	Any portion of this demonstration may be reused for any purpose where not
	licensed by another party restricting such use. Please leave the credits intact.

	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com
*/
package robotlegs.bender.demos.imagegallery.view
{
	import robotlegs.bender.demos.imagegallery.model.vo.GalleryImage;
	import robotlegs.bender.demos.imagegallery.view.api.IGalleryView;
	import robotlegs.bender.demos.imagegallery.view.events.GalleryEvent;
	import robotlegs.bender.demos.imagegallery.view.events.GalleryImageEvent;
	import robotlegs.bender.demos.imagegallery.view.events.GallerySearchEvent;
	import robotlegs.bender.extensions.mediatorMap.impl.Mediator;

	public class GalleryViewMediator extends Mediator
	{
		[Inject]
		public var view:IGalleryView;

		override public function initialize():void
		{
			addViewListener( GalleryImageEvent.SELECT_GALLERY_IMAGE, onImageSelected, GalleryImageEvent);
			addContextListener( GalleryEvent.GALLERY_LOADED, onGalleryLoaded, GalleryEvent);
			addContextListener( GallerySearchEvent.SEARCH, onSearch, GallerySearchEvent);

			dispatch( new GalleryEvent( GalleryEvent.LOAD_GALLERY ) );
		}

		protected function selectImage(image:GalleryImage):void
		{
			view.imageSource = image.URL;
			dispatch(new GalleryImageEvent(GalleryImageEvent.SELECT_GALLERY_IMAGE, image));
		}

		protected function onGalleryLoaded(event:GalleryEvent):void
		{
			view.dataProvider = event.gallery.photos;
			selectImage( event.gallery.photos[0] as GalleryImage );
		}

		protected function onImageSelected(event:GalleryImageEvent):void
		{
			selectImage(event.image);
		}

		protected function onSearch(event:GallerySearchEvent):void
		{
			view.setThumbScrollPosition(0);
		}
	}
}