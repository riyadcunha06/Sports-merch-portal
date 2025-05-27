// Function to open the address form modal
function openAddressForm() {
    console.log("Opening modal..."); // Debugging log
    var modal = document.getElementById("addressFormModal");
    if (modal) {
        modal.style.display = "block";
    } else {
        console.error("Modal element not found!");
    }
}

// Function to close the address form modal
function closeAddressForm() {
    console.log("Closing modal..."); // Debugging log
    var modal = document.getElementById("addressFormModal");
    if (modal) {
        modal.style.display = "none";
    } else {
        console.error("Modal element not found!");
    }
}

// Close modal when clicking outside
window.onclick = function (event) {
    var modal = document.getElementById("addressFormModal");
    if (event.target === modal) {
        closeAddressForm();
    }
};
document.addEventListener("DOMContentLoaded", function () {
    closeAddressForm(); // Ensures modal is closed on page load
});

function closeAddressForm() {
    var modal = document.getElementById("addressFormModal");
    if (modal) {
        modal.style.opacity = "0";
        modal.style.visibility = "hidden";
        setTimeout(() => {
            modal.style.display = "none";
        }, 300); // Matches CSS transition time
        document.body.style.overflow = "auto";
    }
}

function openAddressForm() {
    var modal = document.getElementById("addressFormModal");
    if (modal) {
        modal.style.display = "flex";
        setTimeout(() => {
            modal.style.opacity = "1";
            modal.style.visibility = "visible";
        }, 10);
        document.body.style.overflow = "hidden";
    }
}
