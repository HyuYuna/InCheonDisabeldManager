package kr.co.grit.common.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.beanutils.BeanUtils;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 
 * @FileName 	 : GritConvert.java
 * @Program desc : map, class object, json간의 변환작업 기능을 수행한다.
 */
public class GritConvert {

	private static final Logger LOGGER = LoggerFactory.getLogger(GritConvert.class);
	/**
	 * class object를 map으로 리턴함(단건처리)
     * @param  
     * @return 
     */
	public Map<String, Object> cls2Map(Object obj) {
		
        HashMap<String, Object> resultMap = new HashMap<String, Object>();
        
        try {
            Field[] fields = obj.getClass().getDeclaredFields();

            for(int i=0; i<=fields.length-1;i++){
                if(!fields[i].getName().equalsIgnoreCase("serialVersionUID")){
                    fields[i].setAccessible(true);
                	resultMap.put(fields[i].getName(), fields[i].get(obj));
                }
            }
        } catch (IllegalArgumentException e) {
        	LOGGER.error(e.getMessage());
        } catch (IllegalAccessException e) {
        	LOGGER.error(e.getMessage());
        }
        return resultMap;
    }

	/**
	 * class object를 json 문자열로 리턴함(단건처리)
     * @param  
     * @return 
     */
	public String cls2JsonStr(Object obj) {
		if(obj == null){
			return "{}";
		}
		
		Gson gson = new GsonBuilder().serializeNulls().create();
		String json = gson.toJson(obj);
		return json;
	}

	/**
	 * class를 json 객체로 리턴함
     * @param  
     * @return 
     */
	public JsonObject cls2Json(Object obj) {
		
		if(obj == null){
			JsonParser parser  = new JsonParser();
			return (JsonObject) parser.parse("{}").getAsJsonObject();
		}

		Gson gson = new GsonBuilder().serializeNulls().create();
		JsonObject jsonObject = gson.toJsonTree(obj).getAsJsonObject();
		
		return jsonObject;
	}
	
	/**
	 * map을 class object로 리턴함(단건처리)
     * @param 
     * @return 
     */
	@SuppressWarnings("rawtypes")
	public Object map2cls(Map map, Object objClass){
		
		if(map == null){
			return objClass;
		}
		
		try {
			BeanUtils.populate(objClass,  map);
		} catch (IllegalAccessException e) {
			LOGGER.error(e.getMessage());
		} catch (InvocationTargetException e) {
			LOGGER.error(e.getMessage());
		}
        return objClass;
    }
	
	/**
	 * map을 json 문자열로 리턴함(단건처리)
     * @param  
     * @return 
     */
	@SuppressWarnings("rawtypes")
	public String map2JsonStr(Map map) {
		if(map == null){
			return "{}";
		}
		
		Gson gson = new GsonBuilder().serializeNulls().create();
		String json = gson.toJson(map);
		return json;
	}
	
	/**
	 * map을 jsonobject로 리턴함(단건처리)
     * @param  
     * @return 
     */
	@SuppressWarnings("rawtypes")
	public JsonObject map2Json(Map map) {

		if(map == null){
			JsonParser parser  = new JsonParser();
			return (JsonObject) parser.parse("{}").getAsJsonObject();
		}

		Gson gson = new GsonBuilder().serializeNulls().create();
		JsonObject jsonObject = gson.toJsonTree(map).getAsJsonObject();
		
		return jsonObject;
	}
	
	/**
	 * json 문자열을 jsonobject로 리턴함(단건처리)
     * @param  
     * @return 
     */
	public JsonObject jsonStr2Json(String jsonStr) {

		JsonParser parser  = new JsonParser();
		
		if(jsonStr == null || StringUtils.isEmpty(jsonStr) || "[".equalsIgnoreCase(String.valueOf(jsonStr.charAt(0)))){
			return (JsonObject) parser.parse("{}").getAsJsonObject();
		}
		
		JsonObject jsonObject = parser.parse(jsonStr).getAsJsonObject();
		return jsonObject;
	}
	
	/**
	 * json 문자열을 JsonArry로 리턴함(단건처리)
     * @param  
     * @return 
     */
	public JsonArray jsonArrayStr2JsonArry(String jsonStr) {
		
		if(jsonStr == null || StringUtils.isEmpty(jsonStr) || !"[".equalsIgnoreCase(String.valueOf(jsonStr.charAt(0)))){
			return (JsonArray) new JsonParser().parse("[{}]");
		}
		
		JsonArray jsonArray = (JsonArray) new JsonParser().parse(jsonStr);
		return jsonArray;
	}

