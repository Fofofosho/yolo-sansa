package Screens 
{
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	/**
	 * @author Forrest Townsend
	 */
	
	public class MainMenu extends Sprite
	{
		
		private var background:Image = new Image(AssetManager.getTexture("menu.jpg"));
		
		public function MainMenu() 
		{
			this.addChild(background);
		}
		
	}

}