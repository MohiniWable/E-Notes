<%@page import="Com.User.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.jsp"><i
			class="fa-solid fa-book"></i>E-Notes</a>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="home.jsp"><i
						class="fa-solid fa-house-user"></i> Home</a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="addNotes.jsp"><i
						class="fa-solid fa-circle-plus"></i> Add Notes</a></li>

				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="showNotes.jsp"><i
						class="fa-solid fa-address-book"></i> Show Notes</a></li>


			</ul>
			<%
			UserDetails user = (UserDetails) session.getAttribute("userD");

			if (user != null) {
			%>
			<a class="btn btn-light m-2 my-sm-0" href="" data-toggle="modal"
				data-target="#exampleModal" type="submit"> <i
				class="fa-solid fa-right-to-bracket"></i> <%=user.getName()%>
			</a> <a class="btn btn-light m-2 my-sm-0" href="LogoutServlet"
				type="submit"><i class="fa-solid fa-user-plus"></i> Logout</a>

			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">
								<%=user.getName()%></h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>

						<div class="modal-body">
							<div class="container">
								<div class="row">
									<div class=" col-md-8 ml-auto">
										<i class="fa fa-user fa-3x"></i>
										<h4></h4>

										<div class=" col-md-12">
											<table>
												<tbody>
													<tr>
														<th>User ID:</th>
														<td><%=user.getId()%></td>
													</tr>
													<tr>
														<th>Name:</th>
														<td><%=user.getName()%></td>
													</tr>
													<tr>
														<th>Email:</th>
														<td><%=user.getEmail()%></td>
													</tr>
												</tbody>
											</table>
										</div>

										<div>
											<button type="button" class="btn btn-primary"
												data-dismiss="modal">Close</button>
										</div>
									</div>



								</div>


							</div>

						</div>

					</div>
				</div>
			</div>

		</div>
		<%
		} else {
		%>

		<a class="btn btn-light my-2 mr-1 my-sm-0" href="login.jsp"
			type="submit"><i class="fa-solid fa-right-to-bracket"></i> Login</a><a
			class="btn btn-light my-2 my-sm-0" href="register.jsp" type="submit"><i
			class="fa-solid fa-user-plus"></i> Register</a>
		<%
		}
		%>


	</div>

	<!-- Button trigger modal -->



</nav>