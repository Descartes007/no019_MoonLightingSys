package com.work.common.utils;

import java.util.List;
import java.util.Map;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class JsonUtil {
	public static String objectToJson(Object obj) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String jsonString = "{";
		jsonString += "\"code\": \"0\", ";
		jsonString += "\"msg\": \"处理成功\",";
		jsonString += "\"objects\":";
		jsonString += gson.toJson(obj);
		jsonString += "} ";
		return jsonString;
	}

	// 返回总记录数
	public static String buildJsonByTotalCount(List list, int totalCount) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String jsonString = "{";
		String JsonContext = "";
		int count = 0;
		if (!CommonUtil.isEmpty(list)) {
			JsonContext = gson.toJson(list);
			count = totalCount;
			jsonString += "\"code\": \"0\", ";
			jsonString += "\"msg\": \"处理成功\",";
		} else {
			JsonContext = "[] ";
			count = 0;
			jsonString += "\"code\": \"1\", ";
			jsonString += "\"msg\": \"此查询无数据\",";
		}
		jsonString += "\"count\": " + count + ",";
		jsonString += "\"data\":";
		jsonString += JsonContext;
		jsonString += "} ";
		return jsonString;
	}

	public static String buildJson(List list) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String jsonString = "{";
		String JsonContext = "";
		int count = 0;
		if (!CommonUtil.isEmpty(list)) {
			JsonContext = gson.toJson(list);
			count = list.size();
			jsonString += "\"code\": \"0\", ";
			jsonString += "\"msg\": \"处理成功\",";
		} else {
			JsonContext = "[] ";
			count = 0;
			jsonString += "\"code\": \"1\", ";
			jsonString += "\"msg\": \"处理失败,没有数据\",";
		}
		jsonString += "\"count\": " + count + ",";
		jsonString += "\"objects\":";
		jsonString += JsonContext;
		jsonString += "} ";
		return jsonString;
	}

	public static String buildFalseJson(int code, String message) {
		String jsonString = "{";
		jsonString += "\"code\": \"" + code + "\", ";
		jsonString += "\"msg\": \"" + message + "\" ";
		jsonString += "}";
		return jsonString;
	}
	public static String buildFalseJson2(int code, String message1,String message2) {
		String jsonString = "{";
		jsonString += "\"code\": \"" + code + "\", ";
		jsonString += "\"url\": \"" + message1 + "\",";
		jsonString += "\"fileName\": \"" + message2 + "\" ";
		jsonString += "}";
		return jsonString;
	}

	/**
	 * 检测jar包
	 * 
	 * @param result
	 * @param detail
	 * @param content
	 * @return
	 */
	public static String buildCheckJarJson(Boolean result, String detail, String content) {
		String jsonString = "{";
		jsonString += "\"result\": " + result + ", ";
		jsonString += "\"detail\": \"" + detail + "\" ";
		jsonString += "\"content\": \"" + content + "\"";
		jsonString += "}";
		return jsonString;
	}

	public static String MapToJson(Map<String, Object> m) {
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		String jsonString = "{";
		String JsonContext = "";
		int count = 0;
		JsonContext = gson.toJson(m);
		count = m.size();
		jsonString += "\"code\": \"0\", ";
		jsonString += "\"msg\": \"处理成功\",";
		jsonString += "\"count\": " + count + ",";
		jsonString += "\"data\":";
		jsonString += JsonContext;
		jsonString += "} ";
		return jsonString;
	}
}
