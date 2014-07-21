package  
{
	import flash.display.Bitmap;
	import starling.textures.Texture;
	import flash.utils.Dictionary;
	import starling.textures.TextureAtlas;
	
	public class AssetManager 
	{
		// Embed assets here and create classes for them
		[Embed(source = "../assets/jalapeno.png")]
		private static const jalapeno:Class;
		
		[Embed(source = "../assets/jalapenodebug.png")]
		private static const jalapenodebug:Class;
		
		[Embed(source = "../assets/jalapeno2.png")]
		private static const jalapeno2:Class;
		
		[Embed(source = "../assets/jalapeno2debug.png")]
		private static const jalapeno2debug:Class;
		
		[Embed(source = "../assets/character.png")]
		private static const sombrero:Class;
		
		[Embed(source = "../assets/background.png")]
		private static const background:Class;
		
		[Embed(source = "../assets/ground.png")]
		private static const ground:Class;
		
		[Embed(source = "../assets/volumeOn.png")]
		private static const volumeOn:Class;
		
		[Embed(source = "../assets/volumeOff.png")]
		private static const volumeOff:Class;
		
		[Embed(source = "../assets/menu.png")]
		private static const menu:Class;
		
		[Embed(source = "../assets/credits_fixed.png")]
		private static const credits:Class;
		
		[Embed(source = "../assets/menu_button0.png")]
		private static const button:Class;
		
		[Embed(source = "../assets/menu_button.png")]
		private static const selected_button:Class;
		
		[Embed(source = "../assets/reverse_button.png")]
		private static const rev_selected_button:Class;
		
		[Embed(source = "../assets/end_button.png")]
		private static const end_selected_button:Class;
		
		[Embed(source = "../assets/end_shape.png")]
		private static const end_shape:Class;
		
		[Embed(source = "../assets/end.png")]
		private static const end:Class;
		
		[Embed(source = "../assets/sounds/Jump.mp3")]
		private static const jumpSound:Class;
		
		private static var textures:Dictionary = new Dictionary();
		private static var sprites:Dictionary  = new Dictionary();
		
		public static function getTexture(name:String):Texture
		{
			if (textures[name] == undefined)
			{
				textures[name] = Texture.fromBitmap(new AssetManager[name]()); 
			}
			return textures[name];
		}
		
		public static function getTextureAtlas(name:String):TextureAtlas
		{
			if (sprites[name] == undefined)
			{
				var texture:Texture = Texture.fromBitmap(new AssetManager[name]());
				var xml:XML = XML(new AssetManager[name + "XML"]());
				sprites[name] = new TextureAtlas(texture, xml);
			}
			return sprites[name];
		}
	}

}