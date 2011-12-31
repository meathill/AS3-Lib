package com.meathill.events {
  import flash.events.Event;
  
  public class ServerDataEvent extends Event {
    public static const SERVER_DATA:String = "serverData";
    
    public function ServerDataEvent(type:String, data:Object) {
      //TODO: implement function
      _data = data;
      super(type);
    }
    
    private var _data:Object;
    public function get data():Object {
      return _data;
    }
  }
}