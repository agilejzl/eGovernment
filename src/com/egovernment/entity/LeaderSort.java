package com.egovernment.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 领导类别实体类
 * 
 */
@Entity
@Table(name = "leader_sort")
public class LeaderSort implements Serializable {
	@Id
	@GeneratedValue
	@Column(length = 12)
	private Long id;
	@Column(length = 18, nullable = false, unique = true)
	private String position;
	@Column(length = 50)
	private String info;
	@Column(length = 2)
	private Integer status;

	public LeaderSort() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
