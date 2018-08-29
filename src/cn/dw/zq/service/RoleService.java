package cn.dw.zq.service;

import java.util.List;

import cn.dw.zq.model.Role;

/**
 * @author Ken.Leung
 * @version 2018年8月29日 上午10:06:06
 * 
 */
public interface RoleService {

	public void add(Role role);

	public void update(Role role);

	public void delete(Role role);

	public List<Role> query(Role role);
}
