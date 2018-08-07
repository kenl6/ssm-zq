package cn.dw.zq.mapper;

import java.util.List;

import cn.dw.zq.model.User;

/**
* @author Ken.Leung
* @version 2018年8月31日 上午9:09:15
* 
*/
public interface UserMapper {
	
	public void add(User user);
	
	public void update(User user);
	
	public void delete(User user);
	
	public List<User> query(User user);
}
