<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:useBean id="compte" class="beans.Compte" />


<%

	if(request.getSession().getAttribute("admin") == null)
		response.sendRedirect("/Projet/admin/Login.jsp");
	int idCompte = Integer.parseInt(request.getParameter("idCompte")) ; 
	compte.setIdCompte(idCompte);

%>
 
<!DOCTYPE html>
<html lang="en"> 
  <head> 
    <meta charset="UTF-8" /> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <script src="../assets/js/font.js" crossorigin="anonymous" ></script> 
    <link rel="stylesheet" href="../assets/css/style.css" /> 
    <title>Ajout</title> 
  </head> 
  <body>
    	<div style="     position: absolute; top: 40px; left: 40px; width: 63px;  z-index: 99; height: 63px; " >
		<a href="/Projet/admin/listCompte.jsp" style="    font-size: 42px; color: #18abf8;"><i class="fa fa-arrow-left" aria-hidden="true"></i></a> 
	</div> 
    <div class="container "> 
      <div class="forms-container"> 
       <div class="signin-signup"> 
         <form action="/Projet/Compte?idCompte=<%= idCompte %>" class="sign-in-form" method="post"> 
           <h2 class="title">Modifier Compte</h2>            
           <div class="input-field"> 
             <i class="fas fa-user"></i> 
             <input type="text" placeholder="Nom Compte" value="<%= compte.getNom() %>" name="nom"/> 
           </div> 
           <div class="input-field"> 
             <i class="fa fa-user"></i> 
             <input type="text" placeholder="Nom compte" value="<%= compte.getPrenom() %>" name="prenom" /> 
           </div> 
           <input type="submit" value="Modifier" class="btn solid" /> 
          
          </form> 
      </div> 
    </div> 
    
    <div class="panels-container"> 
      <div class="panel left-panel"> 
        <div class="content"> 
          <h1>Modifier compte !</h1> 
        </div> 
      </div> 
  </div> 
</div> 

<script src="../assets/js/app.js"></script> 

</body>
</html>


</body>
</html>