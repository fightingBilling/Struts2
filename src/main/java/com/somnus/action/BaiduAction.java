package com.somnus.action;

import java.util.ArrayList;
import java.util.List;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import com.opensymphony.xwork2.ActionSupport;
import com.somnus.util.HanYu;

@ParentPackage("json-default")
@Namespace("/")
@Action(results = { @Result(name = "baidu", type = "json") })
public class BaiduAction extends ActionSupport {
    private String text;
    private List<String> list;

    @Override
    public String execute() throws Exception {
        list = new ArrayList<String>();
        HanYu hanyu = new HanYu();
        if (text == null || "".equals(text.trim())) {
            return null;
        } else {
            for (int i = 0, count = 0; i < arr.length && count < 10; i++) {
                String py = hanyu.getStringPinYin(arr[i]);
                if (py.indexOf(text) == 0 || arr[i].indexOf(text) == 0) {
                    list.add(arr[i]);
                    count++;
                }
            }
            return "baidu";
        }

    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public List<String> getList() {
        return list;
    }

    public void setList(List<String> list) {
        this.list = list;
    }

    private String[] arr = { "advanced", "ajax", "alfresco", "application", "applications", "aspnet", "asterisk",
            "authentication", "automation", "beginner", "best", "beta", "blogs", "board", "book", "borders", "bpel",
            "building", "计算机", "busy", "calc", "capturing", "cherryp", "clear", "香囊", "com", "communities",
            "community", "complete", "中间", "con", "concise", "configuration", "configuring", "construindo",
            "construyendo", "content", "controls", "cookbook", "costruire", "course", "cpanel", "creating", "custom",
            "customizing", "database", "deep", "definitive", "design", "designing", "developers", "development",
            "digital", "directory", "dns", "documentum", "domino", "dotnetnuke", "drupal", "e-commerce", "elearning",
            "e107", "easy", "香蕉", "email", "encoding", "enhancing", "enterprise", "espanol", "essentials",
            "evaluating", "examples", "execution", "firewalls", "forums", "foundation", "gdi+", "中国", "guide", "gwt",
            "host", "howto", "ideas", "imagemagick", "implementation", "implementing", "inside", "程咬金", "integration",
            "invision", "ipcop", "iproute2", "italiano", "jakarta", "jasperreports", "java", "joomla", "kit",
            "l7-filter", "language", "learn", "learning", "linux", "lotus", "macro", "made", "mambo", "management",
            "苹果", "managing", "mastering", "柳橙", "merging", "microsoft", "migrating", "module", "modules", "moodle",
            "mysql", "nat", "netfilter", "菠萝", "notes", "office", "online", "ooobasic", "open", "opencms", "中土",
            "openswan", "openvpn", "oscommerce", "outlook", "pam", "pear", "performance", "php", "php-nuke", "phpbb",
            "phpeclipse", "planning", "plone", "pluggable", "portals", "portuguese", "power", "practical", "practice",
            "practices", "private", "process", "processing", "professional", "雪碧", "programming", "project-based",
            "python", "qos", "quickly", "rapid", "reference", "remote", "responsive", "run", "sbs", "secure",
            "security", "seo", "server", "计数器", "set", "sistemas", "sistemi", "sitios", "small", "smarty", "soa-based",
            "雪白", "source", "sourcesafe", "spreadsheet", "ssl", "starter", "step-by-step", "stores", "struts",
            "sugarcrm", "sysadmins", "systems", "tcpip", "techniques", "程序员", "telefonici", "telefónicos", "telephony",
            "template", "templates", "tips", "toolkit", "training", "tricks", "trixbox", "tutorial", "uml",
            "understanding", "upgrading", "user", "using", "vbnet", "video", "virtual", "virtualdub", "visual", "vpn",
            "web", "web-based", "website", "程程", "windows", "wordpress", "workflow", "xaml", "安徽", "xoops", "柳树", "江西",
            "江苏", "山东", "山西", "湖南", "湖北", "广东", "广西" };
}
