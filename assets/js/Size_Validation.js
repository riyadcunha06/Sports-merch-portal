// Get the form elements
const sizeSelect = document.querySelector('select[name="size"]');  // Adjust selector based on your select element's name
const addToCartBtn = document.querySelector('.Add to Cart');  // Adjust selector based on your button's class
const quantityInput = document.querySelector('input[type="number"]');  // For quantity if needed

// Add click event listener to the Add to Cart button
addToCartBtn.addEventListener('click', function(e) {
    e.preventDefault();  // Prevent form submission
    
    // Check if size is selected
    if (sizeSelect.value === '' || sizeSelect.value === 'Select Size') {
        alert('Please select a size before adding to cart');
        return false;
    }
    
    // If size is selected, proceed with form submission
    // You can either submit the form or make an AJAX call to your servlet
    document.getElementById('addToCartForm').submit();  // Adjust based on your form ID
});
