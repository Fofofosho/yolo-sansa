package Screens 
{
	import starling.display.Image;
	import starling.display.Sprite;
	/**
	 * @author Forrest Townsend
	 */
	public class Credits extends Sprite
	{
		
		public function Credits() 
		{
			addChild(new Image(AssetManager.getTexture("credits")));
		}
		
		public function removeScreen():void
		{
			removeChild(this);
		}
		
	}

}