package com.meathill.net.events {
	import flash.events.Event;
	
	/**
	 * 搜索事件
	 * @author MeatHill
	 */
	public class SearchEvent extends Event {
		public static const SEARCH:String = "search";
		
		
		public function SearchEvent(type:String, query:String = '') { 
			_query = query;
			super(type, bubbles, cancelable);
		}
		
		/**************
		 * properties
		 * ***********/
		private var _query:String;
		public function get query():String {
			return _query;
		}
    
    private var _data:Object;
    public function get data():Object {
      return _data;
    }
    public function set data(value:Object):void {
      _data = value;
    }    
	}
}