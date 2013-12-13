package  
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author Zack Smith
	 */
	public class Platform extends Sprite
	{
		private var jalapenoTexture:Texture;
		
		public function Platform() 
		{
			jalapenoTexture = AssetManager.getTexture("jalapeno");
			var image:Image = new Image(jalapenoTexture);
			this.addChild(image);
		}
		
	}

}