package com.meathill.image.events {
  import flash.events.Event;
  
  /**
   * 本地图片加载事件
   * @author Meathill
   */
  public class LocalPicLoaderEvent extends Event {
    public static const LOAD_PIC_COMPLETE:String = 'loadPicComplete';
    public function LocalPicLoaderEvent(type:String) { 
      super(type);
    }
  }
}