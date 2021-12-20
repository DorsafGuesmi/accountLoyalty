

<jsp:useBean id="admin" class="beans.Admin" />
<jsp:setProperty name="admin" property="login" />
<jsp:setProperty name="admin" property="password" />
 
<!DOCTYPE html>
<html lang="en"> 
  <head> 
    <meta charset="UTF-8" /> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
       <script src="../assets/js/font.js" crossorigin="anonymous" ></script> 
   
    <link rel="stylesheet" href="../assets/css/style.css" /> 
    <title>Espace Admin</title> 
  </head> 
  <body> 
    <div class="container %>"> 
      <div class="forms-container"> 
       <div class="signin-signup"> 
         <form  class="sign-in-form" method="post"> 
                    <h2 class="title">Admin</h2> 
         
                   <%  
          if( request.getParameter("login") != null && request.getParameter("password") != null ) {
			if( request.getParameter("login") != "" && request.getParameter("password") != "" ) 
				if(admin.verifUser()){
					request.getSession().setAttribute("admin", admin);
					response.sendRedirect("Dashboard.jsp");
				}else {
					out.print("<div class='alert alert-error'> Mot de passe ou login inccorect </div>");
				}
			else
				out.print("<div class='alert alert-error'>Voulez vous remplir tout les champs </div>");
				
			
          }
			%>
          
           
          <div class="input-field"> 
             <i class="fas fa-user"></i> 
             <input type="text" placeholder="Login" name="login"/> 
           </div> 
            <div class="input-field"> 
             <i class="fas fa-lock"></i> 
             <input type="password" placeholder="Mot de passe" name="password" /> 
           </div> 
           <div>
           <input type="submit" value="Connexion" class="btn solid" /> 
            </div> 
          </form> 

         
      </div> 
    </div> 
    
    <div class="panels-container"> 
      <div class="panel left-panel"> 
        <div class="content"> 
          <h1>Tout en ligne!</h1> 

         
        </div> 
      </div> 
     
  </div> 
</div> 


</body>
</html>


