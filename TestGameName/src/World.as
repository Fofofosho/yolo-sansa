package  
{
	import starling.display.Sprite;
	import starling.textures.Texture;
	/**
	 * @author Forrest Townsend
	 */
	public class World extends Sprite
	{
		
		//This will handle all of the continuous world and "stepping blocks"
		public function World() 
		{
			trace("this happened");
			var platform:Platform = new Platform();
			this.addChild(platform);
		}
		
		public function draw():void
		{
			
		}
		
	}

}