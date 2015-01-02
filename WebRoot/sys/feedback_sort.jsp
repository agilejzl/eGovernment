<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/zTree/css/demo.css" type="text/css"> -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/zTree/css/zTreeStyle/zTreeStyle.css"
		type="text/css">
<script type="text/javascript" src="<%=request.getContextPath()%>/zTree/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/zTree/js/jquery.ztree.all-3.5.js"></script>
<script type="text/javascript" charset="utf-8">
	var setting = {
		async : {
			enable : true,
			url : "feedback_sort_list",
			autoParam : [ "id", "parentId=pId", "name=n", "level=lv" ],
			otherParam : {
				"otherParam" : "zTreeAsyncTest"
			},
			dataFilter : filter
		},
		view : {
			dblClickExpand : dblClickExpand
		},
		data : {
			simpleData : {
				enable : true
			}
		},
		check : {
			enable : false
		},
		callback : {
			beforeClick : BeforeClick,
			onRightClick : OnRightClick
		}
	};

	function dblClickExpand(treeId, treeNode) {
		return treeNode.level > 0;
	}

	function filter(treeId, parentNode, childNodes) {
		if (!childNodes)
			return null;
		for ( var i = 0, l = childNodes.length; i < l; i++) {
			childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
			childNodes[i].open = true;
			childNodes[i].isParent = true;
		}
		return childNodes;
	};

	function BeforeClick(event, treeId, treeNode) {
		if (treeId.parentTId) {
			$(".feedback-list").load("feedback_list?catalogId=" + treeId.id);
		}
	}

	function OnRightClick(event, treeId, treeNode) {
		/* if (!treeNode && event.target.tagName.toLowerCase() != "button"
				&& $(event.target).parents("a").length == 0) {
			zTree.cancelSelectedNode();
			showRMenu("root", event.clientX, event.clientY);
		} else if (treeNode && !treeNode.noR) {
			zTree.selectNode(treeNode);
			showRMenu("node", event.clientX, event.clientY);
		} */
	}

	function showRMenu(type, x, y) {
		$("#rMenu ul").show();
		if (type == "root") {
			$("#m_del").hide();
			$("#m_check").hide();
			$("#m_unCheck").hide();
		} else {
			$("#m_del").show();
			$("#m_check").show();
			$("#m_unCheck").show();
		}
		rMenu.css({
			"top" : y + "px",
			"left" : x + "px",
			"visibility" : "visible"
		});

		$("body").bind("mousedown", onBodyMouseDown);
	}
	function hideRMenu() {
		if (rMenu)
			rMenu.css({
				"visibility" : "hidden"
			});
		$("body").unbind("mousedown", onBodyMouseDown);
	}
	function onBodyMouseDown(event) {
		if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length > 0)) {
			rMenu.css({
				"visibility" : "hidden"
			});
		}
	}
	var addCount = 1;
	function addTreeNode() {
		hideRMenu();
		var newNode = {
			name : "增加" + (addCount++)
		};
		if (zTree.getSelectedNodes()[0]) {
			newNode.checked = zTree.getSelectedNodes()[0].checked;
			zTree.addNodes(zTree.getSelectedNodes()[0], newNode);
		} else {
			zTree.addNodes(null, newNode);
		}
	}
	function removeTreeNode() {
		hideRMenu();
		var nodes = zTree.getSelectedNodes();
		if (nodes && nodes.length > 0) {
			if (nodes[0].children && nodes[0].children.length > 0) {
				var msg = "要删除的节点是父节点，如果删除将连同子节点一起删掉。\n\n请确认！";
				if (confirm(msg) == true) {
					zTree.removeNode(nodes[0]);
				}
			} else {
				zTree.removeNode(nodes[0]);
			}
		}
	}
	function checkTreeNode(checked) {
		var nodes = zTree.getSelectedNodes();
		if (nodes && nodes.length > 0) {
			zTree.checkNode(nodes[0], checked, true);
		}
		hideRMenu();
	}
	function resetTree() {
		hideRMenu();
		$.fn.zTree.init($("#treeDemo"), setting);
	}

	var zTree, rMenu;
	$(document).ready(function() {
		$.fn.zTree.init($("#treeDemo"), setting);
		zTree = $.fn.zTree.getZTreeObj("treeDemo");
		rMenu = $("#rMenu");
	});
</script>
<style type="text/css">
div#rMenu {
		position: absolute;
		visibility: hidden;
		top: 0;
		background-color: #555;
		text-align: left;
		padding: 2px;
}

div#rMenu ul li {
		margin: 1px 0;
		padding: 0 5px;
		cursor: pointer;
		list-style: none outside none;
		background-color: #DFDFDF;
}

.ztree li span.button.switch.level0 {
		visibility: hidden;
		width: 1px;
}

.ztree li ul.level0 {
		padding: 0;
		background: none;
}
</style>

<div class="content_wrap">
		<div class="zTreeDemoBackground left">
				<ul id="treeDemo" class="ztree"></ul>
		</div>
</div>
<div id="rMenu">
		<ul>
				<li id="m_add" onclick="addTreeNode();">增加节点</li>
				<li id="m_del" onclick="removeTreeNode();">删除节点</li>
				<li id="m_check" onclick="checkTreeNode(true);">Check节点</li>
				<li id="m_unCheck" onclick="checkTreeNode(false);">unCheck节点</li>
				<li id="m_reset" onclick="resetTree();">恢复zTree</li>
		</ul>
</div>
