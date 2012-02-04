package com.meathill.image {
  import com.adobe.images.JPGEncoder;
  import com.adobe.images.PNGEncoder;
  import com.meathill.image.errors.NoImageError;
  import com.meathill.image.events.PicUploaderEvent;
  import flash.display.BitmapData;
  import flash.display.DisplayObject;
  import flash.display.IBitmapDrawable;
  import flash.events.Event;
  import flash.events.EventDispatcher;
  import flash.events.IOErrorEvent;
  import flash.events.ProgressEvent;
  import flash.net.URLLoader;
  import flash.net.URLRequest;
  import flash.net.URLRequestMethod;
  import flash.utils.ByteArray;
	
	/**
	 * 上传图片专用类
	 * @author	Meathill
	 * 
	 */
	public class PicUploader extends EventDispatcher {
    //=========================================================================
    //  Constructor
    //=========================================================================
		public function PicUploader(uploadUrl:String = '', image:IBitmapDrawable = null, isPNG:Boolean = false, quality:int = 85) {
      url = new URLRequest(url);
			url.method = URLRequestMethod.POST;
			url.contentType = 'application/octet-stream';
			
			uploader = new URLLoader();
			uploader.addEventListener(Event.COMPLETE, completeHandler);
			uploader.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			uploader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
			
			this.image = image;
			this.isPNG = png;
			if (!isPNG) {
				encoder = new JPGEncoder(quality);
			}
		}
		//=========================================================================
    //  Properties
    //=========================================================================
		protected var uploader:URLLoader;
		protected var image:IBitmapDrawable;
		protected var url:URLRequest;
		protected var encoder:JPGEncoder;
		protected var bytes:ByteArray;
		protected var bmpd:BitmapData;
    protected var image:IBitmapDrawable;
		protected var isPNG:Boolean = false;
		public function set usePNG(bl:Boolean):void {
			isPNG = bl;
		}
    //---------------------------------
    //  url
    //---------------------------------
		public function set uploadUrl(str:String):void {
			url.url = str;
		}
		public function get uploadUrl():String {
			return url.url;
		}
    //---------------------------------
    //  msg
    //---------------------------------
		private var _msg:String = '';
    public function get msg():String {
      return _msg;
    }
    //---------------------------------
    //  isAutoUpload
    //---------------------------------
		protected var _isAutoUpload:Boolean = false;
    public function set isAutoUpload(value:Boolean):void {
      _isAutoUpload = value;
    }
		//=========================================================================
    //  Public Methods
    //=========================================================================
		public function encode(obj:IBitmapDrawable = null):void {
      image = obj != null ? obj : image;
      if (image == null) {
        throw new NoImageError();
      }
      
      if (image is BitmapData) {
        bmpd = BitmapData(image).clone();
      } else {
        bmpd = new BitmapData(DisplayObject(image).width, DisplayObject(image).height);
        bmpd.draw(image);
      }
      bytes = isPNG ? PNGEncoder.encode(bmpd) : encoder.encode(_bmpd);
			
			if (isAutoUpload) {
				upload();
			} else {
        dispatchEvent(new PicUploaderEvent(PicUploaderEvent.ENCODE_COMPLETE));
      }
		}
		public function upload(uploadUrl:String = ''):void {
      url.url = uploadUrl != '' ? uploadUrl : url.url;
			url.data = bytes;
			uploader.load(url);
		}
		//=========================================================================
    //  Event Handlers
    //=========================================================================
		private function completeHandler(evt:Event):void {
			dispatchEvent(new PicUploaderEvent(PicUploaderEvent.UPLOAD_COMPLETE, uploader.data));
		}
		protected function progressHandler(evt:ProgressEvent):void {
			dispatchEvent(evt);
		}
		private function errorHandler(evt:IOErrorEvent):void {
			dispatchEvent(evt);
		}
		
	}
}