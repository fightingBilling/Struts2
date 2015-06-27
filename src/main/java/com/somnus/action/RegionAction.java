package com.somnus.action;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("json-default")
@Namespace("/")
@Action(results = { @Result(name = "region", type = "json", params = { "excludeProperties", "provinceParam,cityParam" }) })
public class RegionAction extends ActionSupport {
    private Map<String, String> provinceMap;
    private Map<String, String> cityMap;
    private Map<String, String> districtMap;
    private String provinceParam;
    private String cityParam;

    public String execute() throws Exception {
        provinceMap = selectProvinceMapData();
        if ("-1".equals(provinceParam) || provinceParam == null) {
            cityMap = null;
        } else {
            cityMap = selectCityMapData();
            Map<String, String> new_cityMap = new HashMap<String, String>();
            for (Iterator<String> it = cityMap.keySet().iterator(); it.hasNext();) {
                String key = it.next();
                if (provinceParam.equals(key.substring(0, 3))) {
                    new_cityMap.put(key, cityMap.get(key));
                }
            }
            cityMap = new_cityMap;

        }
        if ("-1".equals(cityParam) || cityParam == null) {
            districtMap = null;
        } else {
            districtMap = selectDistrictMapData();
            Map<String, String> new_districtMap = new HashMap<String, String>();
            for (Iterator<String> it = districtMap.keySet().iterator(); it.hasNext();) {
                String key = it.next();
                if (cityParam.equals(key.substring(0, 5))) {
                    new_districtMap.put(key, districtMap.get(key));
                }
            }
            districtMap = new_districtMap;

        }

        return "region";
    }

    public Map<String, String> selectProvinceMapData() {
        Map<String, String> provinceMap = new HashMap<String, String>();
        provinceMap.put("100", "上海");
        provinceMap.put("101", "江西");
        return provinceMap;
    }

    public Map<String, String> selectCityMapData() {
        Map<String, String> cityMap = new HashMap<String, String>();
        cityMap.put("10001", "上海");

        cityMap.put("10101", "南昌");
        cityMap.put("10102", "九江");
        cityMap.put("10103", "上饶");
        cityMap.put("10104", "赣州");
        cityMap.put("10105", "宜春");
        cityMap.put("10106", "抚州");
        cityMap.put("10107", "鹰潭");
        cityMap.put("10108", "新余");
        cityMap.put("10109", "景德镇");
        cityMap.put("10110", "萍乡");
        cityMap.put("10111", "吉安");
        return cityMap;
    }

    public Map<String, String> selectDistrictMapData() {
        Map<String, String> districtMap = new HashMap<String, String>();
        districtMap.put("1000101", "黄浦区");
        districtMap.put("1000102", "徐汇区");
        districtMap.put("1000103", "长宁区");
        districtMap.put("1000104", "静安区");
        districtMap.put("1000105", "普陀区");
        districtMap.put("1000106", "闸北区");
        districtMap.put("1000107", "虹口区");
        districtMap.put("1000108", "杨浦区");
        districtMap.put("1000109", "闵行区");
        districtMap.put("1000110", "宝山区");
        districtMap.put("1000111", "嘉定区");
        districtMap.put("1000112", "浦东新区");
        districtMap.put("1000113", "金山区");
        districtMap.put("1000114", "松江区");
        districtMap.put("1000115", "青浦区");
        districtMap.put("1000116", "奉贤区");
        districtMap.put("1000117", "崇明县");

        districtMap.put("1010101", "东湖区");
        districtMap.put("1010102", "西湖区");
        districtMap.put("1010103", "青山湖区");
        districtMap.put("1010104", "青云谱区");
        districtMap.put("1010105", "湾里区");
        districtMap.put("1010106", "南昌县");
        districtMap.put("1010107", "新建县");
        districtMap.put("1010108", "进贤县");
        districtMap.put("1010109", "安义县");

        districtMap.put("1010201", "浔阳区");
        districtMap.put("1010202", "庐山区");
        districtMap.put("1010203", "德安县");
        districtMap.put("1010204", "都昌县");
        districtMap.put("1010205", "共青城市");
        districtMap.put("1010206", "湖口县");
        districtMap.put("1010207", "九江县");
        districtMap.put("1010208", "彭泽县");
        districtMap.put("1010209", "瑞昌市");
        districtMap.put("1010210", "武宁县");
        districtMap.put("1010211", "星子县");
        districtMap.put("1010212", "修水县");
        districtMap.put("1010213", "永修县");
        return districtMap;
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

    public Map<String, String> getDistrictMap() {
        return districtMap;
    }

    public void setDistrictMap(Map<String, String> districtMap) {
        this.districtMap = districtMap;
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

}
