package  
{
	import adobe.utils.CustomActions;
	import flash.events.TimerEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.ui.Keyboard;
	import flash.ui.KeyLocation;
	import Screens.End;
	import Screens.MainMenu;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import flash.utils.Timer;
	import starling.events.KeyboardEvent;
	import flash.system.System;
	import starling.text.TextField;
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
		
		//State specific visualizations
		private var mainMenu:MainMenu;
		private var end:End;
		
		private var world:World;
		
		private var background:Image;
		public var ground:Image;
		
		//keep track of score
		public var score:int;
		private var scoreboard:TextField;
		
		private var musica:Sound;
		private var channel:SoundChannel;
		
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
			
			musica = new Sound(new URLRequest("../assets/sounds/musica.mp3"));
			channel = new SoundChannel();
			channel = musica.play(100, 9999);
			
			numTicks = 0;
			
			//For scoreboard
			score = 0;
			
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
					background = new Image(AssetManager.getTexture("background"));
					addChild(background);
					
					ground = new Image(AssetManager.getTexture("ground"));
					ground.x = 0;
					ground.y = 720;
					ground.width = 500;
					ground.height = 80;
					addChild(ground);
					
					//stage.removeEventListener(KeyboardEvent.KEY_DOWN, dispatch);
			
					world = new World(this, stage);
					
					//Add scoreboard. Starts at 0
					scoreboard = new TextField(400, 40, score.toString(), "Verdana", 30, 0xDB212A);
					scoreboard.x = 0;
					scoreboard.y = 0;
					scoreboard.hAlign = "left";
					addChild(scoreboard);
					
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
					
					stage.addEventListener(KeyboardEvent.KEY_DOWN, dispatch);
					removeChild(scoreboard);
					
					end = new End(this);
					addChild(end);
					
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
					
					world.update();
					
					if (world.checkPlayerDeath()) {
						trace("The player died");
						state = _END;
						draw();
					}
					else
					{
						//dynamically change scoreboard
						score += 2.47 * world.getCounter();
						scoreboard.text = score.toString();
					}
					
					break;
				}
				
				//When game is paused
				case _PAUSED:
				{
					//might not need this case
					
					break;
				}
				
				//When the user dies
				case _END:
				{
					//might not need to update anything here. BUT need to listen to enter for replay.
				}
			}
			
			numTicks++;
			
		}
		
		protected function onCloseBtn(event:KeyboardEvent):void
		{
			if(event.keyCode == Keyboard.NUMBER_3)
				System.exit(0);
		}
		
		protected function dispatch(event:KeyboardEvent):void
		{
			switch (state)
			{
				case _INIT:
					mainMenu.checkButton(event);
					break;
					
				case _END:
					end.checkButton(event);
					break;
			}
		}
		
		public function runGame():void
		{
			if(state == _INIT)
			{
				state = _RUNNING;
				//state = _END;
				mainMenu = null;
				
				//Draws the new items to the screen
				draw();
			}
			else if (state == _END)
			{
				//need to reset the game
				state = _RUNNING;
				score = 0;
				world = null;
				end = null;
				draw();
			}
		}
		
		//This function will reset the game and start fresh with game running
		public function reset():void
		{
			state = _INIT;
			score = 0;
			removeChild(background);
			removeChild(ground);
			draw();
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