<%--
  Created by IntelliJ IDEA.
  User: Home
  Date: 7/2/2026
  Time: 2:40 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/sum" method="post">
    <h2>Máy tính</h2>
    <input name="n1" placeholder="Nhập n1">
    <input name="n2" placeholder="Nhập n2">
    <button type="submit">Tình tổng</button>
    <h1>Kết quả là: ${tong} </h1>
</form>
</body>
</html>
