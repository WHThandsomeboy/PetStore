<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:include page="head.jsp"/>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link rel="stylesheet" href="src/css/layui.css">
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">管理员后台</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">控制台</a></li>
      <li class="layui-nav-item"><a href="">商品管理</a></li>
      <li class="layui-nav-item"><a href="">用户</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">其它系统</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
          WHT
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="">安全退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
    <div class="layui-side-scroll">
      <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
      <ul class="layui-nav layui-nav-tree"  lay-filter="test">
        <li class="layui-nav-item">
          <a class="" href="javascript:;">商品管理</a>
          <dl class="layui-nav-child">
            <dd><a href="petlist">宠物管理</a></dd>
            <dd><a href="addpet.jsp">宠物添加</a></dd>
            <dd><a href="javascript:;">暂定</a></dd>
            <dd><a href="">暂定</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item">
          <a href="javascript:;">用户管理后台</a>
          <dl class="layui-nav-child">
            <dd><a href="javascript:;">新增用户</a></dd>
            <dd><a href="javascript:;">删除用户</a></dd>
            <dd><a href="">查看所有用户</a></dd>
          </dl>
        </li>
        <li class="layui-nav-item"><a href="">暂定</a></li>
        <li class="layui-nav-item"><a href="">暂定</a></li>
      </ul>
    </div>
  </div>
  
  <div class="layui-body">
    <!-- 内容主体区域 -->
		<iframe id="index" src="petlist" style="width: 100%" height="100%"></iframe>
  </div>
  <div class="layui-footer">
    <!-- 底部固定区域 -->
    © <a href="index" target="_blank" title="XzcBlogTemplate">PetStore</a> - Designed by WHT 2020。
</div>
</div>
<script src="src/layui.js"></script>
<script>
//JavaScript代码区域
layui.use('element', function(){
  var element = layui.element;
});
$(document).ready(
        function(){
            $("dd>a").click(function (e) {
                e.preventDefault();
                $("#index").attr("src",$(this).attr("href"));
            });
        }
    );
</script>
</body>
</html>
