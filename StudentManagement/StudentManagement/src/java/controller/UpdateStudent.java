/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import data.Student;
import db.CategoryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author khang
 */
public class UpdateStudent extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UpdateStudent</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateStudent at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO c = new CategoryDAO();
        String id = request.getParameter("id");
        Student student = c.getStudent(id);

        HttpSession session = request.getSession();
        request.setAttribute("id", id);
        request.setAttribute("name", student.getName());
        request.setAttribute("birthday", student.getBirthday());
        session.setAttribute("gender", student.getGender());
        request.setAttribute("email", student.getEmail());
        request.setAttribute("phone", student.getPhone());
        request.setAttribute("address", student.getAddress());
        request.getRequestDispatcher("updateStudentInfo.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name").trim();
        String birthday = request.getParameter("birthday");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email").trim();
        String phone = request.getParameter("phone").trim();
        String address = request.getParameter("address").trim();

        if (name.equals("") || email.equals("") || phone.equals("") || address.equals("") || !isValidPhone(phone)) {
            HttpSession session = request.getSession();
            request.setAttribute("id", id);
            request.setAttribute("name", name);
            request.setAttribute("email", email);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("birthday", birthday);
            session.setAttribute("gender", gender);
            if (name.equals("")) {
                request.setAttribute("nameWarning", "Please enter the name");
            }
            if (email.equals("")) {
                request.setAttribute("emailWarning", "Please enter the email");
            }
            if (phone.equals("")) {
                request.setAttribute("phoneWarning", "Please enter the phone");
            } else if (!isValidPhone(phone)) {
                request.setAttribute("phoneWarning", "Please enter the valid phone (no more than 12 digits)");
            }
            if (address.equals("")) {
                request.setAttribute("addressWarning", "Please enter the address");
            }
            request.getRequestDispatcher("updateStudentInfo.jsp").forward(request, response);
        } else {
            CategoryDAO c = new CategoryDAO();
            c.updateStudent(id, name, birthday, gender, email, phone, address);
            response.sendRedirect("studentList");
        }
    }

    private boolean isValidPhone(String phone) {
        try {
            if (phone.length() <= 12) {
                int a = Integer.parseInt(phone);
            } else {
                return false;
            }
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
