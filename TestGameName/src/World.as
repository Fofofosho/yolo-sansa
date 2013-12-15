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
		
		private var stage:Stage;
		
		private var platform:Platform;
		private var player:Player;
		
		//This will handle all of the continuous world and "stepping blocks"
		public function World(stage:Stage) 
		{
			trace("this happened");
			this.stage = stage;
			setupSpritesArray();
			
			player = new Player();
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
			
			//draw player
			stage.addChild(player.getPlayerImage());
		}
		
		
		public function checkPlayerDeath():Boolean
		{
			if (player.getPosition().Y > stage.height) 
			{
				return true;
			}
			
			else return false;
		}
		
		
		public function checkSideBoundaries():void 
		{
			if ((player.getPosition().X + (player.width / 2)) < 0)
			{
				player.setPosition(new Point(stage.width - (player.width / 2), player.getPosition().Y));
			}
				
			if ((player.getPosition().X + (player.width / 2)) > stage.width) 
			{
				player.setPosition(new Point(0 - (player.width / 2), player.getPosition().Y));
			}
		}
		
	}

}