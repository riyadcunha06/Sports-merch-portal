/**
 * 
 */
console.log("Search script loaded successfully!");

document.addEventListener("DOMContentLoaded", function () {
    const searchInput = document.getElementById("searchBox");
    const resultsContainer = document.getElementById("searchResults");

    searchInput.addEventListener("input", function () {
        let query = searchInput.value.trim();
        if (query.length > 1) {  // Only search if input has more than 1 character
            fetch(`/Sports_Ecommerce/searchServlet?query=${query}`)
                .then(response => response.json())
                .then(data => {
                    resultsContainer.innerHTML = ""; // Clear previous results
                    if (data.length === 0) {
                        resultsContainer.innerHTML = "<p>No products found</p>";
                    } else {
                        data.forEach(product => {
                            let item = document.createElement("div");
                            item.classList.add("search-item");
                            item.innerHTML = `
                                <img src="${product.image_url}" alt="${product.name}" width="50">
                                <p>${product.name} & ₹${product.price}</p>
                            `;
                            item.addEventListener("click", function () {
                                window.location.href = `/Sports_Ecommerce/Working_Copy/${product.product_url}`;
                            });
                            resultsContainer.appendChild(item);
                        });
                    }
                })
                .catch(error => console.error("Error fetching search results:", error));
        } else {
            resultsContainer.innerHTML = ""; // Clear results if query is empty
        }
    });
});
