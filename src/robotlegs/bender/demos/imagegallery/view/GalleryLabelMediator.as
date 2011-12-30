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
	import robotlegs.bender.demos.imagegallery.view.api.IGalleryLabel;
	import robotlegs.bender.demos.imagegallery.view.events.GallerySearchEvent;
	import robotlegs.bender.extensions.mediatorMap.impl.Mediator;

	public class GalleryLabelMediator extends Mediator
	{
		[Inject]
		public var galleryLabel:IGalleryLabel;

		[Inject]
		public var service:IGalleryImageService;

		override public function initialize():void
		{
			setLabelText("interestingness");
			addContextListener( GallerySearchEvent.SEARCH, handleSearch, GallerySearchEvent );

			galleryLabel.visible = galleryLabel.includeInLayout = service.searchAvailable;
		}

		protected function setLabelText(value:String):void
		{
			this.galleryLabel.text = value;
		}

		protected function handleSearch(event:GallerySearchEvent):void
		{
			setLabelText(event.searchTerm);
		}
	}
}