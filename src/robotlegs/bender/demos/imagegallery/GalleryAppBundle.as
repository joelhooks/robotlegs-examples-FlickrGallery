package robotlegs.bender.demos.imagegallery
{
	import robotlegs.bender.bundles.classic.ClassicRobotlegsBundle;
	import robotlegs.bender.core.api.IContextBuilder;
	import robotlegs.bender.core.api.IContextBuilderBundle;

	public class GalleryAppBundle implements IContextBuilderBundle
	{
		public function install(builder:IContextBuilder):void
		{
			builder
				.withBundle(ClassicRobotlegsBundle)
				.withConfig(GalleryAppConfig);
		}
	}
}