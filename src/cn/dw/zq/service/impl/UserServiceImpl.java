package cn.dw.zq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.dw.zq.mapper.UserMapper;
import cn.dw.zq.model.User;
import cn.dw.zq.service.UserService;

/**
* @author Ken.Leung
* @version 2018年8月31日 上午9:23:51
* 
*/
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public void add(User user) {
		userMapper.add(user);
	}

	@Override
	public void update(User user) {
		userMapper.update(user);
	}

	@Override
	public void delete(User user) {
		userMapper.delete(user);
	}

	@Override
	public List<User> query(User user) {
		return userMapper.query(user);
	}

}
