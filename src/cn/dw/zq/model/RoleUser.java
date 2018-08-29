package cn.dw.zq.model;

/**
 * @author Ken.Leung
 * @version 2018年8月28日 下午8:35:21
 * 
 */
public class RoleUser {

	private Integer id;

	private Integer roleId;

	private Integer userId;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}
