<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:useBean id="compte" class="beans.Compte" />

<jsp:useBean id="produit" class="beans.Produit" />


<jsp:useBean id="achat" class="beans.Achat" />


<%
	if(request.getSession().getAttribute("admin") == null)
		response.sendRedirect("/Projet/admin/Login.jsp");

	String error="" , message="" ;
	if( request.getParameter("idCompte") != null && request.getParameter("idProduit") != null ) {
		if( request.getParameter("idCompte") != "" && request.getParameter("idProduit") != "" ) {
			
			compte.setIdCompte(Integer.parseInt(request.getParameter("idCompte")));
			produit.setIdProduit(Integer.parseInt(request.getParameter("idProduit")));
			achat.setCompte(compte);
			achat.setProduit(produit);
			
			if (achat.ajoutAchat()){
				message = "Achat ajoutée avec succée";
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
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    
    <title>Ajout</title> 
    <style type="text/css">
    
    
		.select2-selection , .select2-selection--single {
		    background-color: #f0f0f0 !important;
		    margin: 10px 0;
		    height: 41px;
		    border-radius: 55px;
		    display: grid;
		    grid-template-columns: 15% 85%;
		    position: relative !important;
		    border: none !important;
		} 
		
		.select2-selection__rendered{
		    min-width: 200px;
		}
		   
    </style>
  </head> 
  <body> 
    	<div style="     position: absolute; top: 40px; left: 40px; width: 63px;  z-index: 99; height: 63px; " >
		<a href="/Projet/admin/Dashboard.jsp" style="    font-size: 42px; color: #18abf8;"><i class="fa fa-arrow-left" aria-hidden="true"></i></a> 
	</div>
    <div class="container "> 
      <div class="forms-container"> 
       <div class="signin-signup"> 
         <form action="#" class="sign-in-form" method="post"> 
           <%
           		if(message != "") {
           			out.println("<div class='alert alert-success'>"+message+
           				"</div>");
           		}else if (error != "")
           			out.println("<div class='alert alert-error'>"+error+
               				"</div>");
           %>
           
           <div class="input-field"> 
             <i class="fas fa-user"></i> 
             <select id="compte" name="idCompte">
             	<option value="" selected> Choisie Compte</option>
             	<%
             		ResultSet rs = compte.getComptes();
             		while(rs.next()) {
             			out.println("<option value='"+rs.getString("idCompte")+"'> "+rs.getString("idCompte")+" : "+rs.getString("nom")+"</option>");
             		}
             	%>
             </select>
           </div> 
           <div class="input-field"> 
             <i class="fa fa-usd"></i> 
              <select id="produit" name="idProduit">
             	<option value="" selected> Choisie Produit</option>
             	<%
             		rs = produit.getProduits();
             		while(rs.next()) {
             			out.println("<option value='"+rs.getString("idProduit")+"'> "+rs.getString("nomProduit")+"</option>");
             		}
             	%>
             </select>
           </div> 
           <input type="submit" value="Achat" class="btn solid" /> 
          
          </form> 
      </div> 
    </div> 
    
    <div class="panels-container"> 
      <div class="panel left-panel"> 
        <div class="content"> 
          <h1>Alimenter Compte!</h1> 
        </div> 
      </div>  
  </div> 
</div> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script type="text/javascript">

//In your Javascript (external .js resource or <script> tag)
$(document).ready(function() {
    $('#produit').select2();
    $('#compte').select2();
});

</script>

</body>
</html>

