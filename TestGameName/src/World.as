package  
{
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
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
			
			player = new Player();
			player.setPosition(new Point(250, 600));
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
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
		
		public function onKeyPress(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.LEFT:
					player.setAcceleration(new Point(-5, 0));
					break;
					
				case Keyboard.RIGHT:
					player.setAcceleration(new Point(5, 0));
					break;
			}
		}
		
		public function onKeyRelease(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.LEFT:
					player.setAcceleration(new Point());
					break;
					
				case Keyboard.RIGHT:
					player.setAcceleration(new Point());
					break;
			}
		}
		
		public function update():void
		{
			player.update();
		}
		
		public function draw():void
		{
			for each (var image:Image in platformArray)
			{
				stage.addChild(image);
			}
			
			//draw player
			stage.addChild(player);
		}
		
		
		public function checkPlayerDeath():Boolean
		{
			if (player.getPosition().y > stage.height) 
			{
				return true;
			}
			
			else return false;
		}
		
		
		public function checkSideBoundaries():void 
		{
			if ((player.getPosition().x + (player.width / 1.8)) < 0)
			{
				player.setPosition(new Point(stage.stageWidth - (player.width / 6), player.getPosition().y));
			}
				
			else if ((player.getPosition().x + (player.width / 1.8)) > stage.stageWidth) 
			{
				player.setPosition(new Point(0 - (player.width / 6), player.getPosition().y));
			}
		}
		
	}

}