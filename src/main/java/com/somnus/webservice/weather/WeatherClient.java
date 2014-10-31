package com.somnus.webservice.weather;

import java.util.Map;

import cn.com.webxml.ArrayOfString;
import cn.com.webxml.WeatherWebService;
import cn.com.webxml.WeatherWebServiceSoap;

public class WeatherClient {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		/*WeatherWebService wws = new WeatherWebService();  
		
        WeatherWebServiceSoap wwsp = wws.getWeatherWebServiceSoap();  */
          
        /*ArrayOfString aos = wwsp.getWeatherbyCityName("上海");  
          
        for (String s : aos.getString()) 
        {     
            System.out.println(s);  
        } */
       /* ArrayOfString aos2 = wwsp.getSupportProvince ();  
        
        for (String s : aos2.getString()) 
        {     
            System.out.println(s);  
        }  */
        WeatherService service = new WeatherServiceImpl();
        Map<String,String> provinceMap = service.getSupportProvince();
        for(String data:provinceMap.keySet())
        {
        	System.out.println(data);
        }
	}

}
