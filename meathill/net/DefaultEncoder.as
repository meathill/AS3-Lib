package com.meathill.net {
  import flash.net.URLRequest;
  
  public class DefaultEncoder implements IEncoder {
    public function DefaultEncoder()
    {
    }
    
    public function encode(url:String, data:Object):URLRequest {
      return null;
    }
    
    public function decode(source:String):Object {
      return null;
    }
  }
}