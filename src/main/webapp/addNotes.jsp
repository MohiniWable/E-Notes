<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
UserDetails user1 = (UserDetails) session.getAttribute("userD");

if (user1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "Please Login....");
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<div class="container-fluid p-0">
		<%@include file="all_component/navbar.jsp"%>
		<div class="row ">
			<div class="col-md-12">
			<center>
				<div class="mt-3 mb-1" >
					<img src="img/note.png" class="card-img-top mt-2 mx-auto"
						alt="AddNote Img" style="max-width: 100px"></img>
				</div>
				</center>
			</div>

		</div>


		<h1 class="text-center">Add Your Notes</h1>

		<div class="container">
			<div class="row">
			<div class="col-md-1">
			</div>
				<div class="col-md-10">

					<form action="AddNotesServlet" method="post">
						<div class="form-group">

							<%
							UserDetails us = (UserDetails) session.getAttribute("userD");
							if (us != null) {
							%>
							<input type="hidden" value="<%=us.getId()%>" name="uid">
							<%
							}
							%>

							<label for="title"><b>Enter Title</b></label> <input type="text"
								class="form-control" id="title" name="title" required="required">
						</div>
						<div class="form-group">
							<label for="content"><b>Enter Content</b></label>
							<textarea rows="8" cols="" class="form-control" name="content"
								required="required">
  
  </textarea>
						</div>

						<div class="container text-center py-2">
							<button type="submit" class="btn reg-btn text-white">Add Notes</button>

						</div>

					</form>


				</div>
			</div>

		</div>

		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>