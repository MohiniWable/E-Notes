<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<style type="text/css">
.back-register-img {
	background-color: #F8F8FF;
	height: 100vh;
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
		
		
		<div class="col-md-3 mt-2 pl-5">
		
		<img src="img/login-img.png" alt="register image" width="550px" height="">
		
		</div>
		
			<div class="col-md-5 offset-md-4 mt-5">
				<div class="card mt-5 mb-3 mr-4">
					<div class="bg-custom">
						<div class="card-header text-center text-white">
							<i class="fa-solid fa-user-plus fa-2x"></i>
							<h4>Login</h4>
						</div>
					</div>

					<%
					String invalidMsg = (String) session.getAttribute("login-failed");

					if (invalidMsg != null) {
					%>

					<div class="alert alert-danger alert-dismissible fade show m-2"
						role="alert">
						<%=invalidMsg%>
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
					<%
					session.removeAttribute("login-failed");
					}
					%>

					<%
					String withoutLogin = (String) session.getAttribute("Login-error");
					if (withoutLogin != null) {
					%>
					<div class="alert alert-danger alert-dismissible fade show m-2"
						role="alert">
						<%=withoutLogin%>
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>


					<%
					session.removeAttribute("Login-error");
					}
					%>
					
					<%
					String lgMsg=(String)session.getAttribute("logoutMsg");
					if(lgMsg!=null){
						%>
						<div class="alert alert-success alert-dismissible fade show m-2"
						role="alert">
						<%=lgMsg%>
						<button type="button" class="btn-close" data-bs-dismiss="alert"
							aria-label="Close"></button>
					</div>
						<%
						session.removeAttribute("logoutMsg");
					}
					%>

					<div class="card-body">
						<form action="LoginServlet" method="post">

							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email
									Address</label> <input type="email" class="form-control" id=""
									aria-describedby="emailHelp" name="uemail" required>
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
	
<div class="container-fluid bg-dark p-2">
<p class="text-center text-white">&#169; MW 2023 | All Rights Reserved...</p>
</div>
</body>
</html>