<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
UserDetails user2 = (UserDetails) session.getAttribute("userD");

if (user2 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login....");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>



<%@include file="all_component/allcss.jsp"%>
</head>
<body>


	<div class="container-fluid p-0">
		<%@include file="all_component/navbar.jsp"%>

		<div class="card p-5 m-4">
			<div class="card-body text-center">

				<img src="img/take_notes.jpeg" class="takeNotes"
					style="max-width: 400px">

				<h1>Start Taking Your Notes</h1>
				<a href="addNotes.jsp" class="btn reg-btn text-white"> Start
					Here</a>
			</div>
		</div>
	</div>



	<div class="container-fluid bg-dark mt-2 p-2">
		<p class="text-center text-white">&#169; MW.K 2023 | All Rights
			Reserved...</p>
	</div>
</body>
</html>