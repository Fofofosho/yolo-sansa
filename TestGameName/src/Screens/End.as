package Screens 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.text.TextField;
	
	/**
	 * @author Forrest Townsend
	 */
	public class End extends Sprite
	{
		public function End(game:Game) 
		{	
			var scoreboard:TextField = new TextField(216, 66, game.score.toString(), "Verdana", 30, 0xDB212A);
			scoreboard.x = 148;
			scoreboard.y = 306;
			
			this.addChild(new Image(AssetManager.getTexture("end")));
			this.addChild(scoreboard);
		}
		
	}

}