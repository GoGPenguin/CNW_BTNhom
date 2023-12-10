function filterProduct(categoryId) {
    fetch('http://localhost:8080?categoryId=' + categoryId, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({ categoryId: categoryId })
    })
        .then(response => response.json())
        .then(data => {
            // Update the productList HTML content with the new data
            const productListContainer = document.getElementById('productList');
            productListContainer.innerHTML = '';
            for (let i = 0; i < data.length; i++) {
                const product = data[i];
                const productElement = createProductElement(product);
                productListContainer.appendChild(productElement);
            }
        })
        .catch(error => {
            console.log(error);
        });
}

function createProductElement(product) {
    // Create and return the HTML element for a product
    const wrapper = document.createElement('div');
    wrapper.className = 'wrapper';

    const anchor = document.createElement('a');
    anchor.href = '/product?id=' + product.idProduct;
    anchor.style.color = 'black';
    anchor.style.textDecoration = 'none';

    const thumbnail = document.createElement('div');
    thumbnail.className = 'thumbnail';
    const thumbnailImage = document.createElement('img');
    thumbnailImage.src = 'data:image/png;base64,' + product.urlImage;
    thumbnailImage.alt = 'cover';
    thumbnail.appendChild(thumbnailImage);

    const text = document.createElement('div');
    text.className = 'text fw-bold';
    text.textContent = product.nameProduct;

    const price = document.createElement('div');
    price.className = 'price';
    price.textContent = product.price + ' ₫';

    anchor.appendChild(thumbnail);
    anchor.appendChild(text);
    anchor.appendChild(price);

    wrapper.appendChild(anchor);

    return wrapper;
}


