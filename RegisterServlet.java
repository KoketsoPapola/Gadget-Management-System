/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.selvlet;
import com.connecton.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Student
 */
public class RegisterServlet extends HttpServlet {

 @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Get form data
        String studentNumber = request.getParameter("studentNumber");
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String idNumber = request.getParameter("idNumber");
        String phone = request.getParameter("phone");
        String gadgetType = request.getParameter("gadgetType");
        String serialNumber = request.getParameter("serialNumber");

        // 2. Generate receipt
        String receiptId = "REC" + System.currentTimeMillis();
        java.sql.Timestamp timestamp = java.sql.Timestamp.valueOf(LocalDateTime.now());
        try {
    Connection conn = DBConnection.getConnection();

    String sql = "INSERT INTO gadgets (student_number, name, surname, id_number, phone, gadget_type, serial_number, receipt_id, timestamp) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    PreparedStatement stmt = conn.prepareStatement(sql);

    stmt.setString(1, studentNumber);
    stmt.setString(2, name);
    stmt.setString(3, surname);
    stmt.setString(4, idNumber);
    stmt.setString(5, phone);
    stmt.setString(6, gadgetType);
    stmt.setString(7, serialNumber);
    stmt.setString(8, receiptId);
    stmt.setTimestamp(9, timestamp);

    stmt.executeUpdate();

    conn.close();

} catch (Exception e) {
    e.printStackTrace();
}
        // 3. Send data to JSP
        request.setAttribute("studentNumber", studentNumber);
        request.setAttribute("name", name);
        request.setAttribute("surname", surname);
        request.setAttribute("gadgetType", gadgetType);
        request.setAttribute("serialNumber", serialNumber);
        request.setAttribute("receiptId", receiptId);
        request.setAttribute("timestamp", timestamp);

        // 4. Forward to receipt page
        RequestDispatcher dispatcher = request.getRequestDispatcher("receipt.jsp");
        dispatcher.forward(request, response);
    }

}