	/**
	 * JsonObject를 문자열로 리턴함
     * @param  
     * @return 
     */
	public String json2JsonStr(JsonObject jsonObject) {
		
		if(jsonObject == null){
			return "{}";
		}
		return jsonObject.toString();
	}

	/**
	 * JsonArray를 문자열로 리턴함
     * @param  
     * @return 
     */
	public String json2JsonStr(JsonArray jsonArray) {
		
		if(jsonArray == null){
			return "[{}]";
		}
		return jsonArray.toString();
	}

	/**
	 * json 문자열을 map로 리턴함(단건처리)
     * @param  
     * @return 
     */
	@SuppressWarnings("unchecked")
	public static  Map<String, Object> jsonStr2Map(String jsonStr) {
		
		if(jsonStr == null || StringUtils.isEmpty(jsonStr)){
			return null;
		}
		
		Gson gson = new Gson();
		Map<String, Object> map = new HashMap<String, Object>();
		map = gson.fromJson(jsonStr, map.getClass());
		
		return map;
	}

	/**
	 * jsonArray문자열을 List map<String, Object>로 리턴함
     * @param  
     * @return 
     */
	public List<Map<String, Object>> jsonArrayStr2List(String jsonStr) {
	    
		if(jsonStr == null || StringUtils.isEmpty(jsonStr) || !"[".equalsIgnoreCase(String.valueOf(jsonStr.charAt(0)))){
			return null;
		}
		
		JsonParser parser  = new JsonParser();
		final JsonElement jsonElement = parser.parse(jsonStr);

	    List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	    Type listType = TypeToken.get(list.getClass()).getType();
	    list = (new Gson()).fromJson(jsonElement, listType);
	    
	    return list;
	}

	
	/**
	 * json 문자열을 Class로 리턴함(단건처리)
     * @param  
     * @return 
     */
	public <T> Object jsonStr2Cls(String jsonStr, Class<T> classT) {
		if(classT == null){
			return null;
		}
		
		if(jsonStr == null || StringUtils.isEmpty(jsonStr)){
			return classT;
		}
		
	   Gson gson = new GsonBuilder().create();
	   Object resultObj = gson.fromJson(jsonStr, classT);
       return resultObj;
	}
	
	/**
	 * jsonArray 문자열을 List로 리턴함
	 * @param <T>
     * @param  
     * @return 
     */
	public <T> List<T> jsonArrayStr2ListCls(String jsonArrayStr, Class<T[]> classT) {
		
		if(classT == null){
			return null;
		}

		if(jsonArrayStr == null || StringUtils.isEmpty(jsonArrayStr)){
			return null;
		}
		
		Gson gson = new GsonBuilder().serializeNulls().create();
		T[] jsonToObject = gson.fromJson(jsonArrayStr, classT);
		return Arrays.asList(jsonToObject);
	}

	/**
	 * _문자열을 제거하고 문장을 대문자로 시작
     * @param  변환할 문자열
     * @return 
     */
	private String capitalize(String str){
		if(str == null || StringUtils.isEmpty(str)){
			return "";
		}
		
		String result = "";
		
		if(str.indexOf("_") > 0){
			String temp[] = str.split("_"); 
		    StringBuffer sb = new StringBuffer();
		    
		    for(int i=0;i<temp.length;i++){
		        sb.append(StringUtils.capitalize(temp[i]));	            	
		    }
		    
		    result = sb.toString();
		} else {
			result = StringUtils.capitalize(str);
		}
	    return result;
	}

	/**
     * 단건 json 문자열  map으로 변환
     * @param  bean the bean
     * @return the string
     */
	@SuppressWarnings("null")
	public Map<String, Object> strToMap(String reqData) {
    	Map<String,Object> map = new HashMap<String,Object>();
    	
    	if(!(reqData == null && "".equals(reqData))){
    		map = GritConvert.jsonStr2Map(reqData);
    		if(map == null){
    			map = new HashMap<String,Object>();
    		}
    	}
    	return map;
    }
  
	/**
     * 자바 리플렉션을 통해서 해당 멤버 변수의 내용을 문자열 출력한다.
     * @param  bean the bean
     * @return the string
     */
    public String toString(Object bean) {
        if(bean == null) {
        	return "";
        }
        String result = ReflectionToStringBuilder.toString(bean);
        return result;
    }	
}
