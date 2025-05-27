document.addEventListener("DOMContentLoaded", function () {
    console.log("JS Loaded Successfully!");

    // Select all edit buttons
    document.querySelectorAll(".edit-button").forEach(button => {
        button.addEventListener("click", function () {
            console.log("Edit button clicked");
            const section = this.closest(".settings-section");
            const modal = section.querySelector(".edit-form-modal");
            if (modal) {
                modal.style.display = "block";
            } else {
                console.error("Modal not found!");
            }
        });
    });

    // Select all close buttons
    document.querySelectorAll(".close-button").forEach(button => {
        button.addEventListener("click", function () {
            const modal = this.closest(".edit-form-modal");
            modal.style.display = "none";
        });
    });

    // Close modal when clicking outside
    window.addEventListener("click", function (event) {
        document.querySelectorAll(".edit-form-modal").forEach(modal => {
            if (event.target === modal) {
                modal.style.display = "none";
            }
        });
    });

    console.log("All event listeners added!");
});
