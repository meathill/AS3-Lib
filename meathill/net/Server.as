package com.meathill.net {
  import flash.errors.IllegalOperationError;

  public class Server implements IServer {
    public static var INSTANCE:Server;
    
    public static function getInstance():Server {
      if (INSTANCE == null) {
        INSTANCE = new Server();
      }
      return INSTANCE;
    }
    
    public function Server() {
      if (INSTANCE) {
        throw new IllegalOperationError("Server是单例，不能重复实例化");
      }
    }
    
    public function call(url:String, data:Object, successHandler:Function, errorHandler:Function):void {
      var serverCall:ServerCall = new ServerCall(url, data, getEncoder());
      serverCall.addHandlers(successHandler, errorHandler);
      serverCall.call();
    }
    
    private function getEncoder():com.meathill.net.IEncoder {
      // TODO Auto Generated method stub
      return new DefaultEncoder();
    }
  }
}