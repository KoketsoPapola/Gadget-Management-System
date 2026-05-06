<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Campus Gadget Management System</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>

        <!-- NAVBAR -->
        <div class="navbar">
            <div class="logo">🔒 Campus GMS</div>
            <nav>
                <a href="index.jsp">Home</a>
                <a href="register_gadget.jsp">Register Gadget</a>
                <a href="verify.jsp">Verify Exit</a>
                <a href="student_portal.jsp">Student Portal</a>
            </nav>
        </div>

        <!-- MAIN CONTENT -->
        <div class="container">
            <div class="card">
                <h2>Welcome to the Campus Gadget Management System</h2>
                <p class="subtitle">
                    A digital security platform that protects student devices — 
                    laptops, tablets, and cameras — using AI-powered verification and digital tracking.
                </p>
            </div>

            
            <div class="home-grid">

                <a href="register_gadget.jsp" class="home-card">
                    <div class="icon">📋</div>
                    <h3>Register Gadget</h3>
                    <p>Security officers register student gadgets on campus entry.</p>
                </a>

                <a href="verify.jsp" class="home-card">
                    <div class="icon">🔍</div>
                    <h3>Verify Exit</h3>
                    <p>Check and verify gadgets at exit gates before a student leaves.</p>
                </a>

                <a href="student_portal.jsp" class="home-card">
                    <div class="icon">🎓</div>
                    <h3>Student Portal</h3>
                    <p>Students can view their registered gadgets and entry/exit history.</p>
                </a>

            </div>
        </div>

        <footer>
            &copy; 2025 Campus Gadget Management System. All rights reserved.
        </footer>

    </body>
</html>

