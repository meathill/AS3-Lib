package com.meathill {
	/**
	 * 日期相关函数
	 * @author	Meathill
	 * @version	0.1(2010-11-9)
	 */
	public class MeatDate {
    //=========================================================================
    //  Class Constants
    //=========================================================================
		public static const MONTH_DAY_NUM:Array = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
		public static const DAY_NAMES:Array = ['周日', '周一', '周二', '周三', '周四', '周五', '周六'];
    public static const MONTH_NAMES:Array = ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];
    //=========================================================================
    //  constructor
    //=========================================================================
    public function MeatDate(date:Date = null) {
      this.date = date || new Date();
    }
    //=========================================================================
    //  Propreties
    //=========================================================================
    private var date:Date;
		/**
		 * 取是一年中的第几天
		 * @param	日期实例
		 * @return 天数
		 */
		public function get dateInYear():int {
			var result:int = 0;
			for (var i:int = 0, len:int = date.month; i < len; i += 1) {
				result += MONTH_DAY_NUM[i];
				// 闰年2月多一天
				if (date.fullYear % 4 == 0 && i == 1) { 
					result += 1;
				}
			}
			return result + date;
		}
    /**
     * 返回中文的周几
     * @return
     */
		public function dayCN():String {
			return DAY_NAMES[date.day];
		}
    //=========================================================================
    //  Public Methods
    //=========================================================================
		/**
		 * 计算加上后面的天数后，是哪天
		 * @param	num 天数
		 * @return 新的Date实例
		 */
		public function addDays(num:int):Date {
			var newDate:Date = new Date(date.fullYear, date.month, date.date);
      newDate.date += num;
			return newDate;
		}
    /**
     * 格式化输出日期
     * @param	template
     * @return 格式化后的日期
     */
    public function format(template:String):String {
      //-- 转换年
      template = template.replace(/y{4}|y{2}/igm, getYearString);
      //-- 转换月
      template = template.replace(/m{2}/igm, getMonthString);
      //-- 转换日
      template = template.replace(/d{2}/igm, getDateString);
      
      return template;
    }
    //=========================================================================
    //  Private Functions
    //=========================================================================
    private function getYearString(...args):String {
      var str:String = String(args[0]);
      var year:String = date.fullYear.toString()
      return str.length == 4 ? year : year.substr(2, 2);
    }
    private function getMonthString(...args):String {
      return date.month + 1 > 9 ? String(date.month + 1) : '0' + (date.month + 1);
    }
    private function getDateString(...args):String {
      return date.date < 10 ? '0' + date.date : date.date.toString();
    }
	}
}