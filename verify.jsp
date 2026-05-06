<%-- 
    Document   : verify
    Created on : 06 May 2026, 19:08:56
    Author     : Student
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Verify Gadget</title>
</head>
<body>

    <h1>Verify your Gadget</h1>

    <form action="VerifyGadgetServlet.do" method="post">
        <table>
            <tr>
                <td>Student Number:</td>
                <td><input type="text" name="studNum" required/></td>
            </tr>

            <tr>
                <td>Serial Number:</td>
                <td><input type="text" name="serialNum" required/></td>
            </tr>

            <tr>
                <td></td>
                <td><input type="submit" value="VERIFY"/></td>
            </tr>
        </table>
    </form>

</body>
</html>