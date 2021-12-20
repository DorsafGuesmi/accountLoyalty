<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:useBean id="compte" class="beans.Compte" />
<jsp:setProperty name="compte" property="nom" />
<jsp:setProperty name="compte" property="prenom" />

<jsp:useBean id="produit" class="beans.Produit" />
<jsp:setProperty name="produit" property="nomProduit" />
<jsp:setProperty name="produit" property="prixProduit" />


<%

	if(request.getSession().getAttribute("admin") == null)
		response.sendRedirect("/Projet/admin/Login.jsp");

	boolean verifCompte = false; 
	boolean verifProduit = false; 
	String error="" , message="" ;
	if( request.getParameter("nom") != null && request.getParameter("prenom") != null ) {
		verifCompte = true ; 
		if( request.getParameter("nom") != "" && request.getParameter("prenom") != "" ) {
			if (compte.ajoutCompte()){
				message = "Compte ajoutée avec succée";
			}
		}else {
			error = "voulez vous verifier tous les champs"; 
		}
	}


	if( request.getParameter("nomProduit") != null && request.getParameter("prixProduit") != null ) {
		verifProduit = true ; 
		if( request.getParameter("nomProduit") != "" && request.getParameter("prixProduit") != "" ) {
			if (produit.ajoutProduit()) {
				message = "Produit ajoutée avec succée";
			}
		
		}else {
			error = "voulez vous verifier tous les champs"; 
		}
	}

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
		<a href="/Projet/admin/Dashboard.jsp" style="    font-size: 42px; color: black;"><i class="fa fa-arrow-left" aria-hidden="true"></i></a> 
	</div>
    <div class="container <%  if (verifProduit)  out.print("sign-up-mode"); %>"> 
      <div class="forms-container"> 
       <div class="signin-signup"> 
         <form action="#" class="sign-in-form" method="post"> 
           <h2 class="title">Client</h2> 
           <%
           		if(verifCompte && message != "") {
           			out.println("<div class='alert alert-success'>"+message+
           				"</div>");
           		}else if (verifCompte && error != "")
           			out.println("<div class='alert alert-error'>"+error+
               				"</div>");
           %>
           
           <div class="input-field"> 
             <i class="fas fa-user"></i> 
             <input type="text" placeholder="Nom" name="nom"/> 
           </div> 
           <div class="input-field"> 
             <i class="fas fa-user"></i> 
             <input type="text" placeholder="prenom" name="prenom" /> 
           </div> 
           <input type="submit" value="Ajouter" class="btn solid" /> 
          
          </form> 
          <form action="" class="sign-up-form" method="post"> 
            <h2 class="title">Produit</h2> 
                      <%
           		if(verifProduit && message != "") {
           			out.println("<div class='alert alert-success'>"+message+
           				"</div>");
           		}else if (verifProduit && error != "")
           			out.println("<div class='alert alert-error'>"+error+
               				"</div>");
           %>
            <div class="input-field"> 
              <i class="fa fa-shopping-cart"></i> 
              <input type="text" placeholder="Nom produit"  name="nomProduit"/> 
            </div> 
            <div class="input-field"> 
              <i class="fa fa-usd"></i> 
              <input type="text"  placeholder="Prix produit" name="prixProduit" /> 
            </div> 
            <input type="submit" class="btn" value="Ajouter" /> 
           
        </form> 
      </div> 
    </div> 
    
    <div class="panels-container"> 
      <div class="panel left-panel"> 
        <div class="content"> 
          <h1>Ajout produit!</h1> 

          <button class="btn transparent" id="sign-up-btn"> Ajouter 
          </button> 
        </div> 
      </div> 
      <div class="panel right-panel"> 
      <div class="content"> 
        <h1>Ajout compte !</h1> 

        <button class="btn transparent" id="sign-in-btn"> Ajouter
        </button> 
      </div> 
    </div> 
  </div> 
</div> 

<script src="../assets/js/app.js"></script> 

</body>
</html>


</body>
</html>