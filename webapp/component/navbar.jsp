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
			<ul class="navbar-nav ml-auto mr-4 pr-4 " style="font-size: 1.2rem;">
				<c:if test="${empty userObj }">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>
					<%-- --<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_appointment.jsp">Appointment</a></li>--%>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="search.jsp">Search</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="admin_login.jsp">Admin</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="doctor_login.jsp">Doctor</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="user_login.jsp">User</a></li>
					
				</c:if>
			</ul>



			<c:if test="${not empty userObj }">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0" style="font-size: 1.2rem;">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link active" aria-current="page" href="search.jsp">Search</a></li>
					<li class="nav-item dropdown">
                	<a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Appointment</a>
                	<div class="dropdown-menu" aria-labelledby="navbarDropdown">
                		<a class="dropdown-item" href="user_appointment.jsp">Appointment</a>
                  		<a class="dropdown-item" href="view_appointment.jsp">View Appointment</a>
                	</div>
            		</li>
					<li style="padding-right: 50px;" class="nav-item dropdown">
                	<a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Profile</a>
                	<div class="dropdown-menu" aria-labelledby="navbarDropdown">
                		<a class="dropdown-item" href="profile.jsp">Profile</a>
                  		<a class="dropdown-item" href="userLogout">Logout</a>
                	</div>
            		</li>
				</ul>
			</c:if>
		</div>
	</div>
</nav>