package beans;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import DB.DBConnexion;
import DB.DBLien;

public class Achat {
	
	private int idAchat; 
	private Produit produit ; 
	private Compte compte ;
	
	
	private Statement st ; 
	
	public Achat () {
		DBConnexion db = new DBConnexion(); 
		st = new DBLien().getLien(db.getCnx());
	}
	
	
	public int getIdAchat() {
		return idAchat;
	}
	public void setIdAchat(int idAchat) {
		this.idAchat = idAchat;
	}

	
	public Produit getProduit() {
		return produit;
	}


	public void setProduit(Produit produit) {
		this.produit = produit;
	}


	public Compte getCompte() {
		return compte;
	}


	public void setCompte(Compte compte) {
		this.compte = compte;
	}


	public boolean ajoutAchat() {
	
		
		
		String achat = "INSERT INTO `Achats` VALUES ( null ,'"+ produit.getIdProduit() +"','"+ compte.getIdCompte()+"')";
		compte.incPoints(produit.getPrixProduit()); 
		try {
			st.executeUpdate(achat);
			return true; 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	public boolean supprimerAchat ( ) {
		
		String achat =  "delete from comptes where id = '" + idAchat+"'"; 
		
		try {
			st.executeUpdate(achat);
			return true; 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return false; 
	}
	
	
	public ResultSet getAchats ( ) {
		
		String achats =  "select * from achats "; 
		
		try {
			ResultSet rs = st.executeQuery(achats);
			return rs; 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return null; 
	}
	
	
	public boolean modifierAchat() {
		
		String achat = "update  `Achats` set idProduit = '"+ produit.getIdProduit() +"' , idCompte = '"+compte.getIdCompte()+"'  where idAchat = '"+idAchat+"'";
		
		try {
			st.executeUpdate(achat);
			return true; 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	
	
	
}
