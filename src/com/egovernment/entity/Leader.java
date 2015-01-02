package com.egovernment.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "leader")
public class Leader implements Serializable {
	@Id
	@GeneratedValue
	@Column(length = 12)
	private Long id;
	@Column(length = 12)
	private Long parentId;
	@ManyToOne
	private LeaderSort leaderSort;
	@Column(length = 18)
	private String name;
	@Column(length = 50, nullable = false)
	private String duty;
	@Column(length = 100)
	private String resume;
	@Column(length = 50)
	private String photo;
	@Column(length = 30)
	private String email;
	@Column(length = 20)
	private String serialNum;
	@Column(length = 2)
	private Integer status;
	@Column(length = 1)
	private Integer isIndex;

	public Leader() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public LeaderSort getLeaderSort() {
		return leaderSort;
	}

	public void setLeaderSort(LeaderSort leaderSort) {
		this.leaderSort = leaderSort;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSerialNum() {
		return serialNum;
	}

	public void setSerialNum(String serialNum) {
		this.serialNum = serialNum;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getIsIndex() {
		return isIndex;
	}

	public void setIsIndex(Integer isIndex) {
		this.isIndex = isIndex;
	}

}
