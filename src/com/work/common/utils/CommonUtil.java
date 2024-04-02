/**
 * 
 */
package com.work.common.utils;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

public final class CommonUtil
{
	public static final String DATE_TIME_FORMAT = "yyyy-MM-dd HH:mm:ss";
	public static final String DATE_FORMAT = "yyyy-MM-dd";
	
	
	public static boolean isEmpty(List list)
	{
		return (list == null || list.size() == 0);
	}
	
	public static boolean isEmpty(Map map)
	{
		return (map == null || map.size() == 0);
	}

	
	public static boolean isEmpty(Set set)
	{
		return (set == null) || (set.size() == 0);
	}

	public static boolean isEmpty(String value)
	{
		return (value == null || "".equals(value.trim()));
	}

	public static boolean isEmpty(Object value)
	{
		return (value == null);
	}

	public static boolean isEmpty(Long value)
	{
		return (value == null);
	}

	public static boolean isEmpty(Integer value)
	{
		return (value == null);
	}

	public static boolean isEmpty(String[] arrValue)
	{
		return (arrValue == null || arrValue.length == 0);
	}

	public static boolean isEmpty(Object[] arrObject)
	{
		return (arrObject == null || arrObject.length == 0);
	}
	
	
	public static boolean isNotEmpty(List list)
	{
		return !isEmpty(list);
	}
	
	public static boolean isNotEmpty(Map map)
	{
		return !isEmpty(map);
	}

	
	public static boolean isNotEmpty(Set set)
	{
		return !isEmpty(set);
	}

	public static boolean isNotEmpty(String value)
	{
		return !isEmpty(value);
	}

	public static boolean isNotEmpty(Object value)
	{
		return !isEmpty(value);
	}

	public static boolean isNotEmpty(Long value)
	{
		return !isEmpty(value);
	}

	public static boolean isNotEmpty(Integer value)
	{
		return !isEmpty(value);
	}

	public static boolean isNotEmpty(String[] arrValue)
	{
		return !isEmpty(arrValue);
	}

	public static boolean isNotEmpty(Object[] arrObject)
	{
		return !isEmpty(arrObject);
	}
	
	public static boolean isNotZero(Integer aNum){
		if (null == aNum || 0 == aNum) {
			return false;
		}else {
			return true;
		}
	}
	
	
	public static String getStringValue(Object value){
		if (isEmpty(value)) {
			return "";
		}else {
			return value.toString();
		}
	}
	
	public static boolean isDate(Calendar sysDate, Date dbDate)
	{
		SimpleDateFormat frm = new SimpleDateFormat("yyyy-MM-dd");
		String dbdateStr = frm.format(dbDate);
		String sysdateStr = frm.format(sysDate.getTime());
		if (sysdateStr.equals(dbdateStr))
		{
			return true;
		}
		return false;
	}

	// 跟系统时间对比
	public static boolean lessSysDateTime(Calendar sysDate, Date dbDate)
	{
		if (sysDate.getTime().getTime() > dbDate.getTime())
		{
			return true;
		}
		return false;
	}

	// 当前时间格式为string
	/**
	 * <一句话功能简述> <功能详细描述>
	 * 
	 * @param pattern
	 *            :"yyyyMMddHHmmss"
	 * @param field
	 *            :Calendar.SECOND 按秒编移
	 * @param timeLapse
	 *            ：编移数值
	 * @return String [返回类型说明]
	 * @see [类、类#方法、类#成员]
	 */
	public static String formatDateString(String pattern, int field, int timeLapse)
	{
		Calendar calendar = Calendar.getInstance();
		calendar.add(field, timeLapse);
		SimpleDateFormat frm = new SimpleDateFormat(pattern);
		String dateStr = frm.format(calendar.getTime());
		return dateStr;
	}

	/**
	 * <一句话功能简述> <功能详细描述>
	 * 
	 * @param pattern
	 *            :"yyyyMMddHHmmss"
	 * @param date
	 *            : 日期
	 * @return String [返回类型说明]
	 * @see [类、类#方法、类#成员]
	 */
	public static String dateString(String pattern, Date date)
	{
		SimpleDateFormat frm = new SimpleDateFormat(pattern);
		String dateStr = frm.format(date.getTime());
		return dateStr;
	}

//	/**
//	 * 获取资源文件的名称
//	 * 
//	 * @param key
//	 * @return
//	 */
//	public static String getRecourceMessageByKey(String key)
//	{
//		return IepgCfg.getErrCodeCfg().getErrMsg(key);
//	}
//	
//	public static String getMsg(String key)
//	{
//		return IepgCfg.getErrCodeCfg().getErrMsg(key);
//	}

