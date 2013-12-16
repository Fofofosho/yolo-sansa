package  
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.textures.Texture;
	import starling.events.Event;
	
	/**
	 * @author Zack Smith
	 */
	
	 //We need a way to have an array of sprites or images that can be altered later.
	public class Platform extends Sprite
	{
		private var jalapeno:Image;
		private var bounceBox:Quad;
		
		public function Platform(_x:int, _y:int) 
		{
			jalapeno = new Image(AssetManager.getTexture("jalapeno"));
			this.x = _x;
			this.y = _y;
			
			bounceBox = new Quad(90, 25, 0xfedcba, true);
			bounceBox.x = 28;
			bounceBox.y = 22;
			bounceBox.alpha = 0;
			addChild(bounceBox);
			addChild(jalapeno);
		}
		
		public function getBounceBox():Rectangle
		{
			return bounceBox.getBounds(this.parent.parent);
		}
		
		public function setRandomX():void
		{
			this.x = Math.floor(Math.random() * 380) + 2;
		}
		
		public function getImage():Image
		{
			return jalapeno;
		}
		
		public function getX():Number
		{
			return jalapeno.x;
		}
		
		public function getY():Number
		{
			return jalapeno.y;
		}
		
		public function getXY():Point
		{
			return new Point(jalapeno.x, jalapeno.y);
		}
		
		public function setX(newX:int):void
		{
			jalapeno.x = newX;
		}
		
		public function setY(newY:int):void
		{
			jalapeno.y = newY;
		}
		
		public function setXY(point:Point):void
		{
			jalapeno.x = point.x;
			jalapeno.y = point.y;
		}
	
	}

}