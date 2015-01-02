<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title><s:property value="%{@com.egovernment.util.PropertyUtil@get('app.name')}" /></title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/bootstrap/css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/docs.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/prettify.css">

<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/js/application.js"></script>

<script type="text/javascript">
	function gotoUrl(url) {
		if (url) {
			window.open(url);
		}
	}

	$(function() {
		/* article_gg = "<a href='view/article_get?articleId=<s:property
																		value="#request.article_gg.id" />'><s:property value="#request.article_gg.content" />";
		article_gg = article_gg.replace(/&lt;/g, "<");
		article_gg = article_gg.replace(/&gt;/g, ">");
		article_gg = article_gg.replace(/&nbsp;/g, " ");
		$(".article_gg").children().append(article_gg); */
	});
</script>

</head>
<jsp:include page="/view/top.jsp"></jsp:include>
<div class="container">
		<div class="row">
				<div class="span2">
						<!-- 领导之窗 --> <br /> 公告公示
						<div class="article_gg">
								<a href="#"></a>
						</div>
				</div>

				<div class="span6">
						<div id="myCarousel" class="carousel slide">
								<ol class="carousel-indicators">
										<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
										<li data-target="#myCarousel" data-slide-to="1" class=""></li>
										<li data-target="#myCarousel" data-slide-to="2" class=""></li>
								</ol>
								<div class="carousel-inner">
										<div class="item active">
												<img src="upload/img/86088043.jpg" alt="">
												<div class="carousel-caption">
														<h4>五年前，五年后</h4>
														<p>2008年5月12日14时28分，四川省汶川县发生里氏8.0级地震，造成8万多人遇难或失踪。
																如今，5年过去了，翻看那些旧照片，早已物是人非。此时，让我们缅怀逝者，并为那些从废墟上站起来的人，送上深深的祝福。</p>
												</div>
										</div>
										<div class="item">
												<img src="upload/img/86083278.jpg" alt="">
												<div class="carousel-caption">
														<h4>那些光彩夺目星光熠熠的“名妈”</h4>
														<p>世界上有这么一群女性：她们或位高权重，或身份显赫，或万众瞩目。然而，她们却都有一个共同的身份——母亲。</p>
												</div>
										</div>
										<div class="item">
												<img src="upload/img/86092865.jpg" alt="">
												<div class="carousel-caption">
														<h4>新护士艳阳下“运动健身”迎接护士节</h4>
														<p>5月11日，上百名新入行的北京同仁医院护士冒着30摄氏度的高温参加该院运动会，与男医生协力竞技推轮椅比赛，迎接5月12日护士节的到来。</p>
												</div>
										</div>
								</div>
								<a class="left carousel-control" href="#myCarousel" data-slide="prev">‹</a> <a
										class="right carousel-control" href="#myCarousel" data-slide="next">›</a>
						</div>
				</div>

				<div class="span4">
						动态新闻
						<table>
								<s:iterator value="#request.articleList_dt" var="article" status="rowstatus">
										<tr>
												<td><a
														href="view/article_get?articleId=<s:property
																		value='#request.article.id' />"><s:property
																		value="%{@com.egovernment.util.StrUtil@subStr(#article.title,24)}" /> </a>
												</td>
												<%-- <td>[<s:property value="#article.createTime" />]</td> --%>
										</tr>
								</s:iterator>
						</table>
						<br />经济状态
						<table>
								<s:iterator value="#request.articleList_jj" var="article" status="rowstatus">
										<tr>
												<td><a
														href="view/article_get?articleId=<s:property
																		value='#request.article.id' />"><s:property
																		value="%{@com.egovernment.util.StrUtil@subStr(#article.title,24)}" /> </a>
												</td>
										</tr>
								</s:iterator>
						</table>
				</div>
		</div>
		<!-- <hr />
		<div class="row">
				<div class="span3">投资招商</div>

				<div class="span9">
						行政许可服务中心 <br />政民互动
				</div>
		</div>
		<hr /> -->
		<div class="row">
				<div class="span12">
						<span class="span1"></span> <select class="span2" name=""
								onchange="gotoUrl(this.options[this.selectedIndex].value)"><option>中央部门网站</option>
								<option value="http://www.mfa.gov.cn/chn/">外交部</option>
								<option value="http://www.mps.gov.cn">公安部</option>
								<option value="http://www.mwr.gov.cn">水利部</option>
								<option value="http://www.ccnt.gov.cn">文化部</option>
								<option value="http://www.most.gov.cn/">科学技术部</option>
								<option value="http://www.molss.gov.cn/">劳动和社会保障部</option>
								<option value="http://www.cin.gov.cn/">建设部</option>
								<option value="http://www.seac.gov.cn/">国家民族事务委员会</option>
								<option value="http://www.sara.gov.cn/">国家宗教事务局</option>
								<option value="http://www.moc.gov.cn/">交通部</option>
								<option value="http://www.china-mor.gov.cn">铁道部</option>
								<option value="http://www.mii.gov.cn/">信息产业部</option>
								<option value="http://www.agri.gov.cn/">农业部</option>
								<option value="http://www.mca.gov.cn/">民政部</option>
								<option value="http://www.moe.edu.cn/">教育部</option>
								<option value="http://www.sdpc.gov.cn/">国家发展和改革委员会</option>
								<option value="http://www.mop.gov.cn/">人事部</option>
								<option value="http://www.costind.gov.cn/">国防科学技术工业委员会</option>
								<option value="http://www.mofcom.gov.cn/">商务部</option>
								<option value="http://www.legalinfo.gov.cn/">司法部</option>
								<option value="http://www.mof.gov.cn/">财政部</option>
								<option value="http://www.mlr.gov.cn/">国土资源部</option>
								<option value="http://www.moh.gov.cn/">卫生部</option>
								<option value="http://www.chinapop.gov.cn/">国家人口和计划生育委员会</option>
								<option value="http://www.pbc.gov.cn/">中国人民银行</option>
								<option value="http://www.audit.gov.cn/cysite/chpage/c1/">审计署</option>
								<option value="http://www.gapp.gov.cn/">国家新闻出版署</option>
								<option value="http://www.customs.gov.cn">海关总署</option>
								<option value="http://www.aqsiq.gov.cn">国家质量监督检验检疫总局</option>
								<option value="http://www.cnta.com">国家旅游局</option>
								<option value="http://www.stats.gov.cn">国家统计局</option>
								<option value="http://www.sport.gov.cn">国家体育总局</option>
								<option value="http://www.caac.gov.cn/">中国民用航空总局</option>
								<option value="http://www.zhb.gov.cn/">国家环境保护总局</option>
								<option value="http://www.chinatax.gov.cn/">中国国家税务总局</option>
								<option value="http://www.saic.gov.cn/">国家工商行政管理总局</option>
								<option value="http://www.ncac.gov.cn/">国家版权局</option>
								<option value="http://www.ggj.gov.cn/">国务院机关事务管理局</option>
								<option value="http://www.sarft.gov.cn/">国家广播电影电视总局</option>
								<option value="http://www.forestry.gov.cn/">国家林业局</option>
								<option value="http://www.sda.gov.cn/">国家食品药品监督管理局</option>
								<option value="http://www.sipo.gov.cn/">国家知识产权局</option>
								<option value="http://www.chinasafety.gov.cn/">国家安全生产监督管理局</option>
								<option value="http://www.sasac.gov.cn/">国务院国有资产监督管理委员会</option>
								<option value="http://www.chinacoal-safety.gov.cn/">国家煤矿安全监察局</option>
								<option value="http://www.3g.gov.cn">国务院三峡工程建设委员会办公室</option>
								<option value="http://www.gwytb.gov.cn/">国务院台湾事务办公室</option>
								<option value="http://www.chinawest.gov.cn/">国务院西部开发领导小组办公室</option>
								<option value="http://www.chinalaw.gov.cn/">国务院法制办公室</option>
								<option value="http://www.nsbd.gov.cn">国务院南水北调工程建设委员会办公室</option>
								<option value="http://www.drc.gov.cn/">国务院发展研究中心</option>
								<option value="http://www.cma.gov.cn">中国气象局</option>
								<option value="http://www.cass.net.cn">中国社会科学院</option>
								<option value="http://www.cashq.ac.cn">中国科学院</option>
								<option value="http://www.circ.gov.cn/">中国保险监督管理委员会</option>
								<option value="http://www.nsfc.gov.cn/">国家自然科学基金委员会</option>
								<option value="http://www.csrc.gov.cn/">中国证券监督管理委员会</option>
								<option value="http://www.cea.gov.cn/">中国地震局</option>
								<option value="http://www.xinhua.org/">新华通讯社</option>
								<option value="http://www.cae.cn/">中国工程院</option>
								<option value="http://www.nsa.gov.cn/">国家行政学院</option>
								<option value="http://www.cbrc.gov.cn/">中国银行业监督管理委员会</option>
								<option value="http://www.safe.gov.cn">国家外汇管理局</option>
								<option value="http://www.soa.gov.cn/">国家海洋局</option>
								<option value="http://www.satcm.gov.cn/">国家中医药管理局</option>
								<option value="http://www.chinapost.gov.cn/">国家邮政局</option>
								<option value="http://www.cnsa.gov.cn/">国家航天局</option>
								<option value="http://www.safea.gov.cn/">国家外国专家局</option>
								<option value="http://www.tobacco.gov.cn/">国家烟草专卖局</option>
								<option value="http://www.grain.gov.cn/">国家粮食局</option>
								<option value="http://www.sbsm.gov.cn/">国家测绘局</option>
								<option value="http://www.sach.gov.cn/">国家文物局</option>
								<option value="http://www.caea.gov.cn/">国家原子能机构</option>
								<option value="http://www.saac.gov.cn/">国家档案局</option>
								<option value="http://www.idcpc.org.cn/">中共中央对外联络部</option>
								<option value="http://www.nlc.gov.cn/">中国国家图书馆</option>
								<option value="http://www.mei.net.cn/">中国机械工业联合会</option>
								<option value="http://www.clii.com.cn/">中国轻工业联合会</option>
								<option value="http://www.bm.cei.gov.cn/">中国建筑材料工业协会</option>
								<option value="http://www.mmi.gov.cn">中国钢铁工业协会</option>
								<option value="http://www.acfic.com.cn/">中华全国工商业联合会</option>
								<option value="http://www.chinacoal.gov.cn/">中国煤炭工业协会</option>
								<option value="http://www.ctei.gov.cn/">中国纺织工业协会</option>
								<option value="http://www.chinacoop.gov.cn/">中华全国供销合作总社</option>
								<option value="http://www.cpcia.org.cn/">中国石油和化学工业协会</option>
								<option value="http://www.sic.gov.cn/">国家信息中心</option>
								<option value="http://www.cctb.net/">中共中央编译局</option>
								<option value="http://www.acftu.org/">中华全国总工会</option>
								<option value="http://www.ccyl.org.cn/">共青团中央</option>
								<option value="http://www.women.org.cn/">中华全国妇女联合会</option>
								<option value="http://www.acyf.org.cn">中华全国青年联合会</option>
								<option value="http://www.ccyl.org.cn/xl/">中华全国学生联合会</option>
								<option value="http://www.chinaql.org/">中华全国归国华侨联合会</option>
								<option value="http://www.tailian.org.cn/">中华全国台湾同胞联谊会</option>
								<option value="http://www.cast.org.cn/">中国科学技术协会</option>
								<option value="http://www.cflac.org.cn/">中国文学艺术界联合会</option>
								<option value="http://www.cdpf.org.cn/">中国残疾人联合会</option>
								<option value="http://www.ccpit.org/">中国国际贸易促进委员会</option>
								<option value="http://www.cca.org.cn/">中国消费者协会</option>
						</select> <select class="span2" name="" onchange="gotoUrl(this.options[this.selectedIndex].value)"><option>各省市政府部门网站</option>
								<option value="http://www.chinataiwan.org/">中国台湾</option>
								<option value="http://www.beijing.gov.cn">北京</option>
								<option value="http://www.tj.gov.cn">天津</option>
								<option value="http://www.shanghai.gov.cn">上海</option>
								<option value="http://www.cq.gov.cn">重庆</option>
								<option value="http://www.hebei.gov.cn">河北</option>
								<option value="http://www.henan.gov.cn">河南</option>
								<option value="http://www.shanxigov.cn">山西</option>
								<option value="http://www.ln.gov.cn">辽宁</option>
								<option value="http://www.jl.gov.cn">吉林</option>
								<option value="http://www.hlj.gov.cn">黑龙江</option>
								<option value="http://www.sd.cei.gov.cn">山东</option>
								<option value="http://www.jiangsu.gov.cn">江苏</option>
								<option value="http://www.zhejiang.gov.cn">浙江</option>
								<option value="http://www.ah.gov.cn">安徽</option>
								<option value="http://www.fujian.gov.cn">福建</option>
								<option value="http://www.jiangxi.gov.cn">江西</option>
								<option value="http://www.cnhubei.gov.cn">湖北</option>
								<option value="http://www.hunan.gov.cn">湖南</option>
								<option value="http://www.gd.gov.cn">广东</option>
								<option value="http://www.hainan.gov.cn">海南</option>
								<option value="http://www.sc.gov.cn">四川</option>
								<option value="http://www.gzgov.gov.cn">贵州</option>
								<option value="http://www.yn.gov.cn">云南</option>
								<option value="http://www.shaanxi.gov.cn">陕西</option>
								<option value="http://www.gansu.gov.cn">甘肃</option>
								<option value="http://www.qhinfo.com">青海</option>
								<option value="http://www.chinataiwan.org">台湾</option>
								<option value="http://www.nmg.gov.cn">内蒙古</option>
								<option value="http://www.nx.cei.gov.cn">宁夏</option>
								<option value="http://www.gxi.gov.cn">广西</option>
								<option value="http://www.chinatibetnews.com">西藏</option>
								<option value="http://www.xinjiang.gov.cn">新疆</option>
								<option value="http://www.bingtuan.gov.cn">新疆生产建设兵团</option>
								<option value="http://www.gov.hk">香港</option>
								<option value="http://www.gov.mo">澳门</option>
						</select> <select class="span2" name="" onchange="gotoUrl(this.options[this.selectedIndex].value)"><option>国内重要城市网站</option>
								<option value="http://www.sjz.gov.cn">石家庄</option>
								<option value="http://www.qhd.gov.cn">秦皇岛</option>
								<option value="http://www.chengde.gov.cn">承德</option>
								<option value="http://www.taiyuan.gov.cn">太原</option>
								<option value="http://www.dt.gov.cn">大同</option>
								<option value="http://www.shenyang.gov.cn">沈阳</option>
								<option value="http://www.dl.gov.cn">大连</option>
								<option value="http://www.changchun.gov.cn">长春</option>
								<option value="http://www.siping.gov.cn">四平</option>
								<option value="http://www.yanbian.gov.cn">延边</option>
								<option value="http://www.ly.jl.gov.cn">辽源</option>
								<option value="http://www.harbin.gov.cn">哈尔滨</option>
								<option value="http://www.qqhr.gov.cn">齐齐哈尔</option>
								<option value="http://www.nanjing.gov.cn">南京</option>
								<option value="http://www.yangzhou.gov.cn">扬州</option>
								<option value="http://www.wuxi.gov.cn">无锡</option>
								<option value="http://www.suzhou.gov.cn">苏州</option>
								<option value="http://www.xz.gov.cn">徐州</option>
								<option value="http://www.lyg.gov.cn">连云港</option>
								<option value="http://www.dafeng.js.cn">大丰</option>
								<option value="http://www.hangzhou.gov.cn">杭州</option>
								<option value="http://www.ningbo.gov.cn">宁波</option>
								<option value="http://www.wenzhou.gov.cn">温州</option>
								<option value="http://www.hefei.gov.cn">合肥</option>
								<option value="http://www.bengbu.gov.cn">蚌埠</option>
								<option value="http://www.fuzhou.gov.cn">福州</option>
								<option value="http://www.xm.gov.cn">厦门</option>
								<option value="http://www.nc.gov.cn">南昌</option>
								<option value="http://www.jiujiang.gov.cn">九江</option>
								<option value="http://www.jinan.gov.cn">济南</option>
								<option value="http://www.qingdao.gov.cn">青岛</option>
								<option value="http://www.yantai.gov.cn/">烟台</option>
								<option value="http://www.weihai.gov.cn">威海</option>
								<option value="http://www.qufu.gov.cn">曲阜</option>
								<option value="http://www.zhengzhou.gov.cn">郑州</option>
								<option value="http://www.kfinfo.ha.cn">开封</option>
								<option value="http://www.nanyang.gov.cn">南阳</option>
								<option value="http://www.wh.gov.cn">武汉</option>
								<option value="http://www.xiangtan.gov.cn">湘潭</option>
								<option value="http://www.zjj.gov.cn">张家界</option>
								<option value="http://www.gz.gov.cn">广州</option>
								<option value="http://www.shenzhen.gov.cn">深圳</option>
								<option value="http://www.zhuhai.gov.cn">珠海</option>
								<option value="http://www.haikou.gov.cn">海口</option>
								<option value="http://www.chengdu.gov.cn">成都</option>
								<option value="http://www.mianyang.gov.cn">绵阳</option>
								<option value="http://www.gygov.gov.cn">贵阳</option>
								<option value="http://www.zunyi.gov.cn">遵义</option>
								<option value="http://www.kmpg.gov.cn">昆明</option>
								<option value="http://www.yuxi.gov.cn">玉溪</option>
								<option value="http://www.xian.gov.cn">西安</option>
								<option value="http://www.yanan.gov.cn">延安</option>
								<option value="http://www.lz.gansu.gov.cn">兰州</option>
								<option value="http://www.xining.gov.cn">西宁</option>
								<option value="http://www.guilin.gov.cn">桂林</option>
								<option value="http://www.shigatse.gov.cn">日喀则</option>
								<option value="http://www.urumqi.gov.cn">乌鲁木齐</option>
								<option value="http://www.yinchuan.gov.cn">银川</option>
								<option value="http://www.cj.gov.cn">昌吉</option>
						</select> <select class="span2" name="" onchange="gotoUrl(this.options[this.selectedIndex].value)"><option>国外政府网站</option>
								<option value="http://www.gov.ru/">俄罗斯政府</option>
						</select> <select class="span2" name="" onchange="gotoUrl(this.options[this.selectedIndex].value)"><option>友情链接</option>
								<option value="http://crj.police.sh.cn/">上海市出入境管理局</option>
								<option value="http://dy.chinasarft.gov.cn/">电影<s:property value="%{@com.egovernment.util.PropertyUtil@get('app.name')}" /></option>
								<option value="http://bangong.zhongxi.cn/">教育<s:property value="%{@com.egovernment.util.PropertyUtil@get('app.name')}" /></option>
						</select> <span class="span1"></span>
				</div>
		</div>
</div>

<jsp:include page="/view/buttom.jsp"></jsp:include>
</body>
</html>