package DB;
import java.io.Serializable ;
import java.sql.*;
public class DBConnexion implements java.io.Serializable {
	//Définition des propriétés
		private String login = "root";
		private String password = "" ;
		private String hostname = "127.0.0.1";
		private String port = "3306";
		private String nomDeLaBase = "projet";
		private Connection cnx;
	// Methodes d'acces en écriture
	// Enregistre le nom de login
		public void setLogin (String valeur) {
			login = valeur ;
		}
	// Enregistre le mot de passe
		public void setPassword (String valeur) {
			password = valeur ;
		}
	// Enregistre le nom du Host
		public void setHostname (String valeur) {
			hostname = valeur ;
		}

	// Enregistre le numéro de port
		public void setPort (String valeur) {
			port = valeur ;
		}
	// Enregistre le nom de la base de données
		public void setNomDeLaBase (String valeur) {
			nomDeLaBase = valeur ;
		}
	// Methodes d'acces en lecture
		public Connection getCnx() {
			if (etablirConnexion()) {
				return cnx;
			} else {
				return null;
			}
		}
	// Méthodes invisibles (métier)
	// Construit l'URL
	private String construireUrlJdbc() {
		String urlJdbc ;
		urlJdbc = "jdbc:mysql://"+hostname+":" + port + "/" +
		nomDeLaBase ;
		urlJdbc = urlJdbc + "?user=" + login + "&password=" +
		password ;
		return urlJdbc ;
	}
	
	// Etablit la connexion
	private boolean etablirConnexion() {
		boolean statusConnexion = false;
		String urlJdbc ;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			urlJdbc=construireUrlJdbc();
			cnx=DriverManager.getConnection(urlJdbc);
			statusConnexion = true;
		} catch ( Exception e ) {
			statusConnexion = false;
			System.out.println(e);
		}
		return statusConnexion;
	}
}