package cn.dw.zq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.dw.zq.dao.RoleDao;
import cn.dw.zq.model.Role;
import cn.dw.zq.service.RoleService;

/**
 * @author Ken.Leung
 * @version 2018年8月29日 上午10:09:00
 * 
 */
@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao roleDao;

	public RoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	@Override
	public void add(Role role) {
		roleDao.add(role);
	}

	@Override
	public void update(Role role) {
		roleDao.update(role);
	}

	@Override
	public void delete(Role role) {
		roleDao.delete(role);
	}

	@Override
	public List<Role> query(Role role) {
		return roleDao.query(role);
	}

}
