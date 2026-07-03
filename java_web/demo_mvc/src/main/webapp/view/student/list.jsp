<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 7/3/2026
  Time: 1:55 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
    <c:import url="../layout/library.jsp"/>
</head>
<body>
<c:import url="../layout/navbar.jsp"/>
<h1>Danh sách sinh viên</h1>
<c:if test="${param.mess}">
    <h3>Thêm mới thành công</h3>
</c:if>
<a  class="btn btn-sm btn-success" href="/student?action=add">Thêm mới</a>
<table class="table table-dark table-striped">
    <tr>
        <th>STT</th>
        <th>ID</th>
        <th>Tên</th>
        <th>Giới tính</th>
        <th>Điểm</th>
        <th>Xếp loại</th>
        <th>Xoá</th>
    </tr>
    <c:forEach var="student" items="${studentList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>
                <c:if test="${student.gender}">
                    Nam
                </c:if>
                <c:if test="${!student.gender}">
                    Nữ
                </c:if>
            </td>
            <td>${student.score}</td>
            <td>
                <c:choose>
                    <c:when test="${student.score>=8}">
                        Giỏi
                    </c:when>
                    <c:when test="${student.score>=7}">
                        Khá
                    </c:when>
                    <c:when test="${student.score>=5}">
                        Trung bình
                    </c:when>
                    <c:otherwise>
                        Yếu
                    </c:otherwise>
                </c:choose>
            </td>
            <td>
                <button class="btn btn-sm btn-danger">Xoá</button>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
