package com.meathill.net {
  public interface IServer {
    function call(url:String, data:Object, successHandler:Function, errorHandler:Function):void;
  }
}