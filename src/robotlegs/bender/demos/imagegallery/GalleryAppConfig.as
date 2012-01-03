package robotlegs.bender.demos.imagegallery
{
	import org.swiftsuspenders.Injector;

	import robotlegs.bender.core.api.*;
	import robotlegs.bender.demos.imagegallery.controller.*;
	import robotlegs.bender.demos.imagegallery.model.GalleryModel;
	import robotlegs.bender.demos.imagegallery.service.*;
	import robotlegs.bender.demos.imagegallery.view.*;
	import robotlegs.bender.demos.imagegallery.view.api.*;
	import robotlegs.bender.demos.imagegallery.view.events.*;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;

	public class GalleryAppConfig implements IContextConfig
	{
		[Inject]
		public var mediatorMap:IMediatorMap;

		[Inject]
		public var commandMap:IEventCommandMap;

		[Inject]
		public var injector:Injector;

		public function configure(context:IContext):void
		{
			mediatorMap.map(IGalleryView).toMediator(GalleryViewMediator);
			mediatorMap.map(IGallerySearch).toMediator(GallerySearchMediator);
			mediatorMap.map(IGalleryLabel).toMediator(GalleryLabelMediator);

			injector.map(GalleryModel).asSingleton();
			injector.map(IGalleryImageService).toSingleton(FlickrImageService);

			commandMap.map(GalleryEvent.GALLERY_LOADED, GalleryEvent).toCommand(UpdateGalleryCommand);
			commandMap.map(GalleryImageEvent.SELECT_GALLERY_IMAGE, GalleryImageEvent).toCommand(SetSelectedImageCommand);
			commandMap.map(GalleryEvent.LOAD_GALLERY, GalleryEvent).toCommand(LoadGalleryCommand);
			commandMap.map(GallerySearchEvent.SEARCH, GallerySearchEvent).toCommand(LoadSearchGalleryCommand);
		}
	}
}