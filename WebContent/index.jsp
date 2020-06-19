<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="head.jsp"/>
<link href="css/page.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="css/page.js"></script>
<jsp:include page="menu.jsp"/>
<c:choose>
<c:when test="${isSuccess!='false'}">
    <div class="container">
        <div class="card-deck mb-3 text-center">
        <c:forEach var="pet" items="${petlist}">
            <div class="card mb-4 shadow-sm">
                <div class="card-header">
                    <img src="petImg/${pet.img }" class="pet-pic">
                </div>
                <div class="card-body">
                    <h1 class="card-title pricing-card-title"><small class="text-muted">${pet.name}</small></h1>
                    <p class="pet-desc">${pet.description }</p>
                    <p><span class="pet-tag">${pet.tag }</span></p>
                    <p class="pet-price">${pet.price }</p>
                    <a href="detail?id=${pet.id }" class="btn btn-lg btn-block btn-outline-primary">查看详情</a>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
	<div id="pagerArea" unselectable="on" onselectstart="return false;"></div>
	</c:when>
	<c:otherwise>
	<p style="text-align: center;color: red;">您输入的宠物名有误或者不存在该分类下</p>
	</c:otherwise>
	</c:choose>
<jsp:include page="footer.jsp"/>
</html>