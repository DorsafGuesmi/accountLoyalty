package beans;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import DB.DBConnexion;
import DB.DBLien;

public class Compte implements Serializable {

	private int idCompte; 
	private String nom; 
	private String prenom;
	private float points;
	
	private Statement st ; 
	
	public Compte () {
		DBConnexion db = new DBConnexion(); 
		st = new DBLien().getLien(db.getCnx());
	}
	
	public int getIdCompte() {
		return idCompte;
	}
	
	public void setIdCompte(int idCompte) {
		String produits =  "select * from comptes where idCompte = '"+idCompte+"'"; 
		
		try {
			ResultSet rs = st.executeQuery(produits);
			if (rs.next()){
				nom = rs.getString("nom");
				prenom = rs.getString("prenom");
				points = rs.getFloat("points"); 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.idCompte = idCompte;
	}
	
	public String getNom() {
		return nom;
	}
	
	public void setNom(String nom) {
		this.nom = nom;
	}
	
	public String getPrenom() {
		return prenom;
	}
	
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	} 
	
	public float getPoints() {
		return points;
	}

	public void setPoints(float points) {
		this.points = points;
	}

	
	private void incrementerPoints (float montant) {
		points += ((float)montant)/20 ; 
	}
	
	public void incPoints (float montant) {
		incrementerPoints(montant);
		modifierCompte();
	}
	
	public boolean ajoutCompte() {
		
		String compte = "INSERT INTO `Comptes` VALUES ( null ,'"+ nom +"','"+prenom+"',0)";
		
		try {
			st.executeUpdate(compte);
			return true; 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean supprimerCompte ( ) {
		
		String compte =  "delete from comptes where idCompte = '" + idCompte+"'"; 
		
		try {
			st.executeUpdate(compte);
			return true; 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return false; 
	}
	
	
	public ResultSet getComptes ( ) {
		
		String compte =  "select * from comptes "; 
		
		try {
			ResultSet rs = st.executeQuery(compte);
			return rs; 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return null; 
	}
	
	
	public boolean modifierCompte() {
		
		String compte = "update  `Comptes` set nom = '"+ nom +"' , prenom = '"+prenom+"' , points = '"+ points +"' where idCompte = '"+idCompte+"'";
		
		try {
			st.executeUpdate(compte);
			return true; 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	
	
	
	
}
