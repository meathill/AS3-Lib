package com.meathill.net {
  import com.meathill.events.ServerDataEvent;
  import com.meathill.events.ServerErrorEvent;
  
  import flash.events.Event;
  import flash.events.EventDispatcher;
  import flash.events.IEventDispatcher;
  import flash.events.IOErrorEvent;
  import flash.events.ProgressEvent;
  import flash.events.SecurityErrorEvent;
  import flash.net.URLLoader;
  
  [Event(name="serverData", type="com.meathill.events.ServerDataEvent")]
  [Event(name="ioError", type="com.meathill.event.ServerErrorEvent")]
  [Event(name="securityError", type="com.meathill.event.ServerErrorEvent")]
  public class ServerCall extends EventDispatcher {
    public function ServerCall(url:String, data:Object, encoder:IEncoder) {
      super();
      _url = url;
      this.data = url;
      this.encoder = encoder;
    }
    
    private var data:Object;
    private var encoder:IEncoder;
    private var _url:String;
    public function get url():String {
      return _url;
    }
    
    public function call():void{
      createLoader().load(encoder.encode(_url, data));
    }
    public function addHandlers(dataHandler:Function =  null, errorHandler:Function = null):void {
      if (dataHandler != null) {
        addEventListener(ServerDataEvent.SERVER_DATA, dataHandler);
      }
      if (errorHandler != null) {
        addEventListener(ServerErrorEvent.IO_ERROR, errorHandler);
        addEventListener(ServerErrorEvent.SECURITY_ERROR, errorHandler);
      }
    }
    public function removeHandler(dataHandler:Function = null, errorHandler:Function = null):void {
      if (dataHandler != null) {
        removeEventListener(ServerDataEvent.SERVER_DATA, dataHandler);
      }
      if (errorHandler != null) {
        removeEventListener(ServerErrorEvent.IO_ERROR, errorHandler);
        removeEventListener(ServerErrorEvent.SECURITY_ERROR, errorHandler);
      }
    }
    
    private function createLoader():URLLoader {
      // TODO Auto Generated method stub
      var loader:URLLoader = new URLLoader();
      initLoaderHandlers(loader);
      return loader;
    }
    private function initLoaderHandlers(loader:URLLoader):void {
      // TODO Auto Generated method stub
      loader.addEventListener(Event.COMPLETE, completeHandler);
      loader.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
      loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
      loader.addEventListener(ProgressEvent.PROGRESS, progressHandler);
    }
    private function removeLoaderHandlers(loader:URLLoader):void {
      // TODO Auto Generated method stub
      loader.removeEventListener(Event.COMPLETE, completeHandler);
      loader.removeEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
      loader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
      loader.removeEventListener(ProgressEvent.PROGRESS, progressHandler);
    }
    private function parseData(source:String):void {
      // TODO Auto Generated method stub
      var data:Object;
      if (encoder != null) {
        data = encoder.decode(source);
      } else {
        data = source;
      }
      dispatchEvent(new ServerDataEvent(ServerDataEvent.SERVER_DATA, data));
    }
    
    protected function completeHandler(event:Event):void {
      // TODO Auto-generated method stub
      var loader:URLLoader = URLLoader(event.target);
      removeLoaderHandlers(loader);
      parseData(loader.data);
    }
    protected function ioErrorHandler(event:IOErrorEvent):void {
      // TODO Auto-generated method stub
      var loader:URLLoader = URLLoader(event.target);
      removeLoaderHandlers(loader);
      dispatchEvent(new ServerErrorEvent(ServerErrorEvent.IO_ERROR, 1));
    }
    protected function securityErrorHandler(event:SecurityErrorEvent):void {
      // TODO Auto-generated method stub
      var loader:URLLoader = URLLoader(event.target);
      removeLoaderHandlers(loader);
      dispatchEvent(new ServerErrorEvent(ServerErrorEvent.SECURITY_ERROR, 2));
    } 
    protected function progressHandler(event:ProgressEvent):void {
      // TODO Auto-generated method stub
      dispatchEvent(event);
    }
  }
}