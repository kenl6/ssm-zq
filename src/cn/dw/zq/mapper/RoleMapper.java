package cn.dw.zq.mapper;

import java.util.List;

import cn.dw.zq.model.Role;

/**
 * @author Ken.Leung
 * @version 2018年8月29日 下午5:22:35
 * 
 */
public interface RoleMapper {
	
	public void add(Role role);

	public void update(Role role);

	public void delete(Role role);

	public List<Role> query(Role role);
}
