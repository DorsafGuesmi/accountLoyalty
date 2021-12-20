
	package beans;

	import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import DB.DBConnexion;
import DB.DBLien;

	public class Produit implements Serializable {

		private int idProduit; 
		private String nomProduit; 
		private float prixProduit;
	
		private Statement st ; 
		
		public Produit () {
			DBConnexion db = new DBConnexion(); 
			st = new DBLien().getLien(db.getCnx());
		}
		
		
		public int getIdProduit() {
			return idProduit;
		}
		public void setIdProduit(int idProduit) {
			
			String produits =  "select * from produits where idProduit = '"+idProduit+"'"; 
			
			try {
				ResultSet rs = st.executeQuery(produits);
				if (rs.next()){
					nomProduit = rs.getString("nomProduit");
					prixProduit = rs.getInt("prixProduit"); 
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			this.idProduit = idProduit;
		} 
		
		
		public String getNomProduit() {
			return nomProduit;
		}
		
		public void setNomProduit(String nomProduit) {
			this.nomProduit = nomProduit;
		}
		
		public float getPrixProduit() {
			return prixProduit;
		}
		
		public void setPrixProduit(float prixProduit) {
			this.prixProduit = prixProduit;
		}
		
		
		public boolean ajoutProduit() {
			
			String produit = "INSERT INTO `Produits` VALUES ( null ,'"+ nomProduit +"','"+prixProduit+"')";
			
			try {
				st.executeUpdate(produit);
				return true; 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return false;
		}
		
		public boolean supprimerPrduit ( ) {
			
			String produit =  "delete from produits where idProduit = '" + idProduit +"'"; 
			
			try {
				st.executeUpdate(produit);
				return true; 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			return false; 
		}
		
		
		public ResultSet getProduits ( ) {
			
			String produits =  "select * from produits "; 
			
			try {
				ResultSet rs = st.executeQuery(produits);
				return rs; 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			return null; 
		}
		
		
		public boolean modifierProduit() {
			
			String produit = "update  `produits` set nomProduit = '"+ nomProduit +"' , prixProduit = '"+prixProduit+"' where idProduit = '"+idProduit+"'";
			
			try {
				st.executeUpdate(produit);
				return true; 
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return false;
		}
		
		
		

}
