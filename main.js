
function validateForm() {
    let serial = document.forms[0]["serialNumber"].value;
    if (serial.length < 5) {
        alert("Invalid serial number");
        return false;
    }
}

