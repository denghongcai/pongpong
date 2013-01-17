package 
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.net.URLRequest;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.Font;
	import game.view.Welcome;
	import morn.core.handlers.Handler;
	
	/**
	 * ...
	 * @hongcai deng
	 */
	public class Main extends Sprite 
	{		
		public function Main():void 
		{
			
			init();
			
			/*
			if (stage)
			{
				init();
			}
			else addEventListener(Event.ADDED_TO_STAGE, init);
			*/
		}
		
		public function init(e:Event = null):void 
		{
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
			_loader.load(new URLRequest('FontLibrary.swf'));
		}
		
		private var _loader:Loader;
		
		private function loadComplete(content:*):void 
		{
			addChild(new Welcome);
		}
		
		public function completeHandler(event :Event):void
		{
			trace('载入字体成功');
			var __font:* = _loader.content;
			Font.registerFont(__font.fontclass);
			var __tf:TextField = new TextField();
			__tf.name = 'taotaofot';
			__tf.width = 200;
			var __format:TextFormat = new TextFormat();
			__format.font = 'taotaofot';
			__tf.defaultTextFormat = __format;
			__tf.embedFonts = true;
			__tf.text = '嘭';
			__tf.x = Math.random()*this.stage.stageWidth;
			__tf.y = Math.random()*this.stage.stageHeight;
			addChild(__tf);
			var ___fontArr:Array= Font.enumerateFonts(false);
			//Font.registerFont(myFont);
			for each(var ___font:Font in ___fontArr)
				trace(___font.fontName, ___font.fontType);
			App.init(this);
			App.loader.loadSWF("assets/comp.swf", new Handler(loadComplete));
		}
		
	}
	
}