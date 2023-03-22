
<%@page import="Com.User.UserDetails"%>
<%@page import="Com.User.Post"%>
<%@page import="Com.Db.DBConnect"%>
<%@page import="Com.DAO.PostDAO"%>
<%
UserDetails user3 = (UserDetails) session.getAttribute("userD");

if (user3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login....");
}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Note</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>

	<%
	Integer noteid = Integer.parseInt(request.getParameter("note_id"));

	PostDAO post = new PostDAO(DBConnect.getConn());
	Post p = post.getDataById(noteid);
	%>

	<div class="container-fluid p-0">
		<%@include file="all_component/navbar.jsp"%>
		<div class="row ">
			<div class="col-md-12">
				<div class="card">
					<img src="img/note.png" class="card-img-top mt-4 mx-auto"
						alt="AddNote Img" style="max-width: 100px"></img>

					<h1 class="text-center"><%=p.getTitle()%></h1>
					<span class="m-2 ml-5"><a href="showNotes.jsp?note_id=<%=p.getId()%>"
						class="btn btn-success">Back to all notes</a></span>
				</div>

			</div>

		</div>




		<div class="container">

			<div class="card mt-3 my-2">


				<div class="card-body p-2">

					<h5 class="card-title"><%=p.getTitle()%>
					</h5>
					<p><%=p.getContent()%></p>
					<p>
						<b class="text-success">Published By: <%=user3.getName()%>
						</b> <b class="text-primary"></b>
					</p>

					<div class="container text-center mt-2 my-2">

						<a href="DeleteServlete?note_id=<%=p.getId()%>"
							class="btn btn-danger">Delete</a> <a
							href="edit.jsp?note_id=<%=p.getId()%>" class="btn btn-primary">Edit</a>

					</div>

				</div>
				<!-- End card body -->
			</div>
			<!-- End card -->

		</div>
		<div class="mt-5">
			<%@include file="all_component/footer.jsp"%>
		</div>
	</div>
</body>
</html>