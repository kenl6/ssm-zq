package cn.dw.zq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import cn.dw.zq.model.Role;
import cn.dw.zq.service.RoleService;

/**
 * @author Ken.Leung
 * @version 2018年8月29日 下午3:22:35
 * 
 */
@Controller // @Service @Repository @Component
@RequestMapping("/role")
public class RoleController {

	@Autowired
	// @Qualifier("roleServiceImpl")
	// @Resource(name = "roleServiceImpl")
	private RoleService roleService;

	@RequestMapping("/page")
	public String page(Role role) {
		return "role/add";
	}

	@RequestMapping("/add")
	@ResponseBody // 指定返回数据
	public String add(Role role) {
		roleService.add(role);
		JSONObject json = new JSONObject();
		json.put("resultCode", "200");
		json.put("result", role);
		return json.toJSONString();
	}

	@RequestMapping("/update")
	@ResponseBody
	public String update(Role role) {
		roleService.update(role);
		JSONObject json = new JSONObject();
		json.put("result", role);
		return json.toJSONString();
	}

	@RequestMapping("/delete")
	@ResponseBody
	public String delete(Role role) {
		roleService.delete(role);
		JSONObject json = new JSONObject();
		json.put("result", "success");
		return json.toJSONString();
	}

	@RequestMapping("/query")
	@ResponseBody
	public List<Role> query(Role role) {
		List<Role> roles = roleService.query(role);
		return roles;
//		JSONObject json = new JSONObject();
//		json.put("result", roles);
//		return json.toJSONString();

		// JSONArray jsonArray = new JSONArray();
		// for (Role ro : roles) {
		// JSONObject json = new JSONObject();
		// json.put(ro.getId().toString(), ro);
		// jsonArray.add(json);
		// }
		// return jsonArray.toJSONString();
	}
}
