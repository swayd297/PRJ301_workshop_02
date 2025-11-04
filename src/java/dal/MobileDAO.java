/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.*;

/**
 *
 * @author trann
 */
import model.Mobile;
import util.DBContext;

public class MobileDAO {

    public List<Mobile> getAll() throws Exception {
        List<Mobile> list = new ArrayList<>();
        String sql = "SELECT * FROM Mobiles";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Mobile m = new Mobile(
                    rs.getString("mobileID"),
                    rs.getString("mobileName"),
                    rs.getString("description"),
                    rs.getFloat("price"),
                    rs.getInt("yearOfProduction"),
                    rs.getInt("quantity"),
                    rs.getBoolean("notSale")
            );
            list.add(m);
        }

        rs.close();
        ps.close();
        conn.close();

        return list;
    }

    // Tìm kiếm mobiles theo id hoặc name (không phân biệt hoa thường)
    public List<Mobile> search(String keyword) throws Exception {
        List<Mobile> list = new ArrayList<>();
        String sql = "SELECT * FROM Mobiles WHERE mobileID LIKE ? OR mobileName LIKE ?";
        Connection conn = new DBContext().getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "%" + keyword + "%");
        ps.setString(2, "%" + keyword + "%");
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Mobile m = new Mobile(
                    rs.getString("mobileID"),
                    rs.getString("mobileName"),
                    rs.getString("description"),
                    rs.getFloat("price"),
                    rs.getInt("yearOfProduction"),
                    rs.getInt("quantity"),
                    rs.getBoolean("notSale")
            );
            list.add(m);
        }

        rs.close();
        ps.close();
        conn.close();

        return list;
    }
}
