package Com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Com.User.UserDetails;

public class UserDAO {
	private Connection Conn;

	public UserDAO(Connection conn) {
		super();
		this.Conn = conn;

	}

	public boolean addUser(UserDetails us) {
		boolean f = false;

		try {

			String query = "insert into user1(name,email,password) values(?,?,?)";
			PreparedStatement ps = Conn.prepareStatement(query);

			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPassword());

			int i = ps.executeUpdate(); // 0 1
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public UserDetails loginUser(UserDetails us) {

		UserDetails user = null;

		try {
			String query = "select * from user1 where email=? and password=?";
			PreparedStatement ps = Conn.prepareStatement(query);
			ps.setString(1, us.getEmail());
			ps.setString(2, us.getPassword());

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				user = new UserDetails();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword("password"); 
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;

	}
}
