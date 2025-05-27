document.addEventListener('DOMContentLoaded', function() {
    const orderItemsContainer = document.getElementById('order-items');
    const totalPriceElement = document.getElementById('total-price');
    const customerNameElement = document.getElementById('customer-name')
    
    // Retrieve cart items and customer data from localStorage
    const cartItems = JSON.parse(localStorage.getItem('cart')) || [];
    
    const customerName = localStorage.getItem('customerName') || "Valued Customer";
    
    // Set customer name dynamically (this will update the <span id="customer-name">)
   // document.getElementById('customer-name').textContent = customerName;
    // If no items are in the cart, show a message
    if (cartItems.length === 0) {
        orderItemsContainer.innerHTML = '<p>No items found in your order.</p>';
        return;
    }

    let total = 0;
    let orderHTML = '';

    // Loop through the cart items and generate HTML for each item
    cartItems.forEach(item => {
        const itemTotal = item.price * item.quantity;
        total += itemTotal;

        orderHTML += `
            <div class="order-items">
                <img src="${item.img}" alt="${item.name}" class="order-item-img">
                <div class="order-item-details">
                    <h3>${item.name}</h3>
                    <p>Quantity: ${item.quantity}</p>
                    <p>Price: ₹${item.price.toFixed(2)}</p>
                    
                </div>
            </div>
        `;
    });

	// Calculate the GST (2% of the total)
	    const gst = total * 0.02;
	    const totalWithGST = total + gst;

    // Add the order items to the container and total price
    orderItemsContainer.innerHTML = orderHTML;
    totalPriceElement.textContent = `${totalWithGST.toFixed(2)} (including ₹${gst.toFixed(2)} GST)`;

    // Clear the cart after the order is placed
  
	setTimeout(() => {
	    localStorage.removeItem('cart');
	}, 5000); // Delay clearing cart by 5 seconds

	
});
