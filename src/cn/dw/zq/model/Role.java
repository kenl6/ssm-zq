package cn.dw.zq.model;

/**
 * @author Ken.Leung
 * @version 2018年8月28日 下午8:27:20
 * 
 */
public class Role {

	private Integer id;

	private String name;

	private String remarks;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Override
	public String toString() {
		return "Role [id=" + id + ", name=" + name + ", remarks=" + remarks + "]";
	}

}
