package  
{
	import flash.geom.Point;
	import flash.net.URLRequest;
	import flash.ui.Keyboard;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.textures.Texture;
	import flash.media.Sound;

	
	/**
	 * @author Forrest Townsend
	 */
	public class World
	{
		private var stage:Stage;
		
		private var peck_1:Peck;
		private var peck_2:Peck;
		private var player:Player;
		
		private var peckCounter:int;
		private var firstJump:Boolean;
		
		private var jumpSound:Sound;
		
		private var game:Game;
		
		//This will handle all of the continuous world and "stepping blocks"
		public function World(game:Game, stage:Stage) 
		{
			this.stage = stage;
			this.game = game;
			
			firstJump = true;
			
			player = new Player();
			player.x = 250;
			player.y = 600;
			
			peck_1 = new Peck(0);
			peck_2 = new Peck(1);
			
			peck_2.y = -860;
			
			peckCounter = 0;
			
			jumpSound = new Sound(new URLRequest("../assets/sounds/jump.mp3"));
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyPress);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyRelease);
		}
		
		public function onKeyPress(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.LEFT:
				case 65:
					player.setMoving(Player._LEFT);
					break;
					
				case Keyboard.RIGHT:
				case 68:
					player.setMoving(Player._RIGHT);
					break;
					
				case Keyboard.UP:
				case 87:
					if(player.getYVel() == 0 && player.getYAcc() == 0 && firstJump)
					{
						//jumpSound.play();
						player.setYVel(-30);
						player.setYAcc(2);
						firstJump = false;
					}
			}
		}
		
		public function onKeyRelease(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				case Keyboard.LEFT:
				case 65:
					player.setMoving(Player._STILL_L);
					break;
					
				case Keyboard.RIGHT:
				case 68:	
					player.setMoving(Player._STILL_R);
					break;
			}
		}
		
		public function update():void
		{	
			peckCheck();
			
			doCollisionDetection();
			
			if (firstJump == false && game.ground.y < 900)
				game.ground.y += peck_1.getYVel();
			
			player.update();
			
			doMotionSwitchCheck();
			
			peck_1.update();
			peck_2.update();
			
			checkSideBoundaries();
		}
		
		public function draw():void
		{	
			//draw player
			stage.addChild(peck_1);
			stage.addChild(peck_2);
			stage.addChild(player);
		}
		
		private function peckCheck():void
		{
			if(peck_1.y > 800)
			{
				stage.removeChild(peck_1);
				peck_1 = null;
				peck_1 = new Peck(peckCounter);
				peck_1.y = peck_2.y - 800;
				peckCounter++;
				stage.addChild(peck_1);
				stage.removeChild(player);
				stage.addChild(player);
			}
			
			
			if(peck_2.y > 800)
			{
				stage.removeChild(peck_2);
				peck_2 = null;
				peck_2 = new Peck(peckCounter + 1);
				peck_2.y = peck_1.y - 800;
				peckCounter++;
				stage.addChild(peck_2);
				stage.removeChild(player);
				stage.addChild(player);
			}
		}
		
		private function doCollisionDetection():void
		{
			if (player.falling) 
			{	
				for each (var p1:Platform in peck_1.getPlatformArray())
				{
					if (p1.isHidden() == false && playerCollision(p1)) 
					{
						jumpSound.play();
						player.setYVel(-30);
						player.setYAcc(2);
						p1.setHidden();
					}
				}
				
				for each (var p2:Platform in peck_2.getPlatformArray())
				{
					if (p2.isHidden() == false && playerCollision(p2)) 
					{
						jumpSound.play();
						player.setYVel(-30);
						player.setYAcc(2);
						p2.setHidden();
					}
				}
			}
		}
		
		private function playerCollision(plat:Platform):Boolean
		{
			return player.getStandBox().intersects(plat.getBounceBox()); 
		}
		
		private function doMotionSwitchCheck():void
		{
			if(peck_2.getYVel() < 0)
			{
				player.setYVel(-peck_2.getYVel());
				player.setYAcc(-peck_2.getYAcc());
				peck_1.setYVel(0);
				peck_1.setYAcc(0);
				peck_2.setYVel(0);
				peck_2.setYAcc(0);
			}
			
			if(peck_1.getYVel() < 0)
			{
				player.setYVel(-peck_1.getYVel());
				player.setYAcc(-peck_1.getYAcc());
				peck_1.setYVel(0);
				peck_1.setYAcc(0);
				peck_2.setYVel(0);
				peck_2.setYAcc(0);
			}
			
			else if(player.y < 320)
			{
				player.y = 320;
				peck_1.setYVel(-player.getYVel());
				peck_1.setYAcc(-player.getYAcc());
				peck_2.setYVel(-player.getYVel());
				peck_2.setYAcc( -player.getYAcc());
				player.setYVel(0);
				player.setYAcc(0);
			}
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
		
		public function getCounter():int
		{
			return -(peck_1.getYAcc() + peck_2.getYAcc());
		}
		
	}

}