package  
{
	import flash.geom.Point;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * @author Forrest Townsend
	 */
	public class Player extends Sprite
	{
		private var sombrero:Image;
		
		private var position:Point;
		private var velocity:Point;
		private var acceleration:Point;
		
		//This will handle the player and its interactions as well as movement
		public function Player() 
		{
			position = new Point();
			velocity = new Point();
			acceleration = new Point();
			
			sombrero = new Image(AssetManager.getTexture("sombrero"));
			position.x = this.x;
			position.y = this.y;
			sombrero.height = 128;
			sombrero.width = 128;
			
			addChild(sombrero);
		}
		
		public function update() : void
		{			
			
			this.x = position.x;
			this.y = position.y;
			
			velocity = velocity.add(acceleration);
			position = position.add(velocity);
			
			if(Math.abs(velocity.x) > 5)
			{
				if(velocity.x < 0)
					velocity.x = -5;
				else
					velocity.x = 5;
			}
			
			applyPhysics();
		}
		
		private function applyPhysics() : void
		{
			if(acceleration.x == 0)
			{
				velocity.x *= .9;
				
				if(velocity.x > -.5 && velocity.x < .5)
					velocity.x = 0;
			}
		}
		
		public function getPosition():Point
		{
			return position;
		}
		
		public function setPosition(newP:Point):void
		{
			position = newP;
			this.x = position.x;
			this.y = position.y;
		}
		
		public function getVelocity():Point
		{
			return velocity;
		}
		
		public function setVelocity(newV:Point):void
		{
			velocity = newV;
		}
	}

}