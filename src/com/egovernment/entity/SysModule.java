package com.egovernment.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sysmodule")
public class SysModule implements Serializable {
	@Id
	@GeneratedValue
	@Column(length = 12)
	private Long id;
	@Column(length = 18, nullable = false, unique = true)
	private String name;
	@Column(length = 100)
	private String description;
	@Column(length = 50)
	private String link;
	@Column(length = 2)
	private Integer status;

	public SysModule() {
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

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
