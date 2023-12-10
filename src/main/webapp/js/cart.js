function zero() {
    let payment = document.getElementById("totalPayment").innerHTML;

    // Kiểm tra xem innerHTML có chứa chuỗi "0&nbsp;₫" hay không
    // if (payment.includes("0&nbsp;₫") && !/\d+/.test(payment)) {
    if (payment === "0&nbsp;₫") {
        // Chuỗi có giá trị "0&nbsp;₫" và không chứa ký tự số khác 0
        document.getElementById("paymentBtn").disabled = true;
    } else {
        // Chuỗi có giá trị khác "0&nbsp;₫" hoặc chứa ký tự số khác 0
        document.getElementById("paymentBtn").disabled = false;
    }
}

function userInfo(){
    document.getElementById('pay').hidden = true;
    document.getElementById('infoUser').hidden = false;
}

function goBack() {
    document.getElementById('pay').hidden = false;
    document.getElementById('infoUser').hidden = true;
}