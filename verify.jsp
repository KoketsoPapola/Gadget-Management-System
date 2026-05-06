<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exit Verification - Campus GMS</title>
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
            <h2>🔍 Exit Verification</h2>
            <p class="subtitle">
                Security Officer: Verify that the student is the registered owner of the gadget before allowing exit.
            </p>

            <!-- VERIFICATION FORM -->
            <form id="verifyForm" action="VerifyGadgetServlet.do" method="post" onsubmit="return simulateVerification()">

                <div class="form-group">
                    <label for="v-studentNumber">Student Number *</label>
                    <input type="text" id="v-studentNumber" name="studentNumber"
                           placeholder="e.g. ST20230001" required>
                </div>

                <div class="form-group">
                    <label for="v-serialNumber">Gadget Serial Number *</label>
                    <input type="text" id="v-serialNumber" name="serialNumber"
                           placeholder="Enter or scan the serial number" required>
                </div>

                <button type="submit" class="btn btn-primary">
                    🔎 Verify Gadget
                </button>

            </form>

            <!-- VERIFICATION RESULT -->
            <div class="verify-result" id="verifyResult">
                <div class="icon" id="resultIcon"></div>
                <h3 id="resultTitle"></h3>
                <p id="resultMessage" style="margin-top: 8px; font-size: 0.9rem;"></p>
            </div>

            <!-- GADGET DETAILS (shown on success) -->
            <div class="receipt-box" id="gadgetDetails">
                <h3>📱 Gadget Details</h3>
                <div class="receipt-row">
                    <span>Student Number:</span>
                    <span id="d-studentNumber"></span>
                </div>
                <div class="receipt-row">
                    <span>Full Name:</span>
                    <span id="d-name"></span>
                </div>
                <div class="receipt-row">
                    <span>Gadget Type:</span>
                    <span id="d-gadgetType"></span>
                </div>
                <div class="receipt-row">
                    <span>Serial Number:</span>
                    <span id="d-serialNumber"></span>
                </div>
                <div class="receipt-row">
                    <span>Entry Time:</span>
                    <span id="d-entryTime"></span>
                </div>
                <div class="receipt-row">
                    <span>Exit Time:</span>
                    <span id="d-exitTime"></span>
                </div>
            </div>

        </div><!-- end card -->
    </div><!-- end container -->

    <footer>
        &copy; 2025 Campus Gadget Management System. All rights reserved.
    </footer>

    <!-- VERIFICATION SIMULATION (frontend only, until Servlet is ready) -->
    <script>
        /*
         * simulateVerification() mimics what the server will do.
         * Replace with real AJAX call to VerifyGadgetServlet in Layer 2.
         *
         * For demo: student number "ST20230001" + serial "SN-DEMO-001" = PASS
         * Everything else = FAIL
         */
        function simulateVerification() {
            const studentNum = document.getElementById('v-studentNumber').value.trim();
            const serial     = document.getElementById('v-serialNumber').value.trim();

            const result      = document.getElementById('verifyResult');
            const details     = document.getElementById('gadgetDetails');
            const icon        = document.getElementById('resultIcon');
            const title       = document.getElementById('resultTitle');
            const message     = document.getElementById('resultMessage');

            // Demo: treat known demo values as success
            const isValid = (studentNum === "ST20230001" && serial === "SN-DEMO-001");

            result.className = 'verify-result ' + (isValid ? 'success' : 'failure');
            result.style.display = 'block';

            if (isValid) {
                icon.textContent    = '✅';
                title.textContent   = 'Gadget Verified — Student May Exit';
                message.textContent = 'The serial number matches the registered owner. Exit approved.';

                // Populate gadget details
                document.getElementById('d-studentNumber').textContent = studentNum;
                document.getElementById('d-name').textContent          = 'Demo Student';
                document.getElementById('d-gadgetType').textContent    = 'Laptop';
                document.getElementById('d-serialNumber').textContent  = serial;
                document.getElementById('d-entryTime').textContent     = '2025-06-01 08:30 AM';
                document.getElementById('d-exitTime').textContent      = new Date().toLocaleString();

                details.style.display = 'block';
            } else {
                icon.textContent    = '❌';
                title.textContent   = 'Verification Failed — Do Not Allow Exit';
                message.textContent =
                    'No matching record found. The gadget may not be registered, or the serial number is incorrect. Alert security.';
                details.style.display = 'none';
            }

            result.scrollIntoView({ behavior: 'smooth' });
            return false; // prevent form submit until Servlet is ready
        }
    </script>

</body>
</html>
