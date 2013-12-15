package  
{
	import starling.display.Image;
	import starling.display.Sprite;
	
	/**
	 * @author Forrest Townsend
	 */
	public class Player extends Sprite
	{
		private var sombrero:Image;
		
		//This will handle the player and its interactions as well as movement
		public function Player() 
		{
			sombrero = new Image(AssetManager.getTexture("sombrero"));
			sombrero.x = 250;
			sombrero.y = 600;
			sombrero.height = 128;
			sombrero.width = 128;
		}
		
		public function getPlayerImage():Image
		{
			return sombrero;
		}
	}

}