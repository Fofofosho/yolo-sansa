package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import starling.core.Starling;
	
	/**
	 * @usage
	 * 	Starts starling, and calls the Game class. Starter file.
	 * 
	 * @author
	 * 	Nakai McCarty
	 * 	Zack Smith
	 * 	Forrest Townsend
	 */
	public class Main extends Sprite 
	{
		private var _starling:Starling; 
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_starling = new Starling(Game, this.stage);
			_starling.start();
		}
		
	}
	
}