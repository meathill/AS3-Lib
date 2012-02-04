package com.meathill.image {
  import com.meathill.image.events.LocalPicLoaderEvent;
  import flash.display.Bitmap;
  import flash.display.Loader;
  import flash.events.Event;
  import flash.events.EventDispatcher;
  import flash.events.ProgressEvent;
  import flash.net.FileFilter;
  import flash.net.FileReference;
	
	/**
	 * 加载本地图片的类
	 * @author	Meathill
	 * @version	0.1(2010-07-15)
	 */
	[LocalPicLoaderEvent(name = 'loadPicComplete', type = 'com.meathill.image.events')]
	[ProgressEvent(name = 'progress', type = 'flash.events.ProgressEvent')]
	public class LocalPicLoader extends EventDispatcher	{
		//=========================================================================
    //  Class Constants
    //=========================================================================
		public static const FILE_FILTER:FileFilter = new FileFilter('图片', "*.jpg; *.jpeg");
		//=========================================================================
    //  Constructor
    //=========================================================================
		public function LocalPicLoader() {
			file = new FileReference();
			file.addEventListener(Event.SELECT, selectHandler);
			file.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			file.addEventListener(Event.COMPLETE, completeHandler);
		}
    //=========================================================================
    //  Properties
    //=========================================================================
		private var file:FileReference;
		private var loader:Loader;
    //---------------------------------
    //  bmp
    //---------------------------------
		private var _bmp:Bitmap;
		public function get bmp():Bitmap {
			return _bmp;
		}
		//=========================================================================
    //  Public Methods
    //=========================================================================
		public function selectFile():void {
			file.browse([FILE_FILTER]);
		}
    private function loadFile():void {
      file.load();
    }
		private function loadPic():void {
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loader_completeHandler);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			loader.loadBytes(file.data);
		}
    //=========================================================================
    //  Event Handler
    //=========================================================================
		private function selectHandler(event:Event):void {
			loadFile();
		}
		private function progressHandler(event:ProgressEvent):void {
			dispatchEvent(event);
		}
    private function completeHandler(e:Event):void {
      loadPic();
    }
		private function loadPicComplete(event:Event):void {
			_bmp = loader.content as Bitmap;
      
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loader_completeHandler);
			loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, progressHandler);
			loader = null;
			
			dispatchEvent(new LocalPicLoaderEvent(LocalPicLoaderEvent.LOAD_PIC_COMPLETE));
		}
		
	}
}