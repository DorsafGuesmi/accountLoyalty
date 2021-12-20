package beans;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import DB.DBConnexion;
import DB.DBLien;

public class Admin  implements Serializable {

	private String login , password , name , email ;
	private Statement st ;
	
	
	public Admin () {
		DBConnexion db = new DBConnexion(); 
		st = new DBLien().getLien(db.getCnx());
	}
	
	
	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	} 
	
	
	public boolean  verifUser () {
		
		String req = "select * from Admin where login='"+login+"' and password='"+password+"'";
		
		try {
			ResultSet rs =  st.executeQuery(req);
			if(rs.next()) {
				
				email = rs.getString("email");
				name = rs.getString("name");
				
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return false;
	}
	
}
