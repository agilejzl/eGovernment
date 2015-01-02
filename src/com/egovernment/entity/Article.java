package com.egovernment.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "article")
public class Article implements Serializable {
	@Id
	@GeneratedValue
	@Column(length = 12)
	private Long id;
	@ManyToOne
	private SysCatalog sysCatalog;// 所属栏目
	@Column(length = 100, nullable = false)
	private String title;// 文章标题
	@Column(length = 100)
	private String subTitle;// 副标题
	@Column(length = 10000, nullable = false)
	private String content;// 详细内容
	@Column(length = 18)
	private String author;// 作者
	@Column(length = 18)
	private String source;// 来源
	@Column(length = 12)
	private Integer hits;// 点击数
	/**
	 * 状态，0表示审核通过，1表示等待审核，2表示审核不通过
	 */
	@Column(length = 2)
	private Integer status;
	@Column(length = 100)
	private String url;// 链接

	@Column(length = 18)
	private String createAuthor;
	@Column
	private Date createTime;// 创建日期
	@Column(length = 24)
	private String createIp;// 创建ip
	@Column(length = 18)
	private String auditAuthor;// 审核人
	private Date auditTime;// 审核时间
	@Column(length = 24)
	private String auditIp;// 审核ip
	@Column(length = 50)
	private String fileName;// 文件名

	public Article() {
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

	public String getSubTitle() {
		return subTitle;
	}

	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public Integer getHits() {
		return hits;
	}

	public void setHits(Integer hits) {
		this.hits = hits;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getCreateAuthor() {
		return createAuthor;
	}

	public void setCreateAuthor(String createAuthor) {
		this.createAuthor = createAuthor;
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

	public String getAuditAuthor() {
		return auditAuthor;
	}

	public void setAuditAuthor(String auditAuthor) {
		this.auditAuthor = auditAuthor;
	}

	public Date getAuditTime() {
		return auditTime;
	}

	public void setAuditTime(Date auditTime) {
		this.auditTime = auditTime;
	}

	public String getAuditIp() {
		return auditIp;
	}

	public void setAuditIp(String auditIp) {
		this.auditIp = auditIp;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
