<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty userObj }">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>
	<%@include file="component/navbar.jsp"%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center" style="font-size: 2rem;">Appointment List</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appoint Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>
									<th scope="col">Cancel</th>
								</tr>
							</thead>
							<tbody>
								<%
								User user = (User) session.getAttribute("userObj");
								AppointmentDAO dao = new AppointmentDAO(DBConnect.getConn());
								DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
								List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
								for (Appointment ap : list) {
									Doctor d = dao2.getDoctorById(ap.getDoctorId());
								%>
								<tr>
									<td><%=ap.getFullName()%></td>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=d.getFullName()%></td>
									<td>
							            <%
							            // Display the status in a separate column
							            if ("Pending".equals(ap.getStatus())) {
							            %>
							                <a href="#" class="btn btn-sm btn-warning">Pending</a>
							            <%
							            } else {
							            %>
							                <span class="text-muted"><%= ap.getStatus() %></span>
							            <%
							            }
							            %>
							        </td>
							        <td>
							            <%
							            // Display the Cancel button in the action column only if status is Pending
							            if ("Pending".equals(ap.getStatus())) {
							            %>
							                <a href="cancelAppointment?id=<%= ap.getId() %>" class="btn btn-sm btn-danger" 
							                   onclick="return confirm('Are you sure you want to cancel this appointment?');">Cancel</a>
							            <%
							            } else {
							                // Optionally, you could indicate that cancellation is disabled
							            %>
							                <span class="text-muted">N/A</span>
							            <%
							            }
							            %>
        							</td>
							       </tr>
								<%
								}
								%>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>