document.getElementById('addToCart').addEventListener('click', function () {
    // Logic to add the item to the cart
    alert('Item added to cart!');
});
// Sample JavaScript to update stock status
let isInStock = true; // This should come from your inventory logic
let stockStatus = document.getElementById('stockStatus');
if (isInStock) {
    stockStatus.textContent = 'In Stock';
} else {
    stockStatus.textContent = 'Sold Out';
    stockStatus.style.color = 'red';
}
