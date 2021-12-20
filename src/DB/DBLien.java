package DB;

import java.io.Serializable ;
import java.sql.*;
public class DBLien implements java.io.Serializable {
	
	//Définition des propriétés
		private Statement lien = null;
	
	// Methodes d'acces en lecture
		public Statement getLien(Connection cnx) {
			if (construireStatement(cnx)) {
				return lien;
			} else {
				return null;
			}
		}
		
	// Methodes invisibles
		private boolean construireStatement (Connection cnx) {
			boolean statusStatement = false;
			try {
				lien=cnx.createStatement();
				statusStatement = true ;
			} catch ( Exception e ) {
				statusStatement = false;
				System.out.println(e);
			}
			return statusStatement;
		}
}
