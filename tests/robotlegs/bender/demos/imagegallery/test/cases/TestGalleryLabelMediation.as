package robotlegs.bender.demos.imagegallery.test.cases
{
	import flash.events.Event;
	import flash.events.EventDispatcher;

	import flashx.textLayout.debug.assert;

	import mx.events.FlexEvent;

	import org.flexunit.Assert;
	import org.flexunit.assertThat;
	import org.hamcrest.object.equalTo;

	import robotlegs.bender.demos.imagegallery.test.support.MockGalleryLabel;

	import robotlegs.bender.demos.imagegallery.test.support.StubGalleryService;
	import robotlegs.bender.demos.imagegallery.view.GalleryLabelMediator;
	import robotlegs.bender.demos.imagegallery.view.api.IGalleryLabel;
	import robotlegs.bender.demos.imagegallery.view.events.GallerySearchEvent;
	import robotlegs.bender.extensions.eventMap.impl.EventMap;


	public class TestGalleryLabelMediation
	{
		private var galleryLabelMediator:GalleryLabelMediator;
		private var galleryLabel:IGalleryLabel;
		private var dispatcher:DispatchHelper;

		[Before]
		public function setUp():void
		{
			galleryLabel = new MockGalleryLabel();
			galleryLabelMediator = new GalleryLabelMediator();
			dispatcher = new DispatchHelper();

			galleryLabelMediator.setViewComponent(galleryLabel);
			galleryLabelMediator.galleryLabel = galleryLabel;
			galleryLabelMediator.eventDispatcher = dispatcher;
			galleryLabelMediator.eventMap = new EventMap(dispatcher);
			galleryLabelMediator.service = new StubGalleryService();

			galleryLabelMediator.initialize();
		}

		[Test]
		public function testMediatorHasViewComponent():void
		{
			Assert.assertNotNull( galleryLabelMediator.galleryLabel );
			Assert.assertNotNull( galleryLabelMediator.getViewComponent() );
		}

		[Test]
		public function galleryLabel_initializesWithDefaultText_textIsEqual():void
		{
			const initialText:String = "interestingness";

			assertThat(galleryLabel.text, equalTo(initialText));
		}

		[Test]
		public function textUpdatedAfterSearchEvent():void
		{
			const searchTerm:String = "robotlegs";
			var event:GallerySearchEvent = new GallerySearchEvent(GallerySearchEvent.SEARCH, "robotlegs");

			dispatcher.dispatchEvent(event);

			assertThat(galleryLabel.text, equalTo(searchTerm));
		}
	}
}

import flash.events.Event;
import flash.events.EventDispatcher;

import robotlegs.bender.demos.imagegallery.view.events.GallerySearchEvent;

internal class DispatchHelper extends EventDispatcher
{
	public var searchTerm:String;

	override public function dispatchEvent(event:Event):Boolean
	{
		if(event is GallerySearchEvent)
		{
			var searchEvent:GallerySearchEvent = event as GallerySearchEvent;
			searchTerm = searchEvent.searchTerm;

		}

		return super.dispatchEvent(event);
	}
}