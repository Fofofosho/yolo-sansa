package  
{
	import flash.geom.Point;
	import starling.display.Image;
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
		
		public function Platform() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			jalapeno = new Image(AssetManager.getTexture("jalapeno"));
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