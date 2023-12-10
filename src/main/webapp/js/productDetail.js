function decreaseAmount(price) {
    let amount = parseInt(document.getElementById("amount").value);
    if (!isNaN(amount) && amount >= 1) {
        amount -= 1;
        document.getElementById("amount").value = amount;
        let totalCost = price * amount;
        document.getElementById("totalCost").innerHTML = "" + totalCost + "&nbsp;₫";
    } else {
        amount = 0;
        document.getElementById("amount").value = amount;
        document.getElementById("cartBtn").disabled = true;
        document.getElementById("buyBtn").disabled = true;
        document.getElementById("totalCost").innerHTML = "0&nbsp;₫";
    }
    if (amount <= 0) {
        document.getElementById("cartBtn").disabled = true;
        document.getElementById("buyBtn").disabled = true;
    } else {
        document.getElementById("cartBtn").disabled = false;
        document.getElementById("buyBtn").disabled = false;
    }
}

function increaseAmount(price) {
    let amount = parseInt(document.getElementById("amount").value);
    if (!isNaN(amount)) {
        amount += 1;
        document.getElementById("amount").value = amount;
        let totalCost = price * amount;
        document.getElementById("totalCost").innerHTML = "" + totalCost + "&nbsp;₫";
    } else {
        amount = 0;
        document.getElementById("amount").value = amount;
        document.getElementById("cartBtn").disabled = true;
        document.getElementById("buyBtn").disabled = true;
        document.getElementById("totalCost").innerHTML = "0&nbsp;₫";
    }

    if (amount <= 0) {
        document.getElementById("cartBtn").disabled = true;
        document.getElementById("buyBtn").disabled = true;
    } else {
        document.getElementById("cartBtn").disabled = false;
        document.getElementById("buyBtn").disabled = false;
    }
}

function isNumber(price) {
    let amount = parseInt(document.getElementById("amount").value);
    if (amount <= 0) {
        document.getElementById("cartBtn").disabled = true;
        document.getElementById("buyBtn").disabled = true;
        document.getElementById("totalCost").innerHTML = "0&nbsp;₫";
    } else {
        document.getElementById("cartBtn").disabled = false;
        document.getElementById("buyBtn").disabled = false;
        let totalCost = price * amount;
        document.getElementById("totalCost").innerHTML = "" + totalCost + "&nbsp;₫";
    }
}

function confirmPurchase() {
    let isConfirmed = confirm("Bạn có chắc chắn muốn mua ngay không?");
    if (isConfirmed) {
        document.getElementById("form").action = "/buy?action=buy";
        document.getElementById("form").submit();
    }
}

function showDetailForm1(idUser, idProduct, nameUser, phoneUser, addressUser) {
    let amount = document.getElementById('amount').value;
    let totalCost = document.getElementById('totalCost').innerHTML;
    document.getElementById('amountProduct').innerHTML = amount;
    document.getElementById('amount1').value = amount;
    document.getElementById('totalCost1').innerHTML = totalCost;
    document.getElementById('InputFullName').value = nameUser;
    document.getElementById('InputPhoneNumber').value = phoneUser;
    document.getElementById('InputAddress').value = addressUser;
    document.getElementById('idUser').value = idUser;
    document.getElementById('idProduct').value = idProduct;
}