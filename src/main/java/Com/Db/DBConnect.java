package Com.Db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
private static Connection conn = null;
	
	public static Connection  getConn() {
		
	try {
		
		if(conn==null) {
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes","root","");
		}
	}catch(Exception e) {
			e.printStackTrace();
	}
		System.out.println(conn);
		return conn;
		
	}


}
