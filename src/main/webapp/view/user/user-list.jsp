<%@ page contentType="text/html; charset=euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>회원 목록조회</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css" type="text/css">

</head>

<body>

    <c:import url="${pageContext.request.contextPath}/view/layout/header.jsp"/>
    <c:import url="${pageContext.request.contextPath}/view/layout/nav.jsp"/>
    <main>
        <div class="inner-header">
            <h2 class="page-title">회원 목록 조회</h2>
            <form class="search">
                <select name="searchCondition" class="search-condition">
                    <option value="0" ${!empty searchVO.searchCondition && searchVO.searchCondition == "0" ? "selected" : ""}>회원 ID</option>
                    <option value="1" ${!empty searchVO.searchCondition && searchVO.searchCondition == "1" ? "selected" : ""}>회원명</option>
                </select>
                <button type="submit">검색</button>
            </form>
            <p>전체 ${total}건수, 현재 ${currentPage} 페이지</p>
        </div>
        <table class="list">
            <thead>
                <tr>
                    <td>No</td>
                    <td>회원 ID</td>
                    <td>회원명</td>
                    <td>이메일</td>
                </tr>
            </thead>
            <tbody>
                <c:set var="no" value="${list.size()}" scope="page"/>
                <c:forEach var="data" items="${list}">
                    <tr>
                        <td>${no}</td>
                        <c:set var="no" value="${no - 1}" scope="page"/>
                        <td><a href="${pageContext.request.contextPath}/users/${data.userId}">${data.userId}</a></td>
                        <td>${data.userName}</td>
                        <td>${data.email}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="page-nav">
            <c:forEach var="i" begin="1" end="${totalPage}" step="1">
                <a href="${pageContext.request.contextPath}/users?page=${i}">${i}</a>
            </c:forEach>
        </div>
    </main>
</body>
</html>