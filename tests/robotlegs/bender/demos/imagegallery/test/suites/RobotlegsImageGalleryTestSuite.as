package robotlegs.bender.demos.imagegallery.test.suites
{
	import robotlegs.bender.demos.imagegallery.test.cases.TestGalleryLabelMediation;
	import robotlegs.bender.demos.imagegallery.test.cases.TestGalleryModel;
	import robotlegs.bender.demos.imagegallery.test.cases.TestGalleryViewMediation;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class RobotlegsImageGalleryTestSuite
	{
		public var testGalleryModel:TestGalleryModel;
		public var testGalleryLabel:TestGalleryLabelMediation;
		public var testGalleryViewMediation:TestGalleryViewMediation;
	}
}