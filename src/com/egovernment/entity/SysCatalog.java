package com.egovernment.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "syscatalog")
public class SysCatalog implements Serializable {
	@Id
	@GeneratedValue
	@Column(length = 12)
	private Long id;
	@Column(length = 12)
	private Long parentId;
	@Column(length = 18, nullable = false)
	private String name;
	@Column(length = 1)
	private Integer level;
	@Column(length = 100)
	private String content;
	@Column(length = 50)
	private String url;
	@Column(length = 2)
	private Integer status;

	public SysCatalog() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}
