package com.meathill.net {
  import flash.net.URLRequest;
  import flash.net.URLRequestMethod;
  import flash.net.URLVariables;
  
  public class DefaultEncoder implements IEncoder {
    
    public function encode(url:String, data:Object):URLRequest {
      var request:URLRequest = new URLRequest(url);
      request.method = URLRequestMethod.POST;
      var param:URLVariables = new URLVariables();
      for (var prop:String in data) {
        param[prop] = data[prop];
      }
      request.data = param;
      return request;
    }
    
    public function decode(source:String):Object {
      return null;
    }
  }
}