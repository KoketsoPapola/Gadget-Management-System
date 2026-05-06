<%-- 
    Document   : register
    Created on : 06 May 2026, 19:08:47
    Author     : Student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <h1>Register here!</h1>
        <form action="RegisterServlet.do" method="post">
    <table>
        <tr>
            <td>Student Number :</td>
            <td><input type="text" name="studNum"/></td>
        </tr>

        <tr>
            <td>Student Name :</td>
            <td><input type="text" name="name"/></td>
        </tr>

        <tr>
            <td>Gadget type :</td>
            <td>
                <select name="gadgetType">
                    <option value="laptop">Laptop</option>
                    <option value="camera">Camera</option>
                    <option value="tablet">Tablet</option>
                </select>
            </td>
        </tr>

        <tr>
            <td>Serial number :</td>
            <td><input type="text" name="serialNum"/></td>
        </tr>

        <tr>
            <td>Contact Number :</td>
            <td><input type="text" name="contactNum"/></td>
        </tr>

        <tr>
            <td></td>
            <td><input type="submit" value="REGISTER"/></td>
        </tr>
    </table>
</form>