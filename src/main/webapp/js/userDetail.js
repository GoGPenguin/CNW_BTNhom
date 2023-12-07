function showDetailForm(userId) {
    fetch('http://localhost:8080/user?action=getUser&userId=' + userId, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ userId: userId })
    })
        .then(response => response.json())
        .then(user => {
            // Điền dữ liệu vào các input
            document.getElementById('InputEmailUpdate').value = user.username;
            document.getElementById('InputPasswordUpdate').value = user.password;
            document.getElementById('InputFullNameUpdate').value = user.nameUser;
            document.getElementById('InputPhoneNumberUpdate').value = user.phoneUser;
            document.getElementById('InputAddressUpdate').value = user.addressUser;
        })
        .catch(error => {
            console.error('Error fetching user detail: ', error);
        });
}