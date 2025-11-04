/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.User;
import util.DBContext;
/**
 *
 * @author trann
 */
public class UserDAO {
    public User checkLogin(String username, String password) throws Exception {
        String query = "SELECT * FROM Users WHERE userID = ? AND password = ?";
        try (Connection conn = new DBContext().getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new User(
                    rs.getString("userID"),
                    rs.getString("password"),
                    rs.getString("fullName"),
                    rs.getInt("role")
                );
            }
        }
        return null;
    }
}
