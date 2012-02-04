package com.meathill.net.events {
  import flash.events.Event;
  
  public class ServerErrorEvent extends Event {
    public static const SECURITY_ERROR:String = "securityError";
    public static const IO_ERROR:String = "ioError";
    
    public function ServerErrorEvent(type:String, code:int, msg:String = "") {
      _code = code;
      _msg = msg;
      super(type);
    }
    
    private var _code:int;
    public function get code():int {
      return _code;
    }
    private var _msg:String;
    public function get msg():String {
      return _msg;
    }
  }
}