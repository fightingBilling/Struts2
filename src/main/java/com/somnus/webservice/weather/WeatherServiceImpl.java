package com.somnus.webservice.weather;

import java.util.LinkedHashMap;
import java.util.Map;
import cn.com.webxml.ArrayOfString;
import cn.com.webxml.WeatherWebService;
import cn.com.webxml.WeatherWebServiceSoap;

public class WeatherServiceImpl implements WeatherService {

	public Map<String, String> getSupportCity(String province) {
		WeatherWebService wws = new WeatherWebService();  
		WeatherWebServiceSoap soap = wws.getWeatherWebServiceSoap();  
		ArrayOfString aos = soap.getSupportCity (province);  
		Map<String,String> map = new LinkedHashMap<String,String>();
		for (String s : aos.getString()) 
	    {     
			map.put(s.substring(s.indexOf("(")+1, s.indexOf(")")), s.substring(0, s.indexOf("(")).trim());
	    }  
		return map;
	}

	public Map<String, String> getSupportProvince() {
		WeatherWebService wws = new WeatherWebService();  
		WeatherWebServiceSoap soap = wws.getWeatherWebServiceSoap();  
		ArrayOfString aos = soap.getSupportProvince ();  
		Map<String,String> map = new LinkedHashMap<String,String>();
		for (String s : aos.getString()) 
	    {     
			map.put(s, s);
	    }  
		return map;
	}

	public Map<String, String> getWeatherbyCityName(String ctiy) {
		WeatherWebService wws = new WeatherWebService();  
		WeatherWebServiceSoap soap = wws.getWeatherWebServiceSoap();  
		ArrayOfString aos = soap.getWeatherbyCityName (ctiy);  
		Map<String,String> map = new LinkedHashMap<String,String>();
		String[] key = new String[]{"province","cityname","citycode","cityjpg","lastupdate",
				"intradayTemp","generalSituation","WindDirectionAndForce ","beginTendencyJpg","endTendencyJpg","now","exponent",
				"intradayTemp2","generalSituation2","WindDirectionAndForce2","beginTendencyJpg2","endTendencyJpg2",
				"intradayTemp3","intradayTemp3","WindDirectionAndForce3","beginTendencyJpg3","endTendencyJpg3",
				"areaInfo"};
		int index = 0;
		for (String s : aos.getString()) 
	    {   
			map.put(key[index], s);
			index++;
	    }  
		return map;
	}

}
