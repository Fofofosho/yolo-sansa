package  
{
	import flash.display.Bitmap;
	import starling.textures.Texture;
	import flash.utils.Dictionary;
	import starling.textures.TextureAtlas;
	
	public class AssetManager 
	{
		// Embed assets here and create classes for them
		
		
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