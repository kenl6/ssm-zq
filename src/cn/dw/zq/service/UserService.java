package cn.dw.zq.service;

import java.util.List;

import cn.dw.zq.model.User;

/**
 * @author Ken.Leung
 * @version 2018年8月31日 上午9:22:18
 * 
 */
public interface UserService {

	public void add(User user);

	public void update(User user);

	public void delete(User user);

	public List<User> query(User user);
}
