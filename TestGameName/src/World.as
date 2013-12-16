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
		
		
		private var stage:Stage;
		
		private var peck_1:Peck;
		private var peck_2:Peck;
		private var player:Player;
		
		
		//This will handle all of the continuous world and "stepping blocks"
		public function World(stage:Stage) 
		{
			this.stage = stage;
			
			player = new Player();
			player.x = 250;
			player.y = 600;
			
			peck_1 = new Peck();
			peck_2 = new Peck();
			
			peck_2.y = 800;
			
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
		}
		
		
		public function onKeyPress(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.LEFT:
					player.setMoving(Player._LEFT);
					break;
					
				case Keyboard.RIGHT:
					player.setMoving(Player._RIGHT);
					break;
					
				case Keyboard.UP:
					if(player.getYVel() == 0 && player.getYAcc() == 0)
					{
						player.setYVel(-30);
						player.setYAcc(2);
					}
			}
		}
		
		public function onKeyRelease(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.LEFT:
					player.setMoving(Player._STILL_L);
					break;
					
				case Keyboard.RIGHT:
					player.setMoving(Player._STILL_R);
					break;
			}
		}
		
		public function update():void
		{
			if (player.falling) 
			{	
				for each (var p1:Platform in peck_1.getPlatformArray())
				{
					trace('checking plats');
					if (playerCollision(player, p1)) 
					{
						player.setYVel(-30);
						player.setYAcc(2);
					}
				}
				
				for each (var p2:Platform in peck_2.getPlatformArray())
				{
					if (playerCollision(player, p2)) 
					{
						player.setYVel(-30);
						player.setYAcc(2);
					}
				}
			}
			
			player.update();
			
			checkSideBoundaries();
		}
		
		public function draw():void
		{	
			//draw player
			stage.addChild(peck_1);
			stage.addChild(peck_2);
			stage.addChild(player);
		}
		
		
		//check for collision between two objects
		/*private function collision(a:Object, b:Object):Boolean 
		{
			return a.getBounds(a.root).intersects(b.getBounds(b.root));
		}
		*/
		private function playerCollision(plr:Player, plat:Platform):Boolean
		{
			var p1:Point = new Point(plr.x, plr.y + plr.height);
			var p2:Point = new Point(plr.x + plr.width, plr.y + plr.height);
			
			if ((plat.x + 20 < p1.x) && (p1.x < (plat.x + plat.width)) && (plat.y + 20 < p1.y) && (p1.y < (plat.y + plat.height)))
			{
				trace('p1 collision');
				return true;
			}
			else if ((plat.x + 20 < p2.x) && (p2.x < (plat.x + plat.width)) && (plat.y + 20 < p2.y) && (p2.y < (plat.y + plat.height)))
			{
				trace('p2 collision');
				return true;
			}
			
			else return false;
		}
		
		public function checkPlayerDeath():Boolean
		{			
			if (player.y > 800) 
			{
				player.setYVel(0);
				player.setYAcc(0);
				stage.removeChild(peck_1);
				stage.removeChild(peck_2);
				stage.removeChild(player);
				return true;
			}
			
			else
				return false;
		}
		
		
		public function checkSideBoundaries():void 
		{
			if ((player.x + (player.width / 2)) < -25)
			{
				player.x = stage.stageWidth - (player.width / 2);
			}
				
			else if ((player.x + (player.width / 2)) > stage.stageWidth + 25) 
			{
				player.x = 0 - (player.width / 2);
			}
		}
		
	}

}