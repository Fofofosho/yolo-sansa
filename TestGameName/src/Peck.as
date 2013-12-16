package  
{
	import starling.display.Sprite;
	
	/**
	 * @author C. Nakai McCarty
	 */
	public class Peck extends Sprite 
	{
		private var yVel:int;
		private var yAcc:int;
		private var platform:Platform;
		private var platformArray:Array;
		
		public function Peck(offset:int) 
		{
			randomizePlatforms(offset);
			
			for(var i:int = 0; i < platformArray.length; i++)
			{
				addChild(platformArray[i]);
			}
		}
		
		private function randomizePlatforms(offset:Number):void
		{
			platformArray = null;
			platformArray = new Array();
			var randomX:int = 0;
			var guarantor:int = 0;
			
			offset = (offset + 1) / 20;
			
			for (var i:int = 0; (i + 1) * 60 < 800; i++)
			{	
				randomX = Math.floor(Math.random() * 380) + 2;
				
				if(i == 0 || i == 12)
				{
					platform = new Platform(randomX, i * 60);
					platformArray.push(platform);
					guarantor = 0;
				}
				
				else if(guarantor > 1 || Math.random() < (1 - offset))
				{
					platform = new Platform(randomX, i * 60);
					platformArray.push(platform);
					guarantor = 0;
					
					if(Math.random() < (0.5 - offset))
					{
						while((platform.x - 120 < randomX) && (randomX < platform.x + 120))
						{
							randomX = Math.floor(Math.random() * 380) + 2;
						}
						
						platform = new Platform(randomX, (i * 60) + 20);
						platformArray.push(platform);
					}
				}
				
				else
					guarantor ++;
			}
		}
		
		public function update() : void
		{				
			yVel = yVel + yAcc;
			this.y = this.y + yVel;
			
			if(yAcc < -3)					
			{
				yAcc = -3;
			}
		}
		
		public function getPlatformArray():Array
		{
			return platformArray;
		}
		
		public function getYVel():int
		{
			return yVel;
		}
		
		public function setYVel(newYVel:int):void
		{
			yVel = newYVel;
		}
		
		public function getYAcc():int
		{
			return yAcc;
		}
		
		public function setYAcc(newYAcc:int):void
		{
			yAcc = newYAcc;
		}
		
		//public function removePlatform():int
		//{
			
		//}
	}

}