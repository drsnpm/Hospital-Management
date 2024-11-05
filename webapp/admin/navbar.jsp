
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

				<li class="nav-item"><a class="nav-link active" href="index.jsp">Dashboard</a></li>
				<li class="nav-item"><a class="nav-link active" href="patient.jsp">Patient</a></li>
				<li  class="nav-item dropdown">
                	<a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Specialist</a>
                	<div class="dropdown-menu" aria-labelledby="navbarDropdown">
                		<a class="dropdown-item" data-toggle="modal" data-target="#exampleModal">Add Specialist</a>
                  		<a class="dropdown-item" href="view_specialist.jsp">View Specialist</a>
                	</div>
            	</li>
				<li  class="nav-item dropdown">
                	<a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Doctor</a>
                	<div class="dropdown-menu" aria-labelledby="navbarDropdown">
                		<a class="dropdown-item" href="doctor.jsp">Add Doctor</a>
                  		<a class="dropdown-item" href="view_doctor.jsp">View Doctor</a>
                	</div>
            	</li>
            	<li  class="nav-item dropdown">
                	<a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">User</a>
                	<div class="dropdown-menu" aria-labelledby="navbarDropdown">
                		<a class="dropdown-item" href="add_user.jsp">Add User</a>
                  		<a class="dropdown-item" href="view_user.jsp">View User</a>
                	</div>
            	</li>
            	
				
				
				<li class="nav-item dropdown">
                	<a class="nav-link dropdown-toggle active" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Profile</a>
                	<div class="dropdown-menu" aria-labelledby="navbarDropdown">
                		<a class="dropdown-item" href="profile.jsp">Profile</a>
                  		<a class="dropdown-item" href="../adminLogout">Logout</a>
                	</div>
            	</li>

			</ul>
			
			
			<%-- <form class="d-flex">
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">Admin</button>
					<ul class="nav-item dropdown" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="../adminLogout">Logout</a></li>
					</ul>
				</div>
			</form>--%>
		</div>
	</div>
</nav>
			<!-- Modal -->
<div class="modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Specialist</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<form action="../addSpecialist" method="post">

						<div class="form-group">
							<label>Enter Specialist Name</label> <input type="text" name="specName" class="form-control" required>
						</div>
						<div class="text-center mt-3">
							<button type="submit" class="btn btn-primary">Add</button>
						</div>

					</form>
      </div>
    </div>
  </div>
</div>