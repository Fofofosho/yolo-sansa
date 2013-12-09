package  
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * @usage
	 * 	Setup Game will initialize the screens and control the tick
	 * 
	 * @author 
	 * 	Nakai McCarty
	 * 	Zack Smith
	 * 	Forrest Townsend
	 */
	public class Game extends Sprite
	{
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		public function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//wham code
			trace("init removed");
		}
		
	}

}