package com.egovernment.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "feedback")
public class Feedback implements Serializable {
	@Id
	@GeneratedValue
	@Column(length = 12)
	private Long id;
	@ManyToOne
	private SysCatalog sysCatalog;
	@Column(length = 100, nullable = false)
	private String title;
	@Column(length = 18)
	private String author;
	@Column(length = 10000, nullable = false)
	private String content;
	private Date createTime;
	@Column(length = 24)
	private String createIp;
	private String viewTime;
	@Column(length = 18)
	private String viewAdmin;
	private Date dealtime;
	@Column(length = 18)
	private String dealResult;
	@Column(length = 100)
	private String dealProcess;
	@Column(length = 18)
	private String dealAdmin;
	@Column(length = 2)
	private Integer status;

	public Feedback() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public SysCatalog getSysCatalog() {
		return sysCatalog;
	}

	public void setSysCatalog(SysCatalog sysCatalog) {
		this.sysCatalog = sysCatalog;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreateIp() {
		return createIp;
	}

	public void setCreateIp(String createIp) {
		this.createIp = createIp;
	}

	public String getViewTime() {
		return viewTime;
	}

	public void setViewTime(String viewTime) {
		this.viewTime = viewTime;
	}

	public String getViewAdmin() {
		return viewAdmin;
	}

	public void setViewAdmin(String viewAdmin) {
		this.viewAdmin = viewAdmin;
	}

	public Date getDealtime() {
		return dealtime;
	}

	public void setDealtime(Date dealtime) {
		this.dealtime = dealtime;
	}

	public String getDealResult() {
		return dealResult;
	}

	public void setDealResult(String dealResult) {
		this.dealResult = dealResult;
	}

	public String getDealProcess() {
		return dealProcess;
	}

	public void setDealProcess(String dealProcess) {
		this.dealProcess = dealProcess;
	}

	public String getDealAdmin() {
		return dealAdmin;
	}

	public void setDealAdmin(String dealAdmin) {
		this.dealAdmin = dealAdmin;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}
