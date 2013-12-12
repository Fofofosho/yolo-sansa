package  
{
	import adobe.utils.CustomActions;
	import flash.events.TimerEvent;
	import flash.ui.KeyLocation;
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.utils.Timer;
	import starling.events.KeyboardEvent;
	import flash.system.System;
	
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
		
		public function Game() 
		{
			super();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			//Adds functionality to quit the game if "3/MENU BTN" is pushed
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onCloseBtn);
			
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
					//do the collision detection and updating of 
					//	characters/objects on the screen
					
				}
				
				//When game is paused
				case _PAUSED:
				{
					//might not need this case
				}
				
				//When the player dies
				case _LOSE:
				{
					//Show game over screen, replay? continue? or boot back to main menu
				}
				
				//When the player wins
				case _WIN:
				{
					//Game over but happy version
				}
				
			}
			
			numTicks++;
			
		}
		
		protected function onCloseBtn(event:KeyboardEvent):void
		{
			if(event.keyCode == 51)
				System.exit(0);
				
			trace("Exit not caught");
		}
		
		/* *******MIGHT NOT NEED THIS
		 * private function doPause(event:KeyboardEvent):void
		{
			if (event.keyCode == 80)
			{
				switch(state)
				{
					case STATE_MENU:
						break;
					case STATE_PAUSE:
						state = STATE_RUN;
						break;
					case STATE_RUN:
						state = STATE_PAUSE;
						break;
				}
			}
		}
		*/
	}
}