	/**
	 * MD5 加密
	 */
	public static String getMD5Str(String str)
	{
		MessageDigest messageDigest = null;

		try
		{
			messageDigest = MessageDigest.getInstance("MD5");

			messageDigest.reset();

			messageDigest.update(str.getBytes("UTF-8"));
		}
		catch (NoSuchAlgorithmException e)
		{
			return "";
		}
		catch (UnsupportedEncodingException e)
		{
			return "";
		}

		byte[] byteArray = messageDigest.digest();

		StringBuffer md5StrBuff = new StringBuffer();

		for (int i = 0; i < byteArray.length; i++)
		{
			if (Integer.toHexString(0xFF & byteArray[i]).length() == 1)
				md5StrBuff.append("0").append(Integer.toHexString(0xFF & byteArray[i]));
			else
				md5StrBuff.append(Integer.toHexString(0xFF & byteArray[i]));
		}

		return md5StrBuff.toString();
	}

	/**
	 * webservice获取sessionId方法
	 * 
	 * @param context
	 * @return [参数说明]
	 * 
	 * @return String [返回类型说明]
	 * @exception throws [违例类型] [违例说明]
	 * @see [类、类#方法、类#成员]
	 */
//	public static String getSessionId(WebServiceContext context){
//		// MessageContext ctx = context.getMessageContext();
//		// HttpServletRequest request = (HttpServletRequest)
//		// ctx.get(AbstractHTTPDestination.HTTP_REQUEST);
//		HttpServletRequest request = ServletActionContext.getRequest();
//		HttpSession session = request.getSession();
//		return session.getId();
//	}

	/**
	 * 判断传输的分页参数和页码是否同时为空
	 * 
	 * @param allData
	 * @param page
	 * @return [参数说明]
	 * 
	 * @return boolean [返回类型说明]
	 * @exception throws [违例类型] [违例说明]
	 * @see [类、类#方法、类#成员]
	 */
	public static boolean pageParmsIsEmpty(String allData, String page)
	{
		if (isEmpty(allData) && isEmpty(page))
		{
			return true;
		}
		return false;
	}

	/**
	 * 判断传入的参数是否为整数
	 * 
	 * @param str
	 * @return [参数说明]
	 * 
	 * @return boolean [返回类型说明]
	 * @exception throws [违例类型] [违例说明]
	 * @see [类、类#方法、类#成员]
	 */
	public static boolean isInt(String str)
	{
		try
		{
			new Integer(str);

			return true;
		}
		catch (Exception e)
		{
			return false;
		}

	}
	
	public static boolean isLong(String str)
	{
		try
		{
			new Long(str);

			return true;
		}
		catch (Exception e)
		{
			return false;
		}

	}

	public static String datetostring24(Long date)
	{

		return dateString("yyyy-MM-dd HH:mm:ss", new Date(date));
	}


	/**
	 * <一句话功能简述> 英文双引号转为中文双引号
	 * 
	 * @param paramString
	 * @return String []
	 * @see [类、类#方法、类#成员]
	 */
	public static String enStringToZhString(String paramString)
	{

		return paramString.replaceAll("\"", "”");
	}

