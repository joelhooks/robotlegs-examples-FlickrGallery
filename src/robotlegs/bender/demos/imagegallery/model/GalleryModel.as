/*
	Inversion of Control/Dependency Injection Using Robotlegs
	Image Gallery

	Any portion of this demonstration may be reused for any purpose where not
	licensed by another party restricting such use. Please leave the credits intact.

	Joel Hooks
	http://joelhooks.com
	joelhooks@gmail.com
*/
package robotlegs.bender.demos.imagegallery.model
{
	import robotlegs.bender.demos.imagegallery.base.BaseActor;
	import robotlegs.bender.demos.imagegallery.model.vo.Gallery;
	import robotlegs.bender.demos.imagegallery.model.vo.GalleryImage;

	public class GalleryModel extends BaseActor
	{
		private var _gallery:Gallery;

		public function get gallery():Gallery
		{
			return _gallery;
		}

		public function set gallery(v:Gallery):void
		{
			_gallery = v;

		}

		public function setSelectedImage(selectedImage:GalleryImage):void
		{
			selectedImage.selected = true;
			for each(var image:GalleryImage in _gallery.photos)
			{
				if(image != selectedImage)
					image.selected = false;
			}
		}
	}
}