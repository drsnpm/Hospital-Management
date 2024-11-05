<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp">Care Plus</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto mr-4 pr-4">
				<li class="nav-item active"><a class="nav-link" href="index.jsp">HOME</a></li>
				<li class="nav-item active"><a class="nav-link" href="patient.jsp">PATIENT</a></li>
				<li style="padding-right: 50px;" class="nav-item dropdown">
                	<a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Profile</a>
                	<div class="dropdown-menu" aria-labelledby="navbarDropdown">
                		<a class="dropdown-item" href="profile.jsp">Profile</a>
                  		<a class="dropdown-item" href="../doctorLogout">Logout</a>
                	</div>
            		</li>
				<%-- <li class="nav-item dropdown">
                	<a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Profile</a>
                	<div class="dropdown-menu" aria-labelledby="navbarDropdown">
                		<a class="dropdown-item" href="edit_profile.jsp">Edit Profile</a>
                  		<a class="dropdown-item" href="../doctorLogout">Logout</a>
                	</div>
            	</li>--%>
			</ul>

			<%-- <form class="d-flex">
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button"
						id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">
						<i class="fas fa-user-circle"></i> ${doctObj.fullName }
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="edit_profile.jsp">Edit Profile</a></li>
						<li><a class="dropdown-item" href="../doctorLogout">Logout</a></li>
					</ul>
				</div>
			</form>--%>
		</div>
	</div>
</nav>