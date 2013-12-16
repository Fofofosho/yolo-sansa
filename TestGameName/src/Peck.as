package  
{
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author C. Nakai McCarty
	 */
	public class Peck extends Sprite 
	{
		private var platform:Platform;
		private var platformArray:Array;
		
		
		public function Peck() 
		{
			randomizePlatforms(16);
			
			for(var i:int = 0; i < platformArray.length; i++)
			{
				addChild(platformArray[i]);
			}
		}
		
		private function randomizePlatforms(score:int):void
		{
			platformArray = new Array();
			var randomX:int = 0;
			
			for (var i:int = 0; i < 16; i++)
			{	
				randomX = Math.floor(Math.random() * 380) + 2;
				platform = new Platform(randomX, i * 60);
				platformArray.push(platform);
				
				
				if(Math.random() < 0.2)
				{
					while((platform.x - 120 < randomX) && (randomX < platform.x + 120))
					{
						randomX = Math.floor(Math.random() * 380) + 2;
					}
					
					platform = new Platform(randomX, (i * 60) + 20);
					platformArray.push(platform);
				}
			}
		}
	}

}