<%@page import="Com.User.Post"%>
<%@page import="java.util.List"%>
<%@page import="Com.Db.DBConnect"%>
<%@page import="Com.DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");

if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login....");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>

	<div class="container-fluid p-0">
		<%@include file="all_component/navbar.jsp"%>
	</div>

	<!-- update message code-->
	<%
	String updateMsg = (String) session.getAttribute("updateMsg");
	if (updateMsg != null) {
	%>
	<div class="alert alert-success alert-dismissible fade show m-2"
		role="alert">
		<%=updateMsg%>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>

	<%
	session.removeAttribute("updateMsg");
	}
	%>
	<!-- update message end -->


	<!-- wrong message code -->

	<%
	String wrongMsg = (String) session.getAttribute("wrongMsg");
	if (wrongMsg != null) {
	%>
	<div class="alert alert-danger alert-dismissible fade show m-2"
		role="alert">
		<%=wrongMsg%>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>

	<%
	session.removeAttribute("wrongMsg");
	}
	%>

	<!-- wrong message end -->

	<div class="container">
		<h1 class="text-center mt-5">All Notes:</h1>

		<div class="row">



			<%
			if (user3 != null) {
				PostDAO ob = new PostDAO(DBConnect.getConn());
				List<Post> post = ob.getData(user3.getId());
				if (post != null) {
					for (Post po : post) {
			%>
			<div class="col-4 mx-auto my-2">
				<div class="card mt-3 my-2">
					<img src="img/note.png" alt="show notes"
						class="card-img-top mt-3 mx-auto" style="max-width: 100px;">

					<div class="card-body p-2">

						<h5 class="card-title"><%=po.getTitle()%>
						</h5>
						<p><%=po.getContent()%></p>
						<p>
							<b class="text-success">Published By: <%=user3.getName()%>
							</b> <b class="text-primary"></b>
						</p>

						<div class="container text-center mt-2 my-2">
							<a href="display.jsp?note_id=<%=po.getId()%>"
								class="btn btn-success">View</a> <a
								href="edit.jsp?note_id=<%=po.getId()%>" class="btn btn-primary">Edit</a>
							<a href="DeleteServlete?note_id=<%=po.getId()%>"
								class="btn btn-danger">Delete</a>
						</div>

					</div>
					<!-- End card body -->
				</div>
				<!-- End card -->
			</div>
			<%
			}
			} else {
			%>


			<div class="col-4 mx-auto my-2">
				<div class="card mt-3 my-2">
					<img src="img/note.png" alt="show notes"
						class="card-img-top mt-3 mx-auto" style="max-width: 100px;">

					<div class="card-body p-2">

						<h5 class="card-title">You have No Notes!!!</h5>

					</div>
					<!-- End card body -->
				</div>
				<!-- End card -->
			</div>


			<%
			}
			}
			%>



		</div>

	</div>


	<div class="container-fluid bg-dark p-2 mt-5">
		<p class="text-center text-white">&#169; MW . K 2023 | All Rights
			Reserved...</p>
	</div>

</body>
</html>