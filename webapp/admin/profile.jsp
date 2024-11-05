<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <%@ include file="../component/allcss.jsp" %>
</head>
<body>
    <c:if test="${empty adminObj}">
        <c:redirect url="../admin_login.jsp"/>
    </c:if>
    <%@ include file="navbar.jsp" %>
    <%@ include file="profile_sidebar.jsp" %>

    <div class="col-lg-8 mx-auto">
        <div class="row mx-auto">
            <div class="jumbotron container">
                <h1 class="display-4">Admin Profile</h1>
                <hr class="my-4">
                <p>Name: ${adminObj.fullName}</p>
                <hr class="my-4">
                <p>Email: ${adminObj.email}</p>
                <hr class="my-4">
                <p>Mobile No: ${adminObj.mobNo}</p>
                <hr class="my-4">
                <p>User Name: ${adminObj.userName}</p>
                <hr class="my-4">
                <p>DOB: ${adminObj.dob}</p>
                <hr class="my-4">
                <p>Gender: ${adminObj.gender}</p>
            </div>
        </div> 
    </div>
</body>
</html>
