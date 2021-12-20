package controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Compte;
import beans.Produit;

/**
 * Servlet implementation class ProduitController
 */
@WebServlet("/Compte")
public class CompteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompteController() {
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
		
		int idCompte = Integer.parseInt(request.getParameter("idCompte"));
		Compte c = new Compte();
		c.setIdCompte(idCompte);
		if(c.supprimerCompte()) {
			response.sendRedirect("/Projet/admin/listCompte.jsp?message=Compte supprimee avec succee");
		}else {
			response.sendRedirect("/Projet/admin/listCompte.jsp?error=Compte n'est pas supprime");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int idCompte = Integer.parseInt(request.getParameter("idCompte"));
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");

		Compte p = new Compte();
		p.setIdCompte(idCompte);;
		p.setNom(nom);;
		p.setPrenom(prenom);;
		if(p.modifierCompte()) {
			response.sendRedirect("/Projet/admin/listCompte.jsp?message=Compte modifiee avec succee");
		}else {
			response.sendRedirect("/Projet/admin/listCompte.jsp?error=Compte n'est pas modifie");
		}
		
	}

}
