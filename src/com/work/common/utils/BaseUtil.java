package com.work.common.utils;

import org.apache.log4j.Logger;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.alibaba.fastjson.JSON;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;

public class BaseUtil extends WebMvcConfigurerAdapter {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(BaseUtil.class);

	public void writeJson(HttpServletResponse response, Object object) {
		try {
			String json = JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss");
			response.setContentType("text/html;charset=utf-8");
			response.getWriter().write(json);
			response.getWriter().flush();
		} catch (IOException e) {
			logger.error("返回流失败");
		} finally {

			try {
				response.getWriter().close();
			} catch (IOException e) {

				logger.error("关闭输出流失败");
			}
		}
	}

	protected void output(HttpServletResponse response, String jsonResult) {
		try {
			response.setContentType("application/json; charset=UTF-8");
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setHeader("Access-Control-Allow-Methods", "POST,GET,OPTIONS");
			response.setHeader("Access-Control-Allow-Credentials", "true");
			response.setContentLength(jsonResult.getBytes("UTF-8").length);
			logger.debug("response json: " + jsonResult);
			// response.getOutputStream().write(jsonResult.getBytes());
			// printStream.println(result);
			PrintWriter printWriter = response.getWriter();
			printWriter.write(jsonResult);
			printWriter.flush();
			// response.getOutputStream().
		} catch (Exception e) {
			logger.error("Error output json data to the client!!!orginal json=" + jsonResult, e);
		}
	}

	protected void writeString(String str) {
		HttpServletResponse response = ((ServletWebRequest) RequestContextHolder.getRequestAttributes()).getResponse();
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter printWriter;
		try {
			printWriter = response.getWriter();
			printWriter.write(str);
			printWriter.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private Map<String, Object> session;

	public Map<String, Object> getSession() {
		return session;
	}

	public void setSession(Map<String, Object> arg0) {
		session = arg0;
	}
}
