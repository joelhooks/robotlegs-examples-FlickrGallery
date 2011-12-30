package robotlegs.bender.demos.imagegallery.test.cases
{
	import org.flexunit.Assert;
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	import robotlegs.bender.demos.imagegallery.model.vo.Gallery;
	import robotlegs.bender.demos.imagegallery.model.vo.GalleryImage;
	import robotlegs.bender.demos.imagegallery.test.support.MockGalleryView;
	import robotlegs.bender.demos.imagegallery.view.GalleryViewMediator;
	import robotlegs.bender.demos.imagegallery.view.api.IGalleryView;
	import robotlegs.bender.demos.imagegallery.view.events.GalleryEvent;
	import robotlegs.bender.demos.imagegallery.view.events.GalleryImageEvent;
	import robotlegs.bender.extensions.eventMap.impl.EventMap;

	public class TestGalleryViewMediation
	{
		private var view:IGalleryView;
		private var mediator:GalleryViewMediator;
		private var dispatcher:DispatchHelper;

		[Before]
		public function setUp():void
		{
			view = new MockGalleryView();
			mediator = new GalleryViewMediator();
			dispatcher = new DispatchHelper();

			mediator.view = view;
			mediator.setViewComponent(view);
			mediator.eventDispatcher = dispatcher;
			mediator.eventMap = new EventMap(dispatcher);

			mediator.initialize();
		}

		[Test]
		public function testViewExists():void
		{
			Assert.assertNotNull( mediator.view );
			Assert.assertNotNull( mediator.getViewComponent() );
		}

		private static const TEST_URL:String = "http://www.example.com/nothing.jpg";

		[Test(async)]
		public function testImageSourceChangedOnSelect():void
		{
			var galleryImage:GalleryImage = new GalleryImage(TEST_URL);
			var event:GalleryImageEvent = new GalleryImageEvent(GalleryImageEvent.SELECT_GALLERY_IMAGE, galleryImage);

			view.dispatchEvent(event);

			assertThat(galleryImage.URL, equalTo(dispatcher.image.URL));
		}

		[Test]
		public function mediator_setsViewDataProviderOnGalleryLoadedEvent_dataProviderEqualToPhotosCollection():void
		{
			var gallery:Gallery = dispatchGalleryLoadedEventFromApplicationEventBus();

			assertThat(view.dataProvider,  equalTo(gallery.photos));
		}

		[Test]
		public function mediator_selectsFirstImageOnGalleryLoadedEvent_dataProviderEqualToPhotosCollection():void
		{
			var gallery:Gallery = dispatchGalleryLoadedEventFromApplicationEventBus();

			assertThat(view.imageSource, equalTo(gallery.photos[0].URL));
		}

		private function dispatchGalleryLoadedEventFromApplicationEventBus():Gallery
		{
			var gallery:Gallery = testGallery;
			var event:GalleryEvent = new GalleryEvent(GalleryEvent.GALLERY_LOADED, gallery);

			dispatcher.dispatchEvent(event);

			return gallery;
		}

		protected static function get testGallery():Gallery
		{
			var image1:GalleryImage = new GalleryImage(TEST_URL);
			var image2:GalleryImage = new GalleryImage(TEST_URL);
			var gallery:Gallery = new Gallery();

			gallery.photos.addItem(image1);
			gallery.photos.addItem(image2);

			return gallery;
		}
	}
}

import flash.events.Event;
import flash.events.EventDispatcher;

import robotlegs.bender.demos.imagegallery.model.vo.Gallery;
import robotlegs.bender.demos.imagegallery.model.vo.GalleryImage;
import robotlegs.bender.demos.imagegallery.view.events.GalleryEvent;
import robotlegs.bender.demos.imagegallery.view.events.GalleryImageEvent;

internal class DispatchHelper extends EventDispatcher
{
	public var image:GalleryImage;
	public var gallery:Gallery;

	override public function dispatchEvent(event:Event):Boolean
	{
		if(event is GalleryEvent)
		{
			gallery = GalleryEvent(event).gallery;
		}
		else if(event is GalleryImageEvent)
		{
			image = GalleryImageEvent(event).image;
		}

		return super.dispatchEvent(event);
	}

	override public function hasEventListener(type:String):Boolean
	{
		return true;
	}
}