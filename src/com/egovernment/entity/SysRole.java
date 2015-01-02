package com.egovernment.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "sysrole")
public class SysRole implements Serializable {
	@Id
	@GeneratedValue
	@Column(length = 12)
	private Long id;
	@Column(length = 18, nullable = false, unique = true)
	private String name;
	@Column(length = 100)
	private String description;
	@Column(length = 2)
	private Integer status;
	@ManyToMany(cascade = CascadeType.MERGE)
	private List<SysModule> sysModules;

	public List<SysModule> getSysModules() {
		return sysModules;
	}

	public void setSysModules(List<SysModule> sysModules) {
		this.sysModules = sysModules;
	}

	public SysRole() {
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
