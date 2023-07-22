/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db;

import data.Toy;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Khang Ta
 */
public class CategoryDAO extends DBContext {

    public boolean isUserExisted(String username, String password) {
        String sql = "select * from users where username=? and password=md5(?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public ArrayList<Toy> getAllToys() {
        ArrayList<Toy> toys = new ArrayList<>();
        String sql = "select * from toys";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String description = rs.getString(3);
                String category = rs.getString(4);
                double price = rs.getDouble(5);
                int quantity = rs.getInt(6);
                toys.add(new Toy(id, name, description, category, price, quantity));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return toys;
    }

    public boolean isExisted(int id) {
        String sql = "select * from toys where toyid=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public void addToy(int id, String name, String description, String category, double price, int quantity) {
        String sql = "insert into toys values (?,?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setString(3, description);
            ps.setString(4, category);
            ps.setDouble(5, price);
            ps.setInt(6, quantity);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateToy(int id, String name, String description, String category, double price, int quantity) {
        String sql = "UPDATE toys SET name = ?,description = ?,price = ?,quantity = ?, category = ? WHERE toyid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setDouble(3, price);
            ps.setInt(4, quantity);
            ps.setString(5, category);
            ps.setInt(6, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void deleteToy(String id) {
        String sql = "delete from toys where toyid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Toy getToy(int id) {
        String sql = "select *  from toys where toyid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            String name = rs.getString(2);
            String description = rs.getString(3);
            String category = rs.getString(4);
            double price = rs.getDouble(5);
            int quantity = rs.getInt(6);
            return new Toy(id, name, description, category, price, quantity);
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

}
