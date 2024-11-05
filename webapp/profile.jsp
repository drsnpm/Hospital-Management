<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <%@ include file="component/allcss.jsp" %>
</head>
<body>
    <%@ include file="component/navbar.jsp" %>
    <%@ include file="profile_sidebar.jsp" %>
    
    <!-- Check if userObj is in session; redirect if not -->
    <c:choose>
        <c:when test="${not empty sessionScope.userObj}">
            <!-- Display profile details -->
            <div class="col-lg-8 mx-auto">
                <div class="row mx-auto">
                    <div class="jumbotron container">
                        <h1 class="display-4">My Profile</h1>
                        <hr class="my-4">
                        <p>Name: ${sessionScope.userObj.fullName}</p>
                        <hr class="my-4">
                        <p>Email: ${sessionScope.userObj.email}</p>
                    </div>
                </div> 
            </div>
        </c:when>
        <c:otherwise>
            <!-- Redirect to login page if userObj is not in session -->
            <c:redirect url="user_login.jsp" />
        </c:otherwise>
    </c:choose>
</body>
</html>
