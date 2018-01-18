package metier;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectBDD {

	public String pilote; 
	public String url; 
	public String user;
	public String pw;
	Connection connexion = null;
	
	public ConnectBDD() {
		this.pilote = "com.mysql.jdbc.Driver";
		this.url = "jdbc:mysql://localhost:3306/makeit?autoReconnect=true&useSSL=false";
		// Modifier le user et le pw en fonction de vos login
		this.user = "root";
		this.pw = "admin";
	}
	
	public void Connection() {
		if ( connexion == null ) {
			try {
				Class.forName(this.pilote);
		     	connexion = DriverManager.getConnection(this.url, this.user, this.pw);
			}catch (Exception e){
				System.out.println("echec pilote : "+e);
			}
		}
	}
	
	public void Disconnect() {
		 if ( connexion != null ) {
			 try {
				 connexion.close();
			 }catch ( SQLException ignore ) {
			 } 
		 }
	}
}