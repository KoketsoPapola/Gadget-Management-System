<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register Gadget - Campus GMS</title>
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
            <a href="studentPortal.jsp">Student Portal</a>
        </nav>
    </div>

    <!-- MAIN CONTENT -->
    <div class="container">
        <div class="card">
            <h2>📋 Gadget Registration</h2>
            <p class="subtitle">Security Officer: Register a student's gadget upon campus entry.</p>

            <!-- Success / Error messages (shown after form submit) -->
            <div class="alert alert-success" id="successMsg">
                ✅ Gadget registered successfully! Receipt generated below.
            </div>
            <div class="alert alert-error" id="errorMsg">
                ❌ Please fill in all required fields correctly.
            </div>

            <!-- REGISTRATION FORM -->
            <form id="registerForm" action="RegisterGadgetServlet.do" method="post" onsubmit="return validateForm()">

                <h4 style="color:#555; margin-bottom:15px; border-bottom:1px solid #eee; padding-bottom:8px;">
                    Student Information
                </h4>

                <div class="form-group">
                    <label for="studentNumber">Student Number *</label>
                    <input type="text" id="studentNumber" name="studentNumber"
                           placeholder="e.g. ST20230001" required maxlength="20">
                </div>

                <div class="form-group">
                    <label for="firstName">First Name *</label>
                    <input type="text" id="firstName" name="firstName"
                           placeholder="Enter first name" required>
                </div>

                <div class="form-group">
                    <label for="surname">Surname *</label>
                    <input type="text" id="surname" name="surname"
                           placeholder="Enter surname" required>
                </div>

                <div class="form-group">
                    <label for="idNumber">ID Number *</label>
                    <input type="text" id="idNumber" name="idNumber"
                           placeholder="13-digit ID number" required maxlength="13" minlength="13">
                </div>

                <div class="form-group">
                    <label for="cellphone">Cellphone Number *</label>
                    <input type="tel" id="cellphone" name="cellphone"
                           placeholder="e.g. 0821234567" required maxlength="10" minlength="10">
                </div>

                <h4 style="color:#555; margin:20px 0 15px; border-bottom:1px solid #eee; padding-bottom:8px;">
                    Gadget Information
                </h4>

                <div class="form-group">
                    <label for="gadgetType">Gadget Type *</label>
                    <select id="gadgetType" name="gadgetType" required>
                        <option value="">-- Select Gadget Type --</option>
                        <option value="Laptop">Laptop</option>
                        <option value="Tablet">Tablet</option>
                        <option value="Camera">Camera</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="serialNumber">Serial Number *</label>
                    <input type="text" id="serialNumber" name="serialNumber"
                           placeholder="Enter gadget serial number" required>
                </div>

                <button type="submit" class="btn btn-primary">
                    Register &amp; Generate Receipt
                </button>

            </form>

            <!-- RECEIPT (shown after successful registration) -->
            <div class="receipt-box" id="receiptBox">
                <h3>🧾 Registration Receipt</h3>
                <div class="receipt-row">
                    <span>Student Number:</span>
                    <span id="r-studentNumber"></span>
                </div>
                <div class="receipt-row">
                    <span>Full Name:</span>
                    <span id="r-name"></span>
                </div>
                <div class="receipt-row">
                    <span>ID Number:</span>
                    <span id="r-idNumber"></span>
                </div>
                <div class="receipt-row">
                    <span>Cellphone:</span>
                    <span id="r-cellphone"></span>
                </div>
                <div class="receipt-row">
                    <span>Gadget Type:</span>
                    <span id="r-gadgetType"></span>
                </div>
                <div class="receipt-row">
                    <span>Serial Number:</span>
                    <span id="r-serialNumber"></span>
                </div>
                <div class="receipt-row">
                    <span>Entry Time:</span>
                    <span id="r-entryTime"></span>
                </div>
                <div class="receipt-row">
                    <span>Receipt ID:</span>
                    <span id="r-receiptId"></span>
                </div>
                <br>
                <button class="btn btn-secondary" onclick="window.print()">🖨 Print Receipt</button>
            </div>

        </div><!-- end card -->
    </div><!-- end container -->

    <footer>
        &copy; 2025 Campus Gadget Management System. All rights reserved.
    </footer>

    <!-- CLIENT-SIDE VALIDATION & RECEIPT PREVIEW -->
    <script>
        function validateForm() {
            const idNumber  = document.getElementById('idNumber').value.trim();
            const cellphone = document.getElementById('cellphone').value.trim();
            const serial    = document.getElementById('serialNumber').value.trim();

            // Basic ID number check: must be 13 digits
            if (!/^\d{13}$/.test(idNumber)) {
                showError("ID Number must be exactly 13 digits.");
                return false;
            }

            // Cellphone: must be 10 digits starting with 0
            if (!/^0\d{9}$/.test(cellphone)) {
                showError("Cellphone number must be 10 digits and start with 0.");
                return false;
            }

            // Serial number: must not be empty
            if (serial.length < 3) {
                showError("Please enter a valid serial number.");
                return false;
            }

            // Show receipt preview (in real app, this fires after server response)
            showReceipt();

            // For now, prevent actual form submission until Servlet is ready.
            // Remove 'return false' below once RegisterGadgetServlet is built.
            return false;
        }

        function showError(msg) {
            const err = document.getElementById('errorMsg');
            err.textContent = "❌ " + msg;
            err.style.display = 'block';
            document.getElementById('successMsg').style.display = 'none';
        }

        function showReceipt() {
            // Populate receipt fields from form inputs
            document.getElementById('r-studentNumber').textContent =
                document.getElementById('studentNumber').value;
            document.getElementById('r-name').textContent =
                document.getElementById('firstName').value + ' ' +
                document.getElementById('surname').value;
            document.getElementById('r-idNumber').textContent =
                document.getElementById('idNumber').value;
            document.getElementById('r-cellphone').textContent =
                document.getElementById('cellphone').value;
            document.getElementById('r-gadgetType').textContent =
                document.getElementById('gadgetType').value;
            document.getElementById('r-serialNumber').textContent =
                document.getElementById('serialNumber').value;
            document.getElementById('r-entryTime').textContent =
                new Date().toLocaleString();
            document.getElementById('r-receiptId').textContent =
                'RCP-' + Date.now();

            // Show success message and receipt
            document.getElementById('successMsg').style.display = 'block';
            document.getElementById('errorMsg').style.display  = 'none';
            document.getElementById('receiptBox').style.display = 'block';

            // Scroll to receipt
            document.getElementById('receiptBox').scrollIntoView({ behavior: 'smooth' });
        }
    </script>

</body>
</html>
