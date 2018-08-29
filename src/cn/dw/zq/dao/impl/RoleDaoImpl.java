package cn.dw.zq.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import cn.dw.zq.dao.RoleDao;
import cn.dw.zq.model.Role;
import cn.dw.zq.utils.JdbcUtil;

/**
 * @author Ken.Leung
 * @version 2018年8月28日 下午9:00:36
 * 
 */
@Repository
public class RoleDaoImpl implements RoleDao {

	@Override
	public void add(Role role) {
		String sql = "insert into role(name,remarks) values('" + role.getName() + "','" + role.getRemarks() + "')";
		JdbcUtil.excute(sql);
	}

	@Override
	public void update(Role role) {
		String sql = "update role set name='" + role.getName() + "', remarks='" + role.getRemarks() + "' where id = "
				+ role.getId();
		JdbcUtil.excute(sql);
	}

	@Override
	public void delete(Role role) {
		String sql = "delete from role where id = " + role.getId();
		JdbcUtil.excute(sql);
	}

	@Override
	public List<Role> query(Role role) {
		String sql = "select * from role";
		List<Role> results = JdbcUtil.excuteQuery(sql, Role.class);
		return results;
	}

	public static void main(String[] args) {
		Role role = new Role();
		role.setId(1);
		role.setName("角色");
		role.setRemarks("rem");
		RoleDaoImpl im = new RoleDaoImpl();
//		im.delete(role);
		
		List<Role> results = im.query(role);
		for(Role r : results){
			System.out.println(r);
		}
	}
}
