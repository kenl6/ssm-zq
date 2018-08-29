package cn.dw.zq.dao;

import java.util.List;

import cn.dw.zq.model.Role;

/**
 * @author Ken.Leung
 * @version 2018年8月28日 下午8:43:47
 * 
 */
public interface RoleDao {

	public void add(Role role);

	public void update(Role role);

	public void delete(Role role);

	public List<Role> query(Role role);
	
}
