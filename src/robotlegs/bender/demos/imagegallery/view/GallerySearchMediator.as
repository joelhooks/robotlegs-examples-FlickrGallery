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
	import robotlegs.bender.demos.imagegallery.service.IGalleryImageService;
	import robotlegs.bender.demos.imagegallery.view.api.IGallerySearch;
	import robotlegs.bender.demos.imagegallery.view.events.GallerySearchEvent;
	import robotlegs.bender.extensions.mediatorMap.impl.Mediator;

	public class GallerySearchMediator extends Mediator
	{
		[Inject]
		public var gallerySearch:IGallerySearch;

		[Inject]
		public var service:IGalleryImageService;

		override public function initialize():void
		{
			addViewListener( GallerySearchEvent.SEARCH, handleSearch, GallerySearchEvent );

			gallerySearch.visible = gallerySearch.includeInLayout = service.searchAvailable;
		}

		protected function handleSearch(event:GallerySearchEvent):void
		{
			dispatch( event );
		}
	}
}