package com.meathill {
  import flash.display.Sprite;
  import flash.ui.ContextMenu;
  import flash.ui.ContextMenuItem;
	/**
   * 右键菜单等价版本号
   * @author Meathill
   */
  public class MeatVersion {
    public static var versionItem:ContextMenuItem;
    public static function createVersion(target:Sprite):void {
      var version:String = [Version.Major, Version.Minor, Version.Build, Version.Revision].join(".");
      versionItem = new ContextMenuItem(version, true);
      var menu:ContextMenu = target.contextMenu;
      menu.items.unshift(versionItem);
    }
  }
}