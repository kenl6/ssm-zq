package cn.dw.zq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;

import cn.dw.zq.model.User;
import cn.dw.zq.service.UserService;

/**
* @author Ken.Leung
* @version 2018年8月31日 上午9:27:42
* 
*/
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/page")
	public String page(){
		return("user/add");
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public String add(User user){
		userService.add(user);
		JSONObject json = new JSONObject();
		json.put("result", "success");
		json.put("data", user);
		return json.toJSONString();
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public String update(User user){
		userService.update(user);
		JSONObject json = new JSONObject();
		json.put("result", "success");
		json.put("data", user);
		return json.toString();
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(User user){
		userService.delete(user);
		JSONObject json = new JSONObject();
		json.put("result", "success");
		json.put("data", user);
		return json.toString();
	}
	
	@RequestMapping("/query")
	@ResponseBody
	public List<User> query(User user){
		List<User> users = userService.query(user);
		return users;
	}
}
