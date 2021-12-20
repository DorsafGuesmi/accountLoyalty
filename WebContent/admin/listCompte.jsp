<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

	<jsp:useBean id="compte" class="beans.Compte" />


	<% if(request.getSession().getAttribute("admin")==null) 
		response.sendRedirect("/Projet/admin/Login.jsp");
	
		ResultSet rs = compte.getComptes();
	%>

		<!DOCTYPE html>
		<html lang="en">

		<head>
			<meta charset="UTF-8" />
			<meta name="viewport" content="width=device-width, initial-scale=1.0" />
			<script src="../assets/js/font.js" crossorigin="anonymous"></script>
			<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="../assets/bootstrap/css/bootstrap.min.css">
			<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="../assets/animate/animate.css">
			<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="../assets/select2/select2.min.css">
			<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="../assets/perfect-scrollbar/perfect-scrollbar.css">
			<!--===============================================================================================-->
			<link rel="stylesheet" type="text/css" href="../assets/css/util.css">
			<link rel="stylesheet" type="text/css" href="../assets/css/main.css">
			<!--===============================================================================================-->
			<title>Liste compte</title>
			<style type="text/css">
				.content1 {

					position: absolute;
					top: 74%;
					width: 300px;
					text-align: center;
					left: 50%;
					transform: translateX(-50%);
					color: white;

				}

				.pnn {
					content: "";
					position: absolute;
					height: 450px;
					width: 500px;
					top: -10%;
					left: 50%;
					transform: translate(-50%, -50%);
					background-image: linear-gradient(-45deg, #4481eb 0%, #04befe 100%);
					transition: 1.8s ease-in-out;
					border-radius: 50%;
					z-index: 6;

				}


			</style>
		</head>

		<body>
		  	<div style="     position: absolute; top: 40px; left: 40px; width: 63px;  z-index: 99; height: 63px; " >
		<a href="/Projet/admin/Dashboard.jsp" style="    font-size: 42px; color: #18abf8;"><i class="fa fa-arrow-left" aria-hidden="true"></i></a> 
	</div>
			<div class="container1 ">
				<div class="forms-container">
				<div style="min-height:150px; width:100%">
				</div>
					<div class="signin-signup1">

						<div class="limiter">
							<div class="container-table100">
								<div class="wrap-table100">
									<%
									if ( request.getParameter("error") != null)
									{
									%>
									<div class="alert alert-danger">
										<%= request.getParameter("error") %>
									</div>
									<%} %>
										<%
									if ( request.getParameter("message") != null)
									{
									%>
									<div class="alert alert-success">
										<%= request.getParameter("message") %>
									</div>
									<%} %>
									<div class="table100 ver1 m-b-110">
										<div class="table100-head">
											<table>
												<thead>
													<tr class="row100 head">
														<th class="cell100 column1">#</th>
								  						<th class="cell100 column2">Nom</th>
														<th class="cell100 column3">Prenom</th>
														<th class="cell100 column4">Points</th>
														<th class="cell100 column5">Modifier</th>
														<th class="cell100 column6">Supprimer</th>
													</tr>
												</thead>
											</table>
										</div>

										<div class="table100-body js-pscroll">
											<table>
												<tbody>
												<% while(rs.next()) { %>
													<tr class="row100 body">
														<td class="cell100 column1"><%= rs.getString("idCompte") %></td>
														<td class="cell100 column2"><%= rs.getString("nom") %></td>
														<td class="cell100 column3"><%= rs.getString("prenom") %></td>				
														<td class="cell100 column3"><%= rs.getString("points") %></td>				
														<td class="cell100 column4"><a href="/Projet/admin/modifierCompte.jsp?idCompte=<%= rs.getString("idCompte") %>"  class="btn btn-info" style="color:white"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>
														<td class="cell100 column5"><a href="/Projet/Compte?idCompte=<%= rs.getString("idCompte") %>" class="btn btn-danger" style="color:white" ><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
													</tr>
												<% } %>
												</tbody>
											</table>
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="panels-container">
					<div class="pnn">
						<div class="content1">
							<h1>Liste Comptes !</h1>
						</div>
					</div>
				</div>
			</div>


			<!--===============================================================================================-->
			<script src="../assets/jquery/jquery-3.2.1.min.js"></script>
			<!--===============================================================================================-->
			<script src="../assets/bootstrap/js/popper.js"></script>
			<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
			<!--===============================================================================================-->
			<script src="../assets/select2/select2.min.js"></script>
			<!--===============================================================================================-->
			<script src="../assets/perfect-scrollbar/perfect-scrollbar.min.js"></script>
			<script>
				$('.js-pscroll').each(function () {
					var ps = new PerfectScrollbar(this);

					$(window).on('resize', function () {
						ps.update();
					})
				});


			</script>
			<!--===============================================================================================-->
			<script src="../assets/js/main1.js"></script>
		</body>

		</html>


		</body>

		</html>