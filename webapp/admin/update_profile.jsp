<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Profile</title>
    <%@ include file="../component/allcss.jsp" %>
</head>
<body>
    <c:if test="${empty adminObj}">
        <c:redirect url="../admin_login.jsp"/>
    </c:if>
    <%@ include file="navbar.jsp" %>
    <%@ include file="profile_sidebar.jsp" %>

    <div class="container p-3">
        <div class="row">
            <div class="col-md-5 offset-md-2">
                <div class="card paint-card">
                    <p class="text-center fs-3" style="font-size: 2rem;">Edit Profile</p>

                    <!-- Display success message -->
                    <c:if test="${not empty succMsgd}">
                        <p class="text-center text-success fs-3">${succMsgd}</p>
                        <c:remove var="succMsgd" scope="session"/>
                    </c:if>

                    <!-- Display error message -->
                    <c:if test="${not empty errorMsgd}">
                        <p class="text-center text-danger fs-5">${errorMsgd}</p>
                        <c:remove var="errorMsgd" scope="session"/>
                    </c:if>

                    <div class="card-body">
                        <form action="../AdminUpdateProfile" method="post">
                            <div class="mb-2">
                                <label class="form-label">Full Name</label>
                                <input type="text" required name="fullname" class="form-control" value="${adminObj.fullName}">
                            </div>
                            <div class="mb-2">
                                <label class="form-label">Email</label>
                                <input type="text" required name="email" class="form-control" value="${adminObj.email}">
                            </div>
                            <div class="mb-2">
                                <label class="form-label">Mobile Number</label>
                                <input type="text" required name="mobno" class="form-control" value="${adminObj.mobNo}">
                            </div>
                            <div class="mb-2">
                                <label class="form-label">Username</label>
                                <input type="text" required name="username" class="form-control" value="${adminObj.userName}">
                            </div>
                            <div class="mb-2">
                                <label class="form-label">Date of Birth</label>
                                <input type="date" required name="dob" class="form-control" value="${adminObj.dob}">
                            </div>
                            <div class="mb-2">
                                <label class="form-label">Gender</label>
                                <input type="text" required name="gender" class="form-control" value="${adminObj.gender}">
                            </div>
                            <input type="hidden" name="id" value="${adminObj.id}">
                            <button type="submit" class="btn btn-primary">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
