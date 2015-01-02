<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script src="js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.js"></script>
<script src="js/application.js"></script>

<div class="container">
		<div class="row">
				<div class="span3 bs-docs-sidebar">
						<ul class="nav nav-list bs-docs-sidenav affix-top">
								<li class="active"><a href="#download-bootstrap"><i
												class="icon-chevron-right"></i> Download</a>
								</li>
								<li class=""><a href="#file-structure"><i class="icon-chevron-right"></i>
												File structure</a>
								</li>
								<li class=""><a href="#contents"><i class="icon-chevron-right"></i>
												What's included</a>
								</li>
								<li class=""><a href="#html-template"><i class="icon-chevron-right"></i>
												HTML template</a>
								</li>
								<li class=""><a href="#examples"><i class="icon-chevron-right"></i>
												Examples</a>
								</li>
								<li class=""><a href="#what-next"><i class="icon-chevron-right"></i>
												What next?</a>
								</li>
						</ul>
				</div>

				<div class="span9">
						<!-- Download
        ================================================== -->
						<section id="download-bootstrap">
								<div class="page-header">
										<h1>1. Download</h1>
								</div>
								<p class="lead">
										Before downloading, be sure to have a code editor (we recommend <a
												href="http://sublimetext.com/2">Sublime Text 2</a>) and some working
										knowledge of HTML and CSS. We won't walk through the source files here, but
										they are available for download. We'll focus on getting started with the
										compiled Bootstrap files.
								</p>

								<div class="row-fluid">
										<div class="span6">
												<h2>Download compiled</h2>
												<p>
														<strong>Fastest way to get started:</strong> get the compiled and minified
														versions of our CSS, JS, and images. No docs or original source files.
												</p>
												<p>
														<a class="btn btn-large btn-primary" href="assets/bootstrap.zip"
																onclick="_gaq.push(['_trackEvent', 'Getting started', 'Download', 'Download compiled']);">Download
																Bootstrap</a>
												</p>
										</div>
										<div class="span6">
												<h2>Download source</h2>
												<p>Get the original files for all CSS and JavaScript, along with a local
														copy of the docs by downloading the latest version directly from GitHub.</p>
												<p>
														<a class="btn btn-large"
																href="https://github.com/twitter/bootstrap/zipball/master"
																onclick="_gaq.push(['_trackEvent', 'Getting started', 'Download', 'Download source']);">Download
																Bootstrap source</a>
												</p>
										</div>
								</div>
						</section>

						<!-- Next
        ================================================== -->
						<section id="what-next">
								<div class="page-header">
										<h1>What next?</h1>
								</div>
								<p class="lead">Head to the docs for information, examples, and code
										snippets, or take the next leap and customize Bootstrap for any upcoming
										project.</p>
								<a class="btn btn-large btn-primary" href="./scaffolding.html"
										onclick="_gaq.push(['_trackEvent', 'Getting started', 'Next steps', 'Visit docs']);">Visit
										the Bootstrap docs</a> <a class="btn btn-large" href="./customize.html"
										style="margin-left: 5px;"
										onclick="_gaq.push(['_trackEvent', 'Getting started', 'Next steps', 'Customize']);">Customize
										Bootstrap</a>
						</section>
				</div>
		</div>
</div>