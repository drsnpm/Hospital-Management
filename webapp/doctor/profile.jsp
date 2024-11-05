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
    <c:if test="${empty doctObj}">
        <c:redirect url="../doctor_login.jsp"/>
    </c:if>
    <%@ include file="navbar.jsp" %>
    <%@ include file="profile_sidebar.jsp" %>

    <div class="col-lg-8 mx-auto">
        <div class="row mx-auto">
            <div class="jumbotron container">
                <h1 class="display-4">My Profile</h1>
                <hr class="my-4">
                <p>Name: ${doctObj.fullName}</p>
                <hr class="my-4">
                <p>Email: ${doctObj.email}</p>
                <hr class="my-4">
                <p>Mobile No: ${doctObj.mobNo}</p>
                <hr class="my-4">
                <p>Qualification: ${doctObj.qualification}</p>
                <hr class="my-4">
                <p>DOB: ${doctObj.dob}</p>
            </div>
        </div> 
    </div>
</body>
</html>
