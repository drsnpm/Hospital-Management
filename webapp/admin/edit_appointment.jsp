<%@page import="com.entity.Doctor"%>
<%@page import="com.entity.Appointment"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.dao.AppointmentDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Edit Appointment</title>
    <%@include file="../component/allcss.jsp"%>
</head>
<body>
    <%@include file="navbar.jsp"%>

    <div class="container-fluid p-3">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <div class="card-body">
                        <h2 class="text-center">Edit Appointment Details</h2>
                        <c:if test="${not empty errorMsg}">
                            <p class="text-danger">${errorMsg}</p>
                            <c:remove var="errorMsg" scope="session" />
                        </c:if>
                        <c:if test="${not empty succMsg}">
                            <p class="text-success">${succMsg}</p>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        AppointmentDAO dao2 = new AppointmentDAO(DBConnect.getConn());
                        Appointment appointment = dao2.getAppointmentById(id);
                        %>

                        <form action="../updatePatientAppointment" method="post">
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" required name="fullname" class="form-control" value="<%=appointment.getFullName()%>">
                            </div>
                            <div class="mb-3">
                                <label>Gender</label>
                                <select class="form-control" name="gender" required>
                                    <option value="male" <%= "male".equals(appointment.getGender()) ? "selected" : "" %>>Male</option>
                                    <option value="female" <%= "female".equals(appointment.getGender()) ? "selected" : "" %>>Female</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Age</label>
                                <input required value="<%=appointment.getAge()%>" name="age" type="text" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Appointment Date</label>
                                <input type="date" value="<%=appointment.getAppoinDate()%>" required name="appoint_date" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label for="inputPassword4" class="form-label">Doctor</label>
                                <select required class="form-control" name="doct">
                                    <%
                                    DoctorDao dao3 = new DoctorDao(DBConnect.getConn());
                                    Doctor currentDoctor = dao3.getDoctorById(appointment.getDoctorId());
                                    %>
                                    <option value="<%=currentDoctor.getId()%>">
                                        <%=currentDoctor.getFullName()%>
                                    </option>
                                    <%
                                    List<Doctor> doctors = dao3.getAllDoctor();
                                    for (Doctor doctor : doctors) {
                                        if (doctor.getId() != currentDoctor.getId()) {
                                    %>
                                        <option value="<%=doctor.getId()%>"><%=doctor.getFullName()%> (<%=doctor.getSpecialist()%>)</option>
                                    <%
                                        }
                                    }
                                    %>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="text" value="<%=appointment.getEmail()%>" required name="email" class="form-control">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Mob No</label>
                                <input type="text" value="<%=appointment.getPhNo()%>" required name="mobno" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Diseases</label>
                                <input type="text" value="<%=appointment.getDiseases()%>" required name="diseases" class="form-control">
                            </div>
                            <div class="col-md-12 p-2">
                                <label>Full Address</label>
                                <textarea required name="address" class="form-control" rows="3"><%=appointment.getAddress()%></textarea>
                            </div>
                            <input type="hidden" name="id" value="<%=appointment.getId()%>">

                            <button type="submit" class="btn btn-primary col-md-12">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>  
</body>
</html>
