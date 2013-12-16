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
		
		private var numPlats:Number;
		//This will handle all of the continuous world and "stepping blocks"
		public function World(stage:Stage) 
		{
			trace("this happened");
			this.stage = stage;
			
			player = new Player();
			player.setPosition(new Point(250, 600));
			
			numPlats = 5;
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
			setupSpritesArray();
		}
		
		private function setupSpritesArray():void
		{
			platformArray = new Array(numPlats);
			for (var i:int = 0; i < numPlats; i++)
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
			//if (player.isFalling()) 
			//{	
				//for each (var plat:Platform in platformArray)
				//{
					//if (collision(player, plat)) 
					//{
						//set player y velocity to a positive value
					//}
				//}
			//}
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
		
		
		//check for collision between two objects
		private function collision(a:Object, b:Object):Boolean 
		{
			return a.getBounds(a.root).intersects(b.getBounds(b.root));
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
			if ((player.getPosition().x + (player.width / 2)) < -25)
			{
				player.setPosition(new Point(stage.stageWidth - (player.width / 2), player.getPosition().y));
			}
				
			else if ((player.getPosition().x + (player.width / 2)) > stage.stageWidth + 25) 
			{
				player.setPosition(new Point(0 - (player.width / 2), player.getPosition().y));
			}
		}
		
	}

}