<!doctype html>
<%
if(request.getSession().getAttribute("admin") == null)
	response.sendRedirect("/Projet/admin/Login.jsp");

%>

<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="../assets/fonts/icomoon/style.css">

    <link rel="stylesheet" href="../assets/css/owl.carousel.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="../assets/css/style1.css">

    <title>Website Menu #5</title>
  </head>
  <body>


    <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
          <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
          </div>
        </div>
        <div class="site-mobile-menu-body"></div>
      </div>



      <header class="site-navbar site-navbar-target py-4" role="banner">

        <div class="container">
          <div class="row align-items-center position-relative">

            <div class="col-3">
              <div class="site-logo">
                <a href="" class="font-weight-bold text-white"> Tout en ligne </a>
              </div>
            </div>

            <div class="col-9  text-right">
              

              <span class="d-inline-block d-lg-block"><a href="#" class="text-black site-menu-toggle js-menu-toggle py-5"><span class="icon-menu h3 text-white"></span></a></span>

              

              <nav class="site-navigation text-right ml-auto d-none d-lg-none" role="navigation">
                <ul class="site-menu main-menu js-clone-nav ml-auto ">
                  <li class="active"><a href="/Projet/admin/Dashboard.jsp" class="nav-link">Acceuil</a></li>
                  <li><a href="/Projet/admin/ajout.jsp" class="nav-link">Ajout</a></li>
                  <li><a href="/Projet/admin/alimenterCompte.jsp" class="nav-link">Alimentation du compte</a></li>
                  <li><a href="/Projet/admin/listProduit.jsp" class="nav-link">Gestion Produits</a></li>
                  <li><a href="/Projet/admin/listCompte.jsp" class="nav-link">Gestion Compte</a></li>
                  <li><a href="/Projet/Logout" class="nav-link">Déconnexion</a></li>
                </ul>
              </nav>
            </div>

            
          </div>
        </div>

      </header>

    <div class="hero" style="background-image: url('../assets/image/shopping.jpg');"></div>
  


    <script src="../assets/js/jquery-3.3.1.min.js"></script>
    <script src="../assets/js/popper.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/jquery.sticky.js"></script>
    <script src="../assets/js/main11.js"></script>
  </body>
</html>