<%@page import="com.dao.SpecialistDao"%>
<%@page import="com.entity.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-12">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center" style="font-size: 2rem;">Specialist</p>
						<c:if test="${not empty errorMsg}">
							<p class="fs-3 text-center text-danger">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Specialist Name</th>
									<th scope="col">Delete</th>
								</tr>
							</thead>
							<tbody>
								<%
								SpecialistDao dao2 = new SpecialistDao(DBConnect.getConn());
								List<Specalist> list2 = dao2.getAllSpecialist();
								for (Specalist s : list2) {
								%>
								<tr>
									<td><%=s.getSpecialistName()%></td>
									<td>
										<form action="../DeleteSpecialist" method="post" style="display:inline;">
						                    <input type="hidden" name="id" value="<%= s.getId() %>">
						                    <button type="submit" class="btn btn-danger">Delete</button>
						                </form>
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