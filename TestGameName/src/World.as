package  
{
	import flash.geom.Point;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.textures.Texture;
	
	/**
	 * @author Forrest Townsend
	 */
	public class World extends Sprite
	{
		public var platformArray:Array;
		private var sprite:Sprite;
		private var platform:Platform;
		
		//This will handle all of the continuous world and "stepping blocks"
		public function World() 
		{
			trace("this happened");
			
			setupSpritesArray();
		}
		
		private function setupSpritesArray():void
		{
			for (var i:int = 0; i < 5; i++)
			{	
				platform.setXY( 
								new Point(
									Math.floor(Math.random() * 500) + 2, 
									Math.floor(Math.random() * 500) + 2
								)
							);
				platformArray[i] = sprite.addChild(platform.getImage());
			}
		}
		
		public function draw():void
		{
			for (var i:int = 0; i < 5; i++)
			{
				var s:Sprite = platformArray[i];
				addChild(s);
			}
		}
		
	}

}