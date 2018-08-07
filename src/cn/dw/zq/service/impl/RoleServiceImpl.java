package cn.dw.zq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.dw.zq.mapper.RoleMapper;
import cn.dw.zq.model.Role;
import cn.dw.zq.service.RoleService;

/**
 * @author Ken.Leung
 * @version 2018年8月29日 上午10:09:00
 * 
 */
@Service
public class RoleServiceImpl implements RoleService {

	// @Autowired
	// private RoleDao roleDao;
	//
	// public RoleDao getRoleDao() {
	// return roleDao;
	// }
	//
	// public void setRoleDao(RoleDao roleDao) {
	// this.roleDao = roleDao;
	// }
	@Autowired
	private RoleMapper roleMapper;

	@Override
	@Transactional // 开启事务
	public void add(Role role) {
		roleMapper.add(role);
		System.out.println(role.getId());
		// int i = 1 / 0;
		// roleMapper.add(role);
	}

	@Override
	public void update(Role role) {
		roleMapper.update(role);
	}

	@Override
	public void delete(Role role) {
		roleMapper.delete(role);
	}

	@Override
	public List<Role> query(Role role) {
		return roleMapper.query(role);
	}

}
