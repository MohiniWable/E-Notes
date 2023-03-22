
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
<title>Edit Note</title>
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

					<h1 class="text-center">Edit Your Notes</h1>
				</div>

			</div>

		</div>




		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<form action="EditNotesServlet" method="post">

						<input type="hidden" value="<%=noteid%>" name="noteid">
						<div class="form-group">

							<label for="title">Enter Title</label> <input type="text"
								class="form-control" id="title" name="title" required="required"
								value="<%=p.getTitle()%>">
						</div>
						<div class="form-group">
							<label for="content">Enter Content</label>
							<textarea rows="8" cols="" class="form-control" name="content"
								required="required"><%=p.getContent()%>
  
  </textarea>
						</div>
						<div class="container text-center py-2 ">
							<button type="submit" class="btn reg-btn text-white">Edit Note</button>

						</div>

					</form>


				</div>
			</div>

		</div>

		<%@include file="all_component/footer.jsp"%>
	</div>


</body>
</html>