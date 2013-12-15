package Screens 
{
	import starling.display.Stage;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	
	/**
	 * @author Forrest Townsend
	 */
	
	public class MainMenu 
	{
		private var stage:Stage;
		
		private var background:Image;
		
		private var start_btn:Image;
		private var start_btn_select:Image
		
		//Only need one boolean, true is top, false is bottom
		private var topSelect:Boolean;
		
		private var credits_btn:Image;
		private var credits_btn_select:Image;
		
		private var game:Game;
		
		
		public function MainMenu(main:Stage, game:Game) 
		{
			this.stage = main;
			this.game = game;
			background = new Image(AssetManager.getTexture("menu"));
			stage.addChild(background);
			
			//Initialize boolean
			topSelect = true;
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, checkButton);
			
			//Display buttons
			drawButtons();
		}
		
		public function removeScreen():void
		{
			stage.removeChild(start_btn);
			stage.removeChild(start_btn_select);
			stage.removeChild(credits_btn);
			stage.removeChild(credits_btn_select);
			stage.removeChild(background);
			
		}
		
		private function drawButtons():void
		{
			start_btn = new Image(AssetManager.getTexture("button"));
			start_btn.x = 25;
			start_btn.y = 480;
			start_btn.visible = false;
			stage.addChild(start_btn);
			
			start_btn_select = new Image(AssetManager.getTexture("selected_button"));
			start_btn_select.x = 26;
			start_btn_select.y = 444;
			start_btn_select.visible = true;
			stage.addChild(start_btn_select);
			
			credits_btn = new Image(AssetManager.getTexture("button"));
			credits_btn.x = 23;
			credits_btn.y = 620;
			credits_btn.visible = true;
			stage.addChild(credits_btn);
			
			credits_btn_select = new Image(AssetManager.getTexture("selected_button"));
			credits_btn_select.x = 24;
			credits_btn_select.y = 584;
			credits_btn_select.visible = false;
			stage.addChild(credits_btn_select);
		}
		
		private function changeImage(changeTo:String):void
		{
			switch(changeTo)
			{
				case "top":
					credits_btn_select.visible = false;
					credits_btn.visible = true;
					start_btn.visible = false;
					start_btn_select.visible = true;
					break;
				
				case "bottom":
					start_btn.visible = true;
					start_btn_select.visible = false;
					credits_btn.visible = false;
					credits_btn_select.visible = true;
					break;
				
			}
		}
		
		public function checkButton(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				//key 'W'
				case 87:
				{
					if (!topSelect)
					{
						//Remove jalapeno picture from bottom and put top
						changeImage("top");
						topSelect = true;
					}
					
					break;
				}
				
				//key 'S'
				case 83: 
				{
					if (topSelect)
					{
						//Remove jalapeno picture from top and put bottom
						changeImage("bottom");
						topSelect = false;
					}
					
					break;
				}
				
				//key 'UpArrow'
				case 38:
				{
					if (!topSelect)
					{
						//Remove jalapeno picture from bottom and put top
						changeImage("top");
						topSelect = true;
					}
					
					break;
				}
				
				//Key 'DownArrow'
				case 40:
				{
					if (topSelect)
					{
						//Remove jalapeno picture from top and put bottom
						changeImage("bottom");
						topSelect = false;
					}
					
					break;
				}
				
				//Key 'ENTER, A, B, C, R, T, Y, Z, X, C, Q, E, =, -'
				case 13:
				case 65:
				case 66:
				case 67:
				case 82:
				case 84:
				case 89:
				case 90:
				case 88:
				case 67:
				case 81:
				case 69:
				case 187:
				case 189:
					if (topSelect)
					{
						removeScreen();
						game.runGame();
					}
					else
					{
						//GOTO CREDITS SCREEN, make all menu items visible = false
					}
					break;
					
			}
			
		}
		
	}//end MainMenu

}