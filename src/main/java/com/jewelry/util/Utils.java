package com.jewelry.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Utils {

	  /**
	   * 현재 시각을 원하는 상태로 가져옴
	   * 
	   * @return String 현재시각
	   */
	  public static synchronized String getTodayDateFormat(String format) {
	    return new SimpleDateFormat(format).format(new Date());
	  }
}
