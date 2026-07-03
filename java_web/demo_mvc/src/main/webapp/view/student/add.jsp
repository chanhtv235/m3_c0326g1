
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>Title</title>
        <c:import url="../layout/library.jsp"/>
    </head>
<body>
<c:import url="../layout/navbar.jsp"/>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6 col-lg-5">
            <div class="card shadow">
                <div class="card-header bg-primary text-white text-center">
                    <h3 class="mb-0">Thêm mới</h3>
                </div>

                <div class="card-body">
                    <form action="/student?action=add" method="post">

                        <div class="mb-3">
                            <label class="form-label">Id</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    name="id"
                                    placeholder="Nhập id">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Tên</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    name="name"
                                    placeholder="Nhập tên">
                        </div>

                        <div class="mb-3">
                            <label class="form-label d-block">Giới tính</label>

                            <div class="form-check form-check-inline">
                                <input
                                        class="form-check-input"
                                        type="radio"
                                        name="gender"
                                        value="true"
                                        id="male">
                                <label class="form-check-label" for="male">
                                    Nam
                                </label>
                            </div>

                            <div class="form-check form-check-inline">
                                <input
                                        class="form-check-input"
                                        type="radio"
                                        name="gender"
                                        value="false"
                                        id="female">
                                <label class="form-check-label" for="female">
                                    Nữ
                                </label>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Điểm</label>
                            <input
                                    type="number"
                                    class="form-control"
                                    name="score"
                                    placeholder="Nhập điểm">
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">
                                Lưu
                            </button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
