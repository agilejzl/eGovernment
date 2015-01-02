package com.egovernment.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "sysuser")
public class SysUser implements Serializable {
	@Id
	@GeneratedValue
	@Column(length = 12)
	private Long id;
	@Column(length = 24, nullable = false)
	private String name;
	@Column(length = 48, nullable = false, unique = true)
	private String pass;
	@Column(length = 18)
	private String trueName;
	@Column(length = 100)
	private String description;
	@Column(length = 2)
	private Integer status;
	@ManyToMany(cascade = CascadeType.MERGE)
	private List<SysRole> sysRoles;

	/**
	 * 获取用户可访问的所有模块
	 * 
	 * @return 用户可访问的所有模块列表
	 */
	public List<SysModule> getAllModules() {
		List<SysModule> allModules = new ArrayList<SysModule>();
		for (SysRole sysRole : sysRoles) {
			for (SysModule sysModule : sysRole.getSysModules()) {
				if (!allModules.contains(sysModule)) {
					allModules.add(sysModule);
				}
			}
		}
		return allModules;
	}

	public List<SysRole> getSysRoles() {
		return sysRoles;
	}

	public void setSysRoles(List<SysRole> sysRoles) {
		this.sysRoles = sysRoles;
	}

	public SysUser() {
	}

	public SysUser(String name, String pass) {
		super();
		this.name = name;
		this.pass = pass;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getTrueName() {
		return trueName;
	}

	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
