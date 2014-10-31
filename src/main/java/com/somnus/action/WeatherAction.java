package com.somnus.action;

import java.util.Map;
import com.opensymphony.xwork2.ActionSupport;
import com.somnus.webservice.weather.WeatherService;
import com.somnus.webservice.weather.WeatherServiceImpl;

@SuppressWarnings("serial")
public class WeatherAction extends ActionSupport{
	private String provinceParam;
	private String cityParam;
	private Map<String,String> provinceMap;
	private Map<String,String> cityMap;
	private Map<String,String> weatherMap;
	private WeatherService service = new WeatherServiceImpl();
	public String querySupportCity ()
	{
		cityMap = service.getSupportCity(provinceParam);
		
		return "suppCity";
	}
	public String querySupportProvince  ()
	{
		provinceMap = service.getSupportProvince();
		
		return "suppProvince";
	}
	public String queryWeatherbyCityName  ()
	{
		weatherMap = service.getWeatherbyCityName(cityParam);
		
		return "weatherinfo";
	}
	public String getProvinceParam() {
		return provinceParam;
	}
	public void setProvinceParam(String provinceParam) {
		this.provinceParam = provinceParam;
	}
	public String getCityParam() {
		return cityParam;
	}
	public void setCityParam(String cityParam) {
		this.cityParam = cityParam;
	}
	public Map<String, String> getProvinceMap() {
		return provinceMap;
	}
	public void setProvinceMap(Map<String, String> provinceMap) {
		this.provinceMap = provinceMap;
	}
	public Map<String, String> getCityMap() {
		return cityMap;
	}
	public void setCityMap(Map<String, String> cityMap) {
		this.cityMap = cityMap;
	}
	public Map<String, String> getWeatherMap() {
		return weatherMap;
	}
	public void setWeatherMap(Map<String, String> weatherMap) {
		this.weatherMap = weatherMap;
	}
	
	
}
