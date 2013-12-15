package  
{
	import adobe.utils.CustomActions;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.ui.KeyLocation;
	import Screens.MainMenu;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.utils.Timer;
	import starling.events.KeyboardEvent;
	import flash.system.System;
	import starling.textures.Texture;
	
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
		private const _END:Number		= 4;
		
		private var state:Number;
		
		private var timer:Timer;
		private var numTicks:Number;
		
		private var mainMenu:MainMenu;
		
		private var world:World;
		
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
			draw();
		}
		
		private function draw():void
		{
			switch (state)
			{
				//Drawing all menu items
				case _INIT:
				{
					mainMenu = new MainMenu(stage, this);
					stage.addEventListener(KeyboardEvent.KEY_DOWN, dispatch);
					
					/*
					Make the main menu and add an event listener for which is selected
					Allow the use of the UP,DOWN arrows to change which is selected.
					We will need buttons that have a 
					>>	Normal, highlighted (when selected), and pressed form
					*/
					
					break;
				}
				
				//Drawing gameplay aspects
				case _RUNNING:
				{
					stage.removeEventListener(KeyboardEvent.KEY_DOWN, dispatch);
					world = new World(stage);
					
					trace("RUNNING");
					
					//do the collision detection and updating of 
					//	characters/objects on the screen
					
					world.draw();
					break;
				}
				
				//Drawing paused screen stuff
				case _PAUSED:
				{
					//might not need this case
					break;
				}
				
				//Drawing game over screen
				case _END:
				{
					//Show game over screen, replay? continue? or boot back to main menu
					break;
				}
			}
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
					
					break;
				}
				
				//Actual gameplay
				case _RUNNING:
				{
					//do the collision detection and updating of 
					//	characters/objects on the screen
					
					//Manage the array of sprite's location
					//trace("RUNNING");
					break;
				}
				
				//When game is paused
				case _PAUSED:
				{
					//might not need this case
					
					break;
				}
				
				//When the player dies
				case _LOSE:
				{
					//Show game over screen, replay? continue? or boot back to main menu
					
					break;
				}
				
				//When the player wins
				case _WIN:
				{
					//Game over but happy version
					
					break;
				}
				
			}
			
			numTicks++;
			
		}
		
		protected function onCloseBtn(event:KeyboardEvent):void
		{
			if(event.keyCode == Keyboard.NUMBER_3)
				System.exit(0);
				
			trace("Exit not caught");
		}
		
		protected function dispatch(event:KeyboardEvent):void
		{
			switch (state)
			{
				case _INIT:
					mainMenu.checkButton(event);
			}
		}
		
		public function runGame():void
		{
			if(state == _INIT)
			{
				state = _RUNNING;
				mainMenu = null;
				
				//Draws the new items to the screen
				draw();
			}
		}
		
		/* *******MIGHT NOT NEED THIS
		 * private function doPause(event:KeyboardEvent):void
		{
			if (event.keyCode == Keyboard.P)
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