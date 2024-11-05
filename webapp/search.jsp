<%@page import="com.entity.Doctor"%> 
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Doctor</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fluid p-3" style="background-color: #f0f1f2;">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<form action="search.jsp" method="post">
					<div class="input-group">
						<input placeholder="Enter specialist" type="text" class="form-control" name="ch">
						<button class="btn bg-success ms-2 text-white">Search</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="container p-5">
		<div class="row">

			<%
			String ch = request.getParameter("ch");
			DoctorDao dao = new DoctorDao(DBConnect.getConn());
			List<Doctor> list;

			// Check if 'ch' is null or empty, if so, retrieve all doctors
			if (ch == null || ch.trim().isEmpty()) {
				list = dao.getAllDoctors();
			} else {
				list = dao.searchDoctor(ch);
			}

			if (list != null && list.size() > 0) {
				for (Doctor d : list) {
			%>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-header text-center">
						<i class="fa-solid fa-circle-user fa-2x"></i>
					</div>
					<div class="card-body">
						<p><span class="fw-bold">Name :</span> <%=d.getFullName() %></p>
						<p><span class="fw-bold">Specialist :</span> <%=d.getSpecialist() %></p>
						<p><span class="fw-bold">Qualification :</span> <%=d.getQualification() %></p>
						<p><span class="fw-bold">Email :</span> <%=d.getEmail() %></p>
						<p><span class="fw-bold">Mob No :</span> <%=d.getMobNo() %></p>
					</div>
				</div>
			</div>
			<%
				}
			} else {
			%>
			<p>No doctors found.</p>
			<%
			}
			%>

		</div>
	</div>
</body>
</html>
