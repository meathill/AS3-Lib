package com.meathill.air {
  import flash.display.NativeMenu;
  import flash.display.NativeMenuItem;
  import flash.display.Sprite;
	/**
   * 右键菜单等价版本号
   * @author Meathill
   */
  public class MeatVersion {
    public static var versionItem:NativeMenuItem;
    public static function createVersion(target:Sprite):void {
      var version:String = [Version.Major, Version.Minor, Version.Build, Version.Revision].join(".");
      versionItem = new NativeMenuItem(version, true);
      var menu:NativeMenu = target.contextMenu;
      menu.addItem(versionItem);
    }
  }
}