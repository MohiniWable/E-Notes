<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<style type="text/css">
.back-register-img {
	background-color: #F8F8FF;
	height: 90vh;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	
	
<div class="container-fluid back-register-img">

		<div class="row">
		
		<div class="col-md-3 mx-auto mt-5 pl-5">
		
		<img src="img/login1.png" alt="register image" width="" height="400px">
		
		</div>
			<div class="col-md-4 mx-auto mb-5 offset-md-3">
				<div class="card mt-5 mb-3">
					<div class="bg-custom">
						<div class="card-header text-center text-white">
							<i class="fa-solid fa-user-plus fa-3x"></i>
							<h4>Registration</h4>
						</div>

					</div>


					<%
					String regMsg = (String)session.getAttribute("reg-success");

					if (regMsg != null) {
					%>

					<div class="alert alert-success alert-dismissible fade show m-2"
						role="alert">
						<%=regMsg%>
						Login <a href="login.jsp">click here</a>
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
					<%
					session.removeAttribute("reg-success");
					}
					%>


					<%
					String failedMsg = (String) session.getAttribute("failed-msg");

					if (failedMsg != null) {
					%>

					<div class="alert alert-danger alert-dismissible fade show m-2"
						role="alert">
						<%=failedMsg%>
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
					<%
					session.removeAttribute("failed-msg");
					}
					%>

					<div class="card-body">
						<form action="UserServlet" method="post">
							<div class="mb-3">
								<label for="fullName" class="form-label">Enter Full Name</label>
								<input type="text" class="form-control" id=""
									aria-describedby="" name="uname" required>
							</div>
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									Address</label> <input type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									name="uemail" required>
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control"
									id="exampleInputPassword1" name="upassword" required>
							</div>
							<div class="text-center">
								<button type="submit" class="btn text-white reg-btn w-100">Register</button>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>
		
	</div>
	<div class="mt-5">
	
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>