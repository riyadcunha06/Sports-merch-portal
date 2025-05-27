// Initialize an empty cart
let cart = [];

// Function to add item to cart
function addToCart(product) {
    const existingProduct = cart.find(item => item.id === product.id);
    if (existingProduct) {
        existingProduct.quantity++; // Increase quantity if already in cart
    } else {
        cart.push({ ...product, quantity: 1 }); // Add new product with quantity 1
    }
    saveCart();
    updateCartDisplay();
    showNotification('Item added to cart!');
}

// Function to update the cart display
function updateCartDisplay() {
 
    const cartItemsContainer = document.getElementById('cart-items');
    if (!cartItemsContainer) return;
    
    cartItemsContainer.innerHTML = '';

    if (!cart || cart.length === 0) {
        cartContainer.innerHTML = `
            <div class="empty-cart-message">
                <p>Your cart is empty</p>
                <a href="index.html" class="continue-shopping">Continue Shopping</a>
            </div>`;
        return;
    }

    // Add table header
    cartItemsContainer.innerHTML = `
        <tr class="cart-header">
            <th>Product</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Total</th>
        </tr>
    `;

    let subtotal = 0;
    
    // Add cart items
    cart.forEach(item => {
        try {
            const price = parseFloat(item.price);
            const quantity = parseInt(item.quantity) || 1;
            const itemTotal = price * quantity;
            
            if (!isNaN(itemTotal)) {
                subtotal += itemTotal;
            }

            cartItemsContainer.innerHTML += `
                <tr class="cart-item">
                    <td class="cart-info">
                        <img src="${item.img}" alt="${item.name}" />
                        <div>
                            <p>${item.name}</p>
                            <small>Price: ₹${item.price.toFixed(2)}</small><br />
                            <a href="#" class="remove-item" data-id="${item.id}">Remove</a>
                        </div>
                    </td>
                    <td class="quantity-cell">
                        <button class="quantity-btn minus" onclick="updateQuantity(${item.id}, ${item.quantity - 1})">-</button>
                        <input type="number" value="${item.quantity}" min="1" 
                               class="item-quantity" data-id="${item.id}" 
                               onchange="updateQuantity(${item.id}, this.value)">
                        <button class="quantity-btn plus" onclick="updateQuantity(${item.id}, ${item.quantity + 1})">+</button>
                    </td>
                    <td class="price-cell">₹${item.price.toFixed(2)}</td>
                    <td class="total-cell">₹${itemTotal.toFixed(2)}</td>
                </tr>
            `;
        } catch (error) {
            console.error('Error rendering cart item:', error, item);
        }
    });


    // Calculate totals
    const gst = calculateGST(subtotal);
    const total = subtotal + gst;

    // Add summary rows
    cartItemsContainer.innerHTML += `
    <tr class="summary-row">
        <td colspan="2"></td>
        <td class="summary-label">Subtotal:</td>
        <td class="summary-value">₹${isNaN(subtotal) ? '0.00' : subtotal.toFixed(2)}</td>
    </tr>
    <tr class="summary-row">
        <td colspan="2"></td>
        <td class="summary-label">GST (2%):</td>
        <td class="summary-value">₹${isNaN(gst) ? '0.00' : gst.toFixed(2)}</td>
    </tr>
    <tr class="summary-row total">
        <td colspan="2"></td>
        <td class="summary-label"><strong>Total:</strong></td>
        <td class="summary-value"><strong>₹${isNaN(total) ? '0.00' : total.toFixed(2)}</strong></td>
    </tr>
`;

    // Update cart count in header if it exists
    const cartCount = document.getElementById('cart-count');
    if (cartCount) {
        cartCount.textContent = cart.reduce((total, item) => total + item.quantity, 0);
    }
}

// Function to calculate GST
function calculateGST(subtotal) {
    const GST_RATE = 0.02; // 2% GST
    return subtotal * GST_RATE;
}

// Function to update quantity
function updateQuantity(productId, newQuantity) {
    newQuantity = parseInt(newQuantity);
    if (newQuantity < 1) {
        removeFromCart(productId);
        return;
    }
    
    const item = cart.find(item => item.id === productId);
    if (item) {
        item.quantity = newQuantity;
        saveCart();
        updateCartDisplay();
    }
}

// Function to remove item from cart
function removeFromCart(productId) {
    cart = cart.filter(item => item.id !== productId);
    saveCart();
    updateCartDisplay();
    showNotification('Item removed from cart');
}

// Save cart to localStorage
function saveCart() {
    localStorage.setItem('cart', JSON.stringify(cart));
}

// Load cart from localStorage
function loadCart() {
    try {
        const savedCart = localStorage.getItem('cart');
        if (savedCart) {
            cart = JSON.parse(savedCart);
            updateCartDisplay();
        }
    } catch (error) {
        console.error("Failed to load cart:", error);
        cart = [];
    }
}

// Show notification
function showNotification(message) {
    const notification = document.createElement('div');
    notification.className = 'notification';
    notification.textContent = message;
    document.body.appendChild(notification);

    setTimeout(() => {
        notification.remove();
    }, 3000);
}

// Event Listeners
document.addEventListener('DOMContentLoaded', () => {
    loadCart();

    // Event delegation for remove buttons
    document.addEventListener('click', function(event) {
        if (event.target.classList.contains('remove-item')) {
            event.preventDefault();
            const productId = parseInt(event.target.dataset.id);
            removeFromCart(productId);
        }
    });

    // Event delegation for quantity inputs
    document.addEventListener('change', function(event) {
        if (event.target.classList.contains('item-quantity')) {
            const productId = parseInt(event.target.dataset.id);
            const newQuantity = parseInt(event.target.value);
            if (newQuantity > 0) {
                updateQuantity(productId, newQuantity);
            } else {
                event.target.value = 1;
                updateQuantity(productId, 1);
            }
        }
    });
});

// Export functions if using modules
if (typeof module !== 'undefined' && module.exports) {
    module.exports = {
        addToCart,
        removeFromCart,
        updateQuantity,
        cart
    };
}

document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('addressForm');
    
    // Phone number validation
    const phoneInput = document.querySelector('input[name="phone"]');
    phoneInput.addEventListener('input', function() {
        if (this.validity.patternMismatch) {
            this.setCustomValidity('Please enter a valid 10-digit phone number');
        } else {
            this.setCustomValidity('');
        }
    });

    // PIN code validation
    const pincodeInput = document.querySelector('input[name="pincode"]');
    pincodeInput.addEventListener('input', function() {
        if (this.validity.patternMismatch) {
            this.setCustomValidity('Please enter a valid 6-digit PIN code');
        } else {
            this.setCustomValidity('');
        }
    });

    // Form submission
    form.addEventListener('submit', function(e) {
        e.preventDefault();
        // Add your payment gateway redirect logic here
        console.log('Proceeding to payment...');
    });
});
document.getElementById('proceedToCheckout').addEventListener('click', function (e) {
	e.preventDefault();

	    // Fetch the cart items from localStorage
	    const cartItems = JSON.parse(localStorage.getItem('cart')) || [];
	    console.log('Cart Items before checkout:', cartItems); // Debugging

	    if (cartItems.length > 0) {
	        localStorage.setItem('cartItems', JSON.stringify(cartItems));
	        console.log('Cart data stored successfully:', localStorage.getItem('cartItems'));
	        window.location.href = 'checkout.html';
	    } else {
	        alert('Your cart is empty!');
	    }

});





// Add this to ensure cart loads when the page loads
document.addEventListener('DOMContentLoaded', function() {
    loadCart();
    console.log('Cart loaded:', cart);
});