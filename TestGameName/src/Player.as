package  
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * @author Forrest Townsend
	 */
	public class Player extends Sprite
	{
		public static const _LEFT:int = -2;
		public static const _STILL_L:int = -1;
		public static const _STILL:int = 0;
		public static const _STILL_R:int = 1;
		public static const _RIGHT:int = 2;
		
		private var sombrero:Image;
		
		private var yVel:int;
		private var yAcc:int;
		private var moving:int;
		public var falling:Boolean;
		
		private var standBox:Quad;
		
		//This will handle the player and its interactions as well as movement
		public function Player() 
		{
			yVel = 0;
			yAcc = 0;
			
			sombrero = new Image(AssetManager.getTexture("sombrero"));
			sombrero.height = 80;
			sombrero.width = 104;
			
			standBox = new Quad(60, 20, 0xabcdef, true);
			standBox.x = 25;
			standBox.y = 60;
			standBox.alpha = 0;
			addChild(standBox);
			
			addChild(sombrero);
			moving = _STILL;
		}
		
		public function update() : void
		{	
			switch(moving)
			{
				case _STILL:
					break;
				case _LEFT:
					this.x -= 10;
					break;
				case _RIGHT:
					this.x += 10;
					break;
			}
			
			yVel = yVel + yAcc;
			this.y = this.y + yVel;
			
			applyPhysics();
		}
		
		private function applyPhysics() : void
		{
			if(yAcc < 0)
			{
				yAcc = 0;
			}
			
			if(yAcc >= 0)
			{
				if(yAcc > 3)					
				{
					yAcc = 3;
				}
					
				
			}
			
			if(yVel > 0)
			{
				falling = true;
				
				if(yVel > 20)
					yVel = 20;
			}
			
			if(yVel <= 0)
			{
				falling = false;
			}
		}
		
		public function getStandBox():Rectangle
		{
			return standBox.getBounds(this.parent);
		}
		
		public function setMoving(newMov:int):void
		{
			if(moving == _LEFT && newMov == _STILL_L)
				moving = _STILL;
			else if(moving == _RIGHT && newMov == _STILL_R)
				moving = _STILL;
			else if(moving == _STILL && (newMov == _LEFT || newMov == _RIGHT))
				moving = newMov;
		}
		
		public function isFalling():Boolean
		{
			return falling;
		}
		
		public function getYVel():int
		{
			return yVel;
		}
		
		public function setYVel(newYVel:int):void
		{
			yVel = newYVel;
		}
		
		public function getYAcc():int
		{
			return yAcc;
		}
		
		public function setYAcc(newYAcc:int):void
		{
			yAcc = newYAcc;
		}
	}

}