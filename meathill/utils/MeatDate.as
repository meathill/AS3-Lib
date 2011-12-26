package com.meathill.utils {
	/**
	 * 日期相关函数
	 * @author	Meathill
	 * @version	0.1(2010-11-9)
	 */
	public class MeatDate extends Date {
    //=========================================================================
    //  Class Constants
    //=========================================================================
		public static const MONTH_DAY_NUM:Array = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
		public static const DAYS:Array = ['周日', '周一', '周二', '周三', '周四', '周五', '周六'];
    //=========================================================================
    //  constructor
    //=========================================================================
    public function MeatDate(date:Date) {
      fullYear = date.fullYear;
      month = date.month;
      date = date.date;
      hours = date.hours;
      minutes = date.minutes;
      seconds = date.seconds;
    }
    //=========================================================================
    //  Propreties
    //=========================================================================
		/**
		 * 取是一年中的第几天
		 * @param	日期实例
		 * @return 天数
		 */
		public function get dateInYear():int {
			var result:int = 0;
			for (var i:int = 0, len:int = month; i < len; i += 1) {
				result += MONTH_DAY_NUM[i];
				// 闰年2月多一天
				if (fullYear % 4 == 0 && i == 1) { 
					_esult += 1;
				}
			}
			return result + date;
		}
    /**
     * 返回中文的周几
     * @return
     */
		public function dayCN():String {
			return DAYS[day];
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
			var date:Date = new Date(fullYear, month, date);
      date.date + num;
			return date;
		}
    /**
     * 格式化输出日期
     * @param	template
     * @return 格式化后的日期
     */
    public function format(template:String):String {
      var result:String = template;
      //-- 转换年
      result = result.replace(/y{4}|y{2}/igm, getYearString);
      //-- 转换月
      result = result.replace(/m{2}/igm, getMonthString);
      //-- 转换日
      result = result.replace(/d{2}/igm, getDateString);
      
      return result;
    }
    //=========================================================================
    //  Private Functions
    //=========================================================================
    private function returnYearString():String {
      var str:String = String(arguments[0]);
      var year:String = fullYear.toString()
      return str.length == 4 ? year : year.substr(2, 2);
    }
    private function getMonthString():String {
      return month + 1 > 9 ? month + 1 : '0' + (month + 1);
    }
    private function getDateString():String {
      return date < 10 ? '0' + date : date.toString();
    }
	}
}