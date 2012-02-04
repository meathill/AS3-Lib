package com.meathill.image.errors {
	/**
   * 无源图错误
   * @author Meathill
   */
  public class NoImageError extends Error {
    public function NoImageError() {
      super("没有可供抓取的图片");
    }
  }
}