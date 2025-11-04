/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

/**
 *
 * @author trann
 */
public class TestConnection {
    public static void main(String[] args) {
        try {
            DBContext db = new DBContext();
            if (db.getConnection() != null) {
                System.out.println("✅ Kết nối thành công!");
            } else {
                System.out.println("❌ Kết nối thất bại.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}