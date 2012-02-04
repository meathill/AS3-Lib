package com.meathill.image.events {
	import flash.events.Event;
	
	/**
	 * 上传图片类事件
	 * @author Meathill
	 */
	public class PicUploaderEvent extends Event {
		public static const ENCODE_COMPLETE:String = "encodeComplete";
		public static const UPLOAD_COMPLETE:String = "uploadComplete";
    //=========================================================================
    //  Constructor
    //=========================================================================
		public function picUploaderEvent(type:String, msg:String) { 
      _msg = msg;
			super(type);
		}
		//=========================================================================
    //  Properties
    //=========================================================================
		private var _msg:String = "";
		public function get msg():String {
			return _msg;
		}
	}
}