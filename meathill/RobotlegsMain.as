package com.meathill {
  import flash.display.Sprite;
  import flash.display.StageAlign;
  import flash.display.StageScaleMode;
  import flash.events.Event;
  import lib.meatClass.meatMenu;
  import org.robotlegs.mvcs.Context;
	
	/**
	 * 使用Robotlegs框架的基础类
	 * @author Meathill
	 */
	public class RobotlegsMain extends Sprite	{
		//=========================================================================
    //  Constructor
    //=========================================================================
		public function RobotlegsMain() {
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.addEventListener(Event.RESIZE, stage_resizeHandler);
			stage.dispatchEvent(new Event(Event.RESIZE));
		}
		//=========================================================================
    //  Properties
    //=========================================================================
		protected var menu:meatMenu;
		protected var isInitComplete:Boolean = false;
    protected var context:Context;
		//=========================================================================
    //  Privat Functions
    //=========================================================================
		protected function init():void { 
			menu = new meatMenu(true, null, { info: '作者：肉山（做自己感兴趣的事）', link: 'http://www.meathill.net/' } );
			contextMenu = menu.contextMenu;
			context = getContext();
		}
    protected function getContext():Context {
      return new Context(this);
    }
    //=========================================================================
    //  Event Handlers
    //=========================================================================
		protected function stage_resizeHandler(evt:Event):void {
			if (!isInitComplete && stage.stageWidth > 0 && stage.stageHeight > 0) {
				isInitComplete = true;
				stage.removeEventListener(Event.RESIZE, stage_resizeHandler);
				init();
			}
		}
	}
}