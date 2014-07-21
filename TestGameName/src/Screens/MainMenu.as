package Screens 
{
	import starling.animation.Tween;
	import starling.display.Stage;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.core.Starling;
	
	/**
	 * @author Forrest Townsend
	 */
	
	public class MainMenu 
	{
		private var stage:Stage;
		
		private var background:Image;
		private var bgTween:Tween;
		
		private var credits:Image;
		private var credTween:Tween;
		
		private var topSelect:Boolean;
		private var creditBool:Boolean;
		
		private var start_btn:Image;
		private var start_btn_select:Image
		
		private var credits_btn:Image;
		private var credits_btn_select:Image;
		
		private var game:Game;
		
		
		public function MainMenu(main:Stage, game:Game) 
		{
			this.stage = main;
			this.game = game;
			background = new Image(AssetManager.getTexture("menu"));
			credits = new Image(AssetManager.getTexture("credits"));
			stage.addChild(background);
			
			//Initialize boolean
			topSelect = true;
			creditBool = false;
			
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
			trace("button push");
			
			//Credits will not exit if the 'T' button is pushed
			// because its volume control
			if (creditBool && event.keyCode != 84)
			{
				credTween.fadeTo(0);
				Starling.juggler.add(credTween);
				
				background.alpha = 1;
				
				stage.removeChild(credits);
				creditBool = false;
				return;
			}
			
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
				
				//Key 'ENTER, R, T, Y, Z, X, C, Q, E, =, -'
				case 13:
				case 65:
				case 66:
				case 67:
				case 82:
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
						credits.alpha = 0;
						stage.addChild(credits);
						
						bgTween = new Tween(background, .2);
						bgTween.fadeTo(0);
						Starling.juggler.add(bgTween);
						
						credTween = new Tween(credits, .2);
						credTween.fadeTo(1);
						Starling.juggler.add(credTween);
						
						creditBool = true;
					}
					break;
					
			}
			
		}
		
	}//end MainMenu

}