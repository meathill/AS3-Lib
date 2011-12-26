package com.meathill {
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.system.Security;
	import lib.meatClass.meatMenu;
	
	/**
	 * 基础类
	 * @author Meathill
	 */
	public class BasicMain extends Sprite	{
		protected var _menu:meatMenu;
		protected var _is_inited_bl:Boolean = false;
		
		public function BasicMain() {
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			//Security.allowDomain("*.meathill.com");
			
			stage.addEventListener(Event.RESIZE, resizeHandler);
			stage.dispatchEvent(new Event(Event.RESIZE));
		}
		
		/**************
		 * functions
		 * ***********/
		protected function init(evt:Event = null):void { 
			_menu = new meatMenu(true, null, { info: '作者：肉山（做自己感兴趣的事）', link: 'http://www.meathill.net/' } );
			contextMenu = _menu.contextMenu;
			
			dataInit();
			displayInit();
		}
		protected function dataInit(evt:Event = null):void {
			
		}
		protected function displayInit(evt:Event = null):void { 
			
		}
		protected function resizeHandler(evt:Event = null):void {
			if (!_is_inited_bl && stage.stageWidth > 0 && stage.stageHeight > 0) {
				_is_inited_bl = true;
				stage.removeEventListener(Event.RESIZE, resizeHandler);
				init();
			}
		}
	}
}