	/**
	 * 最大长度输入6个字符
	 * 先转换成URLEncoder：%E8%B6%8A%E5%85%89%E5%AE%9D%E7%9B%92
	 * 再替换%为-
	 * 输出格式：-E8-B6-8A-E5-85-89-E5-AE-9D-E7-9B-92
	 * @param resourceName
	 * @return
	 */
	public static String getCurrURLEncoder(String resourceName){
		
        try {//临时转码:中山标清中间件不认中文 及%, by 903702
        	if (resourceName.length()>6){
            	resourceName = resourceName.substring(6)+"...";//最大6个字符        		
        	}        	
        	resourceName = URLEncoder.encode(resourceName,"UTF-8");
        	resourceName = resourceName.replace("%","-");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return resourceName;
	}	
	
	/**
	 * 判断价格对不对(一般价格会是大于0的数)
	 * 
	 * @author dengyong903760
	 * @version [V200R001, 2010-6-24]
	 * @see [相关类/方法]
	 * @since [DHM.Core.IEPGM-V200R001]
	 */
	public static boolean isDouble(String str)
    {
    	if (str != null && !str.trim().equals(""))
    	{
    		if (str.matches("^[0-9]+[.]?[0-9]*$"))
    		{
    			return true;
    		}
    	}
    	
    	return false;
    }
	
 
	/**
	 * 是否是整形数字
	 * <一句话功能简述>
	 * <功能详细描述>
	 * 
	 * @author   dengyong903760
	 * @version  [V200R001, 2010-6-24]
	 * @see  [相关类/方法]
	 * @since  [DHM.Core.IEPGM-V200R001]
	 */
	public static boolean isInt2(String str)
	{
		if (str != null)
		{
			if (str.matches("\\d+"))
			{
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 封转订购时返回的backurl
	 * @param url
	 * @param orderResult
	 * @param userId
	 * @return
	 */
	public static String getOrderBackurl(String url,String orderResult,String userId){
		userId = userId==null?"":userId;
		String parmStr = "orderResult="+orderResult+"&userId="+userId;
		if(url != null){
			if(url.indexOf(".action?")<=0 ){
				url = url+"?"+parmStr;
			}else{
				url = url+"&"+parmStr;
			}
		}
		return url;
	}
	
	  /**
     * 计算一个日期N天之前的日期
     *
     * @param intervalDays
     * @return
     */
    public static Date getTodayBefore(int intervalDays,String dateFormat) {
        Calendar calendar = Calendar.getInstance();
        
        calendar.add(Calendar.DATE, -intervalDays);
        if ("Date".equals(dateFormat)) {
        	calendar.set(Calendar.HOUR_OF_DAY,0);   
        	calendar.set(Calendar.MINUTE, 0);   
        	calendar.set(Calendar.SECOND, 0);   
        	calendar.set(Calendar.MILLISECOND, 0); 
		}
        Date date = calendar.getTime();
    //    SimpleDateFormat format = new SimpleDateFormat(dateFormat);
     //   String dayBefore = format.format(date);
        return date;
    }
    /**
     * 计算一个日期N天之前的日期
     *
     * @param intervalDays
     * @return
     */
    public static Date getToday2Before(int intervalDays) {
    	Calendar calendar = Calendar.getInstance();
    	calendar.add(Calendar.DATE, -intervalDays);
    	Date date = calendar.getTime();
    	return date;
    }
    /**
     * 计算一个日期N天之前的日期
     *
     * @param intervalDays
     * @return
     */
    public static String getTodayBefore(int intervalDays) {
    	Calendar calendar = Calendar.getInstance();
    	calendar.add(Calendar.DATE, -intervalDays);
    	Date date = calendar.getTime();
    	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    	String dayBefore = format.format(date);
    	return dayBefore;
    }
    
	  /**
     * 计算一个日期N天之前的日期
     *
     * @param intervalDays
     * @return
     */
    public static Date getTodayDateBefore(int intervalDays,String dateFormat) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, -intervalDays);
        Date date = calendar.getTime();
        return date;
    }
    
    /**
     * 计算一个日期X分钟前的日期
     *
     * @param intervalDays
     * @return
     */
    public static Date getMinuteBefore(Date date ,int intervalMinute) {
    	Calendar calendar = Calendar.getInstance();
    	 calendar.setTime(date);
    	calendar.add(Calendar.MINUTE, -intervalMinute);
    	Date result = calendar.getTime();
    	return result;
    }
    
    /**
     * 计算一个日期N天之后的日期
     *
     * @param intervalDays
     * @return
     */
    public static String getTodayAfter(int intervalDays) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, intervalDays);
        Date date = calendar.getTime();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        String dayAfter = format.format(date);
        return dayAfter;
    }

