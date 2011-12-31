package com.meathill.net {
  import flash.net.URLRequest;

  public interface IEncoder {
    function encode(url:String, data:Object):URLRequest;
    function decode(source:String):Object;
  }
}