package  
{
	import flash.geom.Point;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.textures.Texture;
	
	/**
	 * @author Forrest Townsend
	 */
	public class World
	{
		public var platformArray:Array;
		private var platform:Platform;
		private var stage:Stage;
		
		//This will handle all of the continuous world and "stepping blocks"
		public function World(stage:Stage) 
		{
			trace("this happened");
			this.stage = stage;
			setupSpritesArray();
		}
		
		private function setupSpritesArray():void
		{
			platformArray = new Array(5);
			for (var i:int = 0; i < 5; i++)
			{	
				platform = new Platform();
				//platform.setXY( 
								//new Point(
									//Math.floor(Math.random() * 500) + 2, 
									//Math.floor(Math.random() * 500) + 2
								//)
							//);
				platformArray.push(platform.getImage());
			}
		}
		
		public function draw():void
		{
			for each (var image:Image in platformArray)
			{
				stage.addChild(image);
			}
		}
		
	}

}