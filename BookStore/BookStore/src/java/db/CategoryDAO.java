/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db;

import data.Book;
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

    public ArrayList<Book> getAllBooks() {
        ArrayList<Book> books = new ArrayList<>();
        String sql = "select * from books";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                String description = rs.getString(3);
                double price = rs.getDouble(4);
                String author = rs.getString(5);
                books.add(new Book(id, name, description, author, price));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return books;
    }

    public boolean isExisted(String id) {
        String sql = "select * from where bookid=?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public void addBook(String id, String name, String description, double price, String author) {
        String sql = "insert into books values (?,?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, description);
            ps.setDouble(4, price);
            ps.setString(5, author);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }

    }

    public void deleteBook(String id) {
        String sql = "delete from books where bookid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void updateBook(String id, String name, String description, String author, double price) {
        String sql = "UPDATE books SET name = ?,description = ?,price = ?, author = ? WHERE bookid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setDouble(3, price);
            ps.setString(4, author);
            ps.setString(5, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Book getBook(String id) {
        String sql = "select *  from books where bookid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            String name = rs.getString(2);
            String description = rs.getString(3);
            String author = rs.getString(5);
            double price = rs.getDouble(4);

            return new Book(id, name, description, author, price);
        } catch (Exception e) {
            System.out.println(e);
            return null;
        }
    }

}