	  /**
     * 计算一个日期N天之后的日期
     *
     * @param intervalDays
     * @return
     */
    public static Date getToday2After(int intervalDays) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DATE, intervalDays);
        Date date = calendar.getTime();
        return date;
    }
    
    public static Date getTodayBeforeHour(int afterHuor) {
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.HOUR, -afterHuor);
        Date date = calendar.getTime();
 
        return date;
    }
    
    
    /**
     * 获取指定时间 
     * @param dateTime
     * @param field
     * @param amount
     * @return
     */
    public static Date getDateTime(Date dateTime,int field ,int amount) {
    
    	Calendar calendar = Calendar.getInstance();
    	calendar.setTime(dateTime);
    	calendar.add(field, amount);
    	Date date = calendar.getTime();
    	
    	return date;
    }
    /**
	 * 获取一个容器的size
	 * 
	 * @param intervalDays
	 * @return
	 */
	
	public static int getColLen(Collection list)
	{
		return (list == null)?0:list.size();
	}


    /**判断是否为高清：0标清、1 高标清
     * @param type
     * @return
     */
    public static boolean isHD(String[] type){
    	if(CommonUtil.isEmpty(type)){
    		return false ;
    	}
    	for(String str :type){
    		if(str.equals("MPEG-2-HD")
    				||str.equals("H.264-HD")){
    			return true ;
    		}
    	}
    	return false;
    }
    
    public static boolean isHD(String vedioType){
    	if(CommonUtil.isEmpty(vedioType)){
    		return false ;
    	}else if(vedioType.equals("1")){
    		return true ;
    	}
    	
    	return false ;
    }
    /**判断是否为高清:0标清、1 高标清
     * @param type
     * @return
     */
    public static String isHDStr(String[] type){
    	for(String str :type){
    		if(str.equals("MPEG-2-HD")
    				||str.equals("H.264-HD")){
    			return "1" ;
    		}
    	}
    	return "0";
    }
    
    /**读iepgConfig.xml取得默认类型
     * @param ConfigStr
     * @return 
         1为高清MPEG-2-HD   
		 2为标清MPEG-2-SD   
  	     3为高清H.264-HD    
         4为标清H.264-SD    
    */

   public static String transformConfigToVideoType(String ConfigStr){
	   if(ConfigStr.equals("1")){
		   return "MPEG-2-HD";
	   }else if (ConfigStr.equals("2")){
		   return "MPEG-2-SD";
	   }else if  (ConfigStr.equals("3")){
		   return "H.264-HD"; 
	   }else if  (ConfigStr.equals("4")){
		   return "H.264-SD"; 
	   }else {
		   return "MPEG-2-HD";
	   }
	   
	   
   }
    
    
    /**
     * 根据用户高标清标志定位用户所进入的站点
     * videoType： 用户高标清标志，由函数getVideoTypeByUserId 获得
     * 高清用户进入高清的站点，
     * 标清用户进入标清的站点。
     * @param videoType  用户高标清标志
     * @return 站点ID
     */
//    public static String getSiteByVideoType(String videoType ){
//    	//如果为高清 ，返回高清站点
//    	String siteID = null;
//    	if (!CommonUtil.isEmpty(videoType))
//    	{
//    		if(CommonUtil.isHD(videoType)){
//    			siteID = IepgConfigBean.getHD_SITE(); 
//    		}else {
//    			siteID = IepgConfigBean.getSD_SITE();
//    		}
//    	}
//    	
////    	siteID = IepgConfigBean.getHD_SITE(); 
//    	return siteID;
//    }

//  /**
//   * 根据
//   *
//   * @param intervalDays
//   * @return
//   */
//  public static String getDateTimeAfter(int payUnit,int ammonut) {
//      Calendar calendar = Calendar.getInstance();
//      
//      if(Constants.DHM_GOODS_UNIT_MINUTE == payUnit)
//      {       	
//      	calendar.add(Calendar.MINUTE, ammonut);
//      } else if (Constants.DHM_GOODS_UNIT_HOUR == payUnit) {
//      	calendar.add(Calendar.HOUR, ammonut);
//		} else if (Constants.DHM_GOODS_UNIT_DAY == payUnit) {
//			calendar.add(Calendar.DATE, ammonut);
//		} else if (Constants.DHM_GOODS_UNIT_MONTH == payUnit) {
//			calendar.add(Calendar.MONTH, ammonut);
//		} else if (Constants.DHM_GOODS_UNIT_YEAR == payUnit) {
//			calendar.add(Calendar.YEAR, ammonut);
//		}else {
//			calendar.add(Calendar.MILLISECOND, ammonut);
//		}
//      Date date = calendar.getTime();
//      SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//      String dayBefore = format.format(date);
//      return dayBefore;
//  }
  
