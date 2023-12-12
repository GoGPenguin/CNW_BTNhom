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

function showDetailForm1(idProduct) {
    fetch('http://localhost:8080/product?&action=user', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ action: "user" })
    })
        .then(response => response.json())
        .then(user => {
            if (user == "User not found"){
                window.location.href = 'http://localhost:8080/login';
            } else {
                // Điền dữ liệu vào các input
                let amount = document.getElementById('amount').value;
                let totalCost = document.getElementById('totalCost').innerHTML;
                document.getElementById('amountProduct').innerHTML = amount;
                document.getElementById('amount1').value = amount;
                document.getElementById('totalCost1').innerHTML = totalCost;
                document.getElementById('idProduct').value = idProduct;
                document.getElementById('InputFullName').value = user.nameUser;
                document.getElementById('InputPhoneNumber').value = user.phoneUser;
                document.getElementById('InputAddress').value = user.addressUser;
                document.getElementById('idUser').value = user.idUser;
            }
        })
        .catch(error => {
            console.error('Error fetching user detail: ', error);
        });
}