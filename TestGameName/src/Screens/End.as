package Screens 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.KeyboardEvent;
	import starling.text.TextField;
	
	/**
	 * @author Forrest Townsend
	 */
	public class End extends Sprite
	{
		private var game:Game;
		
		private var leftSelect:Boolean;
		
		private var endImage:Image;
		private var scoreboard:TextField;
		
		private var retry_btn:Image;
		private var retry_btn_select:Image
		
		private var menu_btn:Image;
		private var menu_btn_select:Image;
		
		public function End(main:Game) 
		{	
			this.game = main;
			leftSelect = true;
			
			endImage = new Image(AssetManager.getTexture("end"));
			
			scoreboard = new TextField(216, 66, game.score.toString(), "Verdana", 30, 0xDB212A);
			scoreboard.x = 148;
			scoreboard.y = 306;
			
			addChild(endImage);
			addChild(scoreboard);
			
			drawButtons();
		}
		
		//Draws all buttons to stage
		private function drawButtons():void
		{
			retry_btn = new Image(AssetManager.getTexture("end_shape"));
			retry_btn.x = 108;
			retry_btn.y = 422;
			retry_btn.width = 39;
			retry_btn.height = 35;
			retry_btn.visible = false;
			addChild(retry_btn);
			
			retry_btn_select = new Image(AssetManager.getTexture("end_selected_button"));
			retry_btn_select.x = 96;
			retry_btn_select.y = 404;
			retry_btn_select.visible = true;
			addChild(retry_btn_select);
			
			menu_btn = new Image(AssetManager.getTexture("end_shape"));
			menu_btn.x = 357;
			menu_btn.y = 422;
			menu_btn.width = 39;
			menu_btn.height = 35;
			menu_btn.visible = true;
			addChild(menu_btn);
			
			menu_btn_select = new Image(AssetManager.getTexture("rev_selected_button"));
			menu_btn_select.x = 344;
			menu_btn_select.y = 404;
			menu_btn_select.visible = false;
			addChild(menu_btn_select);
		}
		
		public function checkButton(event:KeyboardEvent):void
		{
			switch(event.keyCode)
			{
				//key 'A'
				case 65:
				{
					if (!leftSelect)
					{
						//Remove jalapeno picture from bottom and put top
						changeImage("left");
						leftSelect = true;
					}
					
					break;
				}
				
				//key 'D'
				case 68: 
				{
					if (leftSelect)
					{
						//Remove jalapeno picture from top and put bottom
						changeImage("right");
						leftSelect = false;
					}
					
					break;
				}
				
				//key 'LeftArrow'
				case 37:
				{
					if (!leftSelect)
					{
						//Remove jalapeno picture from bottom and put top
						changeImage("left");
						leftSelect = true;
					}
					
					break;
				}
				
				//Key 'RightArrow'
				case 39:
				{
					if (leftSelect)
					{
						//Remove jalapeno picture from top and put bottom
						changeImage("right");
						leftSelect = false;
					}
					
					break;
				}
				
				//Key 'ENTER, R, T, Y, Z, X, C, Q, E, =, -'
				case 13:
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
				{
					if (leftSelect)
					{
						//restart game
						removeScreen();
						game.runGame();
					}
					else
					{
						//go back to menu
						removeScreen();
						game.reset()
					}
					
					break;
				}
				
			}
			
		}
		
		//Changes the selector images
		private function changeImage(changeTo:String):void
		{
			switch(changeTo)
			{
				case "left":
					menu_btn_select.visible = false;
					menu_btn.visible = true;
					retry_btn.visible = false;
					retry_btn_select.visible = true;
					break;
				
				case "right":
					retry_btn.visible = true;
					retry_btn_select.visible = false;
					menu_btn.visible = false;
					menu_btn_select.visible = true;
					break;
				
			}
		}
		
		//Wipes the stage of all End components
		private function removeScreen():void
		{
			removeChild(menu_btn);
			removeChild(menu_btn_select);
			removeChild(retry_btn);
			removeChild(retry_btn_select);
			removeChild(endImage);
			removeChild(scoreboard);
		}
		
	}

}