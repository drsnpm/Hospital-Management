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
    
    <div class="container p-4">
		<div class="row">

			<div class="col-md-5 offset-md-2">
				<div class="card paint-card">
					<p class="text-center fs-3" style="font-size: 2rem;">Edit Profile</p>
					<c:if test="${not empty succMsgd }">
						<p class="text-center text-success fs-3">${succMsgd}</p>
						<c:remove var="succMsgd" scope="session" />
					</c:if>

					<c:if test="${not empty errorMsgd }">
						<p class="text-center text-danger fs-5">${errorMsgd}</p>
						<c:remove var="errorMsgd" scope="session" />
					</c:if>
					<div class="card-body">
						<form action="userUpdateProfile" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									required name="fullname" class="form-control"
									value="${sessionScope.userObj.fullName}">
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input type="text" 
									required name="email" class="form-control"
									value="${sessionScope.userObj.email}">
							</div>

							<input type="hidden" name="id" value="${sessionScope.userObj.id}">
							<button type="submit" class="btn btn-primary">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>