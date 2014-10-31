package com.somnus.webservice.weather;

import java.util.Map;

public interface WeatherService {
	public Map<String,String> getSupportCity(String province);
	public Map<String,String> getSupportProvince();
	public Map<String,String> getWeatherbyCityName(String ctiy);
}
