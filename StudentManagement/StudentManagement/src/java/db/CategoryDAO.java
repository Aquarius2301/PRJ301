/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package db;

import data.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Khang Ta
 */
public class CategoryDAO extends DBContext {

    /**
     * Get the information of all students in mysql
     *
     * @return an list contains the information of all students
     */
    public ArrayList<Student> getAllStudents() {
        ArrayList<Student> listOfStudents = new ArrayList<>();
        String sql = "select * from students";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1);
                String name = rs.getString(2);
                String birthday = rs.getString(3);
                String gender = rs.getString(4);
                String email = rs.getString(5);
                String phone = rs.getString(6);
                String address = rs.getString(7);

                listOfStudents.add(new Student(id, name, birthday, gender, email, phone, address));
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return listOfStudents;
    }

    /**
     * To check the username and password of an admin. Return true if the admin
     * is existed
     *
     * @param username the username of admin
     * @param password the password of admin
     * @return {@code true} if the admin is existed
     */
    public boolean checkUsername(String username, String password) {
        String sql = "SELECT * from admins where Username = ? And Password = md5(?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return false;
    }

    /**
     * Delete a student by ID
     *
     * @param id the student ID
     */
    public void deleteStudent(String id) {
        String sql = "delete from students where studentid = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    /**
     * To update the information by ID
     *
     * @param id the student ID
     * @param name the name
     * @param birthday the birthday
     * @param gender the gender
     * @param email the Email
     * @param phone the phone
     * @param address the address
     * @return
     */
    public boolean updateStudent(String id, String name, String birthday, String gender, String email, String phone, String address) {
        String sql = "update students set studentname = ? , birthday = ?,"
                + "gender = ?, email=?,phone=?,address=? where studentid =?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, birthday);
            ps.setString(3, gender);
            ps.setString(4, email);
            ps.setString(5, phone);
            ps.setString(6, address);
            ps.setString(7, id);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    /**
     * Get information of a student by ID
     *
     * @param id the student ID
     * @return information of a student
     */
    public Student getStudent(String id) {
        String sql = "select * from students where studentid = ?";
        Student student = new Student();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            id = rs.getString(1);
            String name = rs.getString(2);
            String birthday = rs.getString(3);
            String gender = rs.getString(4);
            String email = rs.getString(5);
            String phone = rs.getString(6);
            String address = rs.getString(7);
            student = new Student(id, name, birthday, gender, email, phone, address);
        } catch (Exception e) {
            System.out.println(e);
        }
        return student;
    }
}
