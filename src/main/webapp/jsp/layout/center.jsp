<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" charset="utf-8">
	var centerTabs;
	var tabsMenu;
	$(function() {
		tabsMenu = $('#tabsMenu').menu({
			onClick : function(item) {
				var curTabTitle = $(this).data("tabTitle");
				var type = $(item.target).attr('type');

				if (type === "close") {
					centerTabs.tabs("close", curTabTitle);
					return;
				}

				var allTabs = centerTabs.tabs("tabs");
				var closeTabsTitle = [];

				$.each(allTabs, function() {
					var opt = $(this).panel("options");
					if (opt.closable && opt.title != curTabTitle && type === "closeOther") {
						closeTabsTitle.push(opt.title);
					} else if (opt.closable && type === "closeAll") {
						closeTabsTitle.push(opt.title);
					}
				});

				for ( var i = 0; i < closeTabsTitle.length; i++) {
					centerTabs.tabs("close", closeTabsTitle[i]);
				}
			}
		});

		centerTabs = $('#centerTabs').tabs({
			fit : true,
			border : false,
			onContextMenu : function(e, title) {
				e.preventDefault();
				tabsMenu.menu('show', {
					left : e.pageX,
					top : e.pageY
				}).data('tabTitle', title);
			}
		});
	});
	function addTab(node) {
		if (centerTabs.tabs('exists', node.text)) {
			centerTabs.tabs('select', node.text);
		} else {
			if (node.attributes.url && node.attributes.url.length > 0) {
				centerTabs.tabs('add', {
					title : node.text,
					closable : true,
					content : '<iframe src="' + node.attributes.url + '" frameborder="0" style="border:0;width:100%;height:99.4%;"></iframe>'
				});
			} else {
				centerTabs.tabs('add', {
					title : node.text,
					closable : true,
					content : '<iframe src="error/err.jsp" frameborder="0" style="border:0;width:100%;height:99.4%;"></iframe>'
				});
			}
		}
	}
	//北部菜单添加tab 作废
	function addNorthTab(text,url) {
		if (centerTabs.tabs('exists', text)) {
			centerTabs.tabs('select', text);
		} else {
			if (url && url.length > 0) {
				centerTabs.tabs('add', {
					title : text,
					closable : true,
					content : '<iframe src="' + url + '" frameborder="0" style="border:0;width:100%;height:99.4%;"></iframe>'
				});
			}
		}
	}
</script>
<div id="centerTabs">
	<!-- <div title="首页" border="false" href="/lims/jsp/firstadmin/portal.jsp"></div> -->
	<div title="首页" border="false" href=""></div>
</div>
<div id="tabsMenu" style="width: 120px;display:none;">
	<div type="close">关闭</div>
	<div type="closeOther">关闭其他</div>
	<div type="closeAll">关闭所有</div>
</div>


