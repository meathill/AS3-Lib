package com.meathill.net {
  import flash.net.URLVariables;

  /**
   * 实现此接口的一个对象都可以返回一个URLVariable
   * @author Meathill
   * 
   */  
  public interface IURLVariable {
    function toURLVariable():URLVariables;
  }
}