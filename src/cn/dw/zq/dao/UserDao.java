package cn.dw.zq.dao;

import java.util.List;

import cn.dw.zq.model.User;

/**
* @author Ken.Leung
* @version 2018年8月28日 下午8:56:15
* 
*/
public interface UserDao {
	
	public void add(User user);
	
	public void update(User user);
	
	public void delete(User user);
	
	public List<User> query(User user);
}
