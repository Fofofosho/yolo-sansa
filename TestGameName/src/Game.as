package  
{
	import adobe.utils.CustomActions;
	import flash.events.TimerEvent;
	import flash.ui.KeyLocation;
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.utils.Timer;
	import starling.events.KeyboardEvent;
	
	/**
	 * @usage
	 * 	Game will initialize/setup the screens and handle the update
	 * 
	 * @author 
	 * 	Nakai McCarty
	 * 	Zack Smith
	 * 	Forrest Townsend
	 */
	public class Game extends Sprite
	{
		
		private const _INIT:Number 		= 1;
		private const _RUNNING:Number 	= 2;
		private const _PAUSED:Number	= 3;
		private const _LOSE:Number		= 4;
		private const _WIN:Number		= 5;
		
		private var state:Number;
		
		private var timer:Timer;
		private var numTicks:Number;
		
		private const btn:KeyboardEvent = new KeyboardEvent("Exit", 0, 51);
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			addEventListener(KeyboardEvent.KEY_DOWN, quitGame);
			state = _INIT;
			
			//FOR DEBUG>>
			trace("menu");
			
			numTicks = 0;
			
			timer = new Timer(1000 / 30, 0);
			timer.addEventListener(TimerEvent.TIMER, update);
			timer.start();
		}
		
		private function update(event:TimerEvent):void
		{
			switch (state)
			{
				//Menu State
				case _INIT:
				{
					/*
					Make the main menu and add an event listener for which is selected
					Allow the use of the UP,DOWN arrows to change which is selected.
					We will need buttons that have a 
					>>	Normal, highlighted (when selected), and pressed form
					*/
					
				}
				
				//Actual gameplay
				case _RUNNING:
				{
					
				}
				
				//When game is paused
				case _PAUSED:
				{
					
				}
				
				//When the player dies
				case _LOSE:
				{
					
				}
				
				//When the player wins
				case _WIN:
				{
					
				}
				
			}
			numTicks++;
		}
		
		//... i assume your button is in a variable btn
		btn.addEventListener(Event.TRIGGERED, onCloseBtn);//this is starling.event.Event
		//...
		protected function onCloseBtn(_e:Event)
		{
			Starling.current.dispatchEventWith(Main.EVT_CLOSEAPP);
		}
		
		
	}

}