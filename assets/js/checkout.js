// Add this at the top
document.addEventListener("DOMContentLoaded", function () {
	
	const cartData = localStorage.getItem('cartItems');
	    console.log('Raw cart data from localStorage:', cartData); // Debugging

	    if (!cartData) {
	        console.error('No cart data found! Redirecting...');
	        window.location.href = 'cart.html';
	        return;
	    }

	    try {
	        const cartItems = JSON.parse(cartData);
	        console.log('Parsed cart items:', cartItems); // Debugging

	        if (!Array.isArray(cartItems) || cartItems.length === 0) {
	            console.error('Invalid or empty cart data! Redirecting...');
	            window.location.href = 'cart.html';
	            return;
	        }

	        // Display order summary
	        displayOrderSummary(cartItems);
	    } catch (error) {
	        console.error('Error parsing cart data:', error);
	        window.location.href = 'cart.html';
	    }
		

	
	
    const proceedBtn = document.querySelector('.proceed-btn');

    if (proceedBtn) {
        proceedBtn.addEventListener('click', function (event) {
            event.preventDefault(); // Prevent default form submission

            // Get cart items from localStorage
            const cartItems = JSON.parse(localStorage.getItem('cartItems')) || [];
            const form = document.getElementById('addressForm');

            if (cartItems.length === 0) {
                alert("Your cart is empty!");
                return;
            }

            if (!form.checkValidity()) {
                alert("Please fill in all required fields!");
                return;
            }

            // Collect form data
            const formData = new FormData(form);
            const orderDetails = {
                customerDetails: {
                    firstName: formData.get('firstName'),
                    lastName: formData.get('lastName'),
                    email: formData.get('email'),
                    phone: formData.get('phone'),
                    address: formData.get('address'),
                    city: formData.get('city'),
                    state: formData.get('state'),
                    pincode: formData.get('pincode') || ""
                },
                orderItems: cartItems,
                orderTotal: calculateTotal(cartItems)
            };

            console.log("Sending JSON:", orderDetails);

            // Send JSON data using fetch
			fetch('/Sports_Ecommerce/orderServlet', {
			    method: 'POST',
			    headers: { 'Content-Type': 'application/json' },
			    body: JSON.stringify(orderDetails)
			})
			.then(response => response.json()) // ✅ Convert response to JSON
			.then(data => {
			            console.log("Server Response:", data);

						if (data.success) {
						        // Immediately redirect to Payment Gateway with order details as query parameters
						        window.location.href = `http://localhost:8080/Payment/sportsData`;
						    } else {
						        alert("Error: " + data.message);
						    }
			        })
			        .catch(error => {
			            console.error("Error:", error);
			            window.location.href = 'http://localhost:8080/Payment/sportsData';
			        });
			    });
    } else {
        console.error('Proceed button not found!');
    }
	
	

	function calculateTotal(cartItems) {
			    const subtotal = cartItems.reduce((sum, item) => 
			        sum + (item.price * (item.quantity || 1)), 0);
			    const gst = subtotal * 0.02;
			    return {
			        subtotal: subtotal,
			        gst: gst,
			        total: subtotal + gst
			    };
			}

	
});



function displayOrderSummary(cartItems) {
    const orderSummaryDiv = document.querySelector('.checkout-right');

    if (!orderSummaryDiv) {
        console.error('Order summary container not found!');
        return;
    }

    let subtotal = 0;
    let totalQuantity = 0;
    let html = `
        <div class="order-summary">
            <h3>ORDER DETAILS (${cartItems.length})</h3>
            <div class="cart-items">`;

    // Loop through each item in the cart and render it
    cartItems.forEach(item => {
        if (!item || !item.price || !item.quantity) {
            console.error('Invalid item found:', item);
            return;
        }
    
        const itemTotal = item.price * (item.quantity || 1);
        subtotal += itemTotal;
        totalQuantity += item.quantity || 1;
    
        html += `
            <div class="cart-item">
                <div class="product-info">
                    <img src="${item.img}" alt="${item.name}" class="product-thumb" 
                    onerror="this.onerror=null; this.src='assets/images/placeholder.jpg';">
                    <div class="product-details">
                        <h4>${item.name || 'No Name'}</h4>
                        <p>Quantity: ${item.quantity || 1}</p>
                        <div class="price">₹${(item.price || 0).toFixed(2)}</div>
                    </div>
                </div>
            </div>`;
    });
    


    const gst = subtotal * 0.02;
    const total = subtotal + gst;

    html += `
            </div>
            <div class="price-summary">
                <div class="subtotal">
                    <span>Subtotal</span>
                    <span>₹${subtotal.toFixed(2)}</span>
                </div>
                <div class="gst">
                    <span>GST (2%)</span>
                    <span>₹${gst.toFixed(2)}</span>
                </div>
                <div class="total">
                    <span>Total</span>
                    <span>₹${total.toFixed(2)}</span>
                </div>
            </div>
        </div>`;

    orderSummaryDiv.innerHTML = html;
}


function addToCart(product) {
    console.log('Adding product:', product); // Debug log
    let cartItems = JSON.parse(localStorage.getItem('cartItems')) || [];
    
    const existingItem = cartItems.find(item => item.id === product.id);
    
    if (existingItem) {
        existingItem.quantity = (existingItem.quantity || 1) + 1;
        console.log('Updated quantity for existing item:', existingItem);
    } else {
        const item = {
            id: product.id,
            name: product.name,
            price: product.price,
            image: product.img,
            quantity: 1
        };
        cartItems.push(item);
        console.log('Added new item:', item);
    }
    
    localStorage.setItem('cartItems', JSON.stringify(cartItems));
    console.log('Updated cart:', cartItems); // Debug log
    displayOrderSummary();
}

/*new Code written */
/*document.querySelector('.proceed-btn').addEventListener('click', function(event) {
    event.preventDefault(); 
    window.location.href = "./thankyou.html"; 
});*/


document.addEventListener('DOMContentLoaded', function() {
    const orderItemsContainer = document.getElementById('order-items');
    const totalPriceElement = document.getElementById('total-price');
    const customerNameElement = document.getElementById('customer-name');
    const cartItems = JSON.parse(localStorage.getItem('cartItems')) || [];
    
    // If no items are found in the cart, display a message
    if (cartItems.length === 0) {
        orderItemsContainer.innerHTML = '<p>No items found in your order.</p>';
        return;
    }

    let total = 0;
    let orderHTML = '';
    
    // Retrieve the customer name from localStorage
    const customerName = localStorage.getItem('customerName') || "Valued Customer";
    customerNameElement.textContent = customerName;

    // Loop through the cart items and generate HTML for each item
    cartItems.forEach(item => {
        total += item.price * (item.quantity || 1);
        orderHTML += `
            <div class="order-item">
                <img src="${item.image}" alt="${item.name}" class="order-item-img">
                <div class="order-item-details">
                    <h3>${item.name}</h3>
                    <p>Quantity: ${item.quantity || 1}</p>
                    <p>Price: ₹${item.price.toFixed(2)}</p>
                </div>
            </div>
        `;
    });
    
    orderItemsContainer.innerHTML = orderHTML;
    totalPriceElement.textContent = total.toFixed(2);

    
});

document.getElementById('addressForm').addEventListener('submit', function(event) {
    event.preventDefault();
    const firstName = document.querySelector('input[name="firstName"]').value;
    const lastName = document.querySelector('input[name="lastName"]').value;
    const fullName = firstName + ' ' + lastName;
    localStorage.setItem('customerName', fullName);
    console.log('Customer Name Saved:', fullName);
    this.submit(); // Submit form after saving name
});