//  /**
//   * 根据用户ID判断是否是测试用户
//   * 规则：以“test”开头的是测试用户
//   * @param UserId
//   * @return true|fause
//   * @author 905978
//   */
//  public static boolean isTestUser(String userId){
//	  if(userId!=null&&userId.length()>=4&&EpgConstants.TEST_USER.equalsIgnoreCase((String) userId.substring(0, 4))){
//		  return true;
//	  }
//	  else{
//		  return false;
//	  }  
//  }
  
  /**
   * 对传入的字符串，截掉后面的数字
   * 例如name=电视剧：战地黄花15/26， 处理后变为 电视剧：战地黄花
   * 如果传入的字符串第一个字符就是数字，例如name=360度说法，则不处理，直接返回原字符串
   * @param name
   * @return
   */
  public static String getNameRemoveDigital(String name)
  {
      String result = name;
      int index = 0;
      for (int i = 0; i < name.length(); i++)
      {
          char ch = name.charAt(i);
          if (ch >= '0' && ch <= '9')
          {
              index = i;
              break;
          }
      }

      if (index == 0)
      {
          return result;
      }
      result = name.substring(0, index);
     
      return result;
  }
  
  /**
   * 过虑字符串中的字母，用于用户分组鉴权的时候取模
   * @param name
   * @return String
   */
  
  public static String filtrateLetters (String userCode) {
		
		 StringBuffer result = new StringBuffer(userCode);
	     int count = 0;
	     for (int i = 0; i < userCode.length(); i++)
	     {
	         char ch = userCode.charAt(i);
	         if ((ch >= 'a' && ch <= 'z')||(ch>='A'&&ch<='Z'))
	         {
	            result.deleteCharAt(i-count);
	            count++;	           
	         }
	     } 
	     return result.toString();	
	}
  /** 将 "时:分:秒" 这种格式的时间长度转换为秒数 
   *  如"00:22:30" 转换为 "1350"。
   * @author 905978
   * @param runtime "00:22:30"
   * @return second  "1350"
   */
  public  static int time2Second(String runtime){
		int timeCount =0;
		try {
			String[] celltime = runtime.split(":");
			int hour = Integer.parseInt(celltime[0]);
			int minute =Integer.parseInt(celltime[1]);
			int second = Integer.parseInt(celltime[2]);
			timeCount =3600*hour + 60*minute +second;
		} catch (Exception e) {
			int temptime=0;
			try {
				 temptime =Integer.parseInt(runtime);
				
			} catch (Exception e2) {
				return 0;
			}
			return temptime;
		}
		return timeCount;
	}
	
/**
 * @author 905978
 * @param resourceName 要截取的字符
 * @param suffix 截取后添加在后边的后缀字符
 * @param beginIndex 截取的开始位置，0开始
 * @param endIndex 截取到第几个字符
 * @return
 */
  public static String Filtername(String resourceName,String suffix,int beginIndex,int endIndex){
		if(isEmpty(resourceName)){
			resourceName="";
		}
		if (isEmpty(suffix)) {
			suffix="";
		}
	  String name=resourceName;
		if (resourceName.length()>endIndex) {
			StringBuffer sb = new StringBuffer();
			sb.append(resourceName.substring(beginIndex,endIndex));
			sb.append(suffix);
			name=sb.toString();
		}
		return name;
	}
  
  
  
  /**
   * 将list 转化为 二位字节码
   * @param list
   * @return
   */
  public  static byte[] getBytesByList(List list){
	byte[] bytes =null;
	try {
		ByteArrayOutputStream byteOut = new ByteArrayOutputStream();
		ObjectOutputStream objectOut = new ObjectOutputStream(byteOut);
		objectOut.writeObject(list);
		bytes= byteOut.toByteArray();
		
	} catch (Exception e) {
		return null;
	}
	return bytes;
  }
  
  	/**
  	 * 二位字节码 反转化为 list
  	 * @param bytes
  	 * @return
  	 */
  	public  static List getListBybytes(byte[] bytes){
  		List list = null;
		try {
			ByteArrayInputStream byteIn = new ByteArrayInputStream(bytes);
			ObjectInputStream objectInputStream = new ObjectInputStream(byteIn);
			list = (List<Object>)objectInputStream.readObject();
			
		} catch (Exception e) {
			return null;
		}
		return list;
  	}
  	
}
