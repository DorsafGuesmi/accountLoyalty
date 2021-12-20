package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Produit;

/**
 * Servlet implementation class ProduitController
 */
@WebServlet("/Produit")
public class ProduitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProduitController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//if(request.getSession().getAttribute("admin") == null)
		//	response.sendRedirect("/Projet/admin/Login.jsp");
		
		int idProduit = Integer.parseInt(request.getParameter("idProduit"));
		Produit p = new Produit();
		p.setIdProduit(idProduit);
		if(p.supprimerPrduit()) {
			response.sendRedirect("/Projet/admin/listProduit.jsp?message=Produit supprimee avec succée");
		}else {
			response.sendRedirect("/Projet/admin/listProduit.jsp?error=Produit n'est pas supprime");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int idProduit = Integer.parseInt(request.getParameter("idProduit"));
		String nomProduit = request.getParameter("nomProduit");
		float prixProduit = Float.parseFloat(request.getParameter("prixProduit"));

		Produit p = new Produit();
		p.setIdProduit(idProduit);
		p.setNomProduit(nomProduit);
		p.setPrixProduit(prixProduit);
		if(p.modifierProduit()) {
			response.sendRedirect("/Projet/admin/listProduit.jsp?message=Produit modifiee avec succee");
		}else {
			response.sendRedirect("/Projet/admin/listProduit.jsp?error=Produit n'est pas modifie");
		}
		
	}

}
