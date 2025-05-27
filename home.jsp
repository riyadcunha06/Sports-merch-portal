<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Red store | Ecommerce Website Design</title>
    <link rel="stylesheet" href="./assets/css/style.css" />
    <link rel="stylesheet" href="./assets/css/sign-in.css" />
    <link rel="stylesheet" href="./assets/css/home.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,200&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>

  </head>

  <body>
    <div class="header">
      <div class="container">
       
        <div class="navbar">
          <div class="logo">
            <a href="index.html">
              <img src="./assets/images/logo.png" alt="Logo" width="125px" />
            </a>
          </div>
          <nav>
            <ul id="MenuItems">
              <!-- Search Box -->
              <li class="search-box">
                <input type="text" placeholder="Search for products..." />
              </li>
              <!-- Menu Links -->
              <li><a href="index.html">Home</a></li>
              <li class="dropdown">
                <a href="women.html">Women</a>
                <ul class="dropdown-menu">
                    <li><a href="women-shoes.html">Shoes</a></li>
                    <li><a href="women.html">Clothing</a></li>
                </ul>
            </li>
              <!--<li><a href="men.html">Men</a></li>-->
              <li class="dropdown">
                <a href="men.html">Men</a>
                <ul class="dropdown-menu">
                    <li><a href="men.html">Shoes</a></li>
                    <li><a href="men-clothing.html">Clothing</a></li>
                </ul>
            </li>
              <li><a href="kids.html">Kids</a></li>
              <li><a href="accessories.html">Accessories</a></li>
              <!-- Dropdown Menu -->
              <div class="dropdown">
                <% 
               String firstName = (String) session.getAttribute("firstName");
               %> 
                <a href="#" class="dropdown-button"> Hi, <%=firstName %></a>
                <ul class="dropdown-content">
                    <li><a href="#">My Account</a></li>
                   <!--   <li><a href="#">Wishlist</a></li>
                    <li><a href="#">Check Order</a></li>
                    <li><a href="#">Store Finder</a></li>
                    <li><div class="separator"></div></li>
                    <li><a href="#">Language EN 🇮🇳</span></a></li>-->
                    <li><div class="separator"></div></li>
                    <li><a href="account.html" class="login-link">LOGIN</a></li>
                    <li><a href="#" class="join-us-link">JOIN US</a></li>
                </ul>
            </div>
            
          </nav>
          <a href="cart.html">
            <img src="./assets/images/cart.png" alt="Cart" width="30px" height="30px" />
          </a>
          <img 
            src="./assets/images/menu.png"
            alt="Menu Icon"
            class="menu-icon"
            onclick="menutoggle()" 
          />
        </div>
        <div class="account-container">
            <!-- Left Sidebar -->
            <div class="sidebar">
                <nav>
                    <ul>
                        <li class="active"><a href="#"><i class="fas fa-user"></i> Account Overview</a></li>
                       <!--   <li><a href="my-orders.html"><i class="fas fa-box"></i> My Orders</a></li>
                        <li><a href="#"><i class="fas fa-heart"></i> Wishlist</a></li>-->
                        <li><a href="address.html"><i class="fas fa-address-book"></i> Addresses</a></li>
                        <li><a href="settings.html"><i class="fas fa-cog"></i> Account Settings</a></li>
                    </ul>
                </nav>
                <div class="help-section">
                    <h3>Need Help?</h3>
                    <a href="#" class="logout-btn">LOGOUT</a>
                </div>
            </div>
        
            <!-- Main Content -->
            <div class="main-content">
                <h1>Hello, <span class="username"><%=firstName %></span></h1>
                <h2>Account Overview</h2>
        
                <!-- Feature Boxes -->
                <div class="feature-boxes">
                    <!-- Instead of App Download, you could have: -->
                    <div class="feature-box">
                        <h3>Quick Shopping Guide</h3>
                        <p>Browse our curated collections and get personalized recommendations</p>
                        <button class="primary-btn" onclick="window.location.href='index.html'">Explore Now</button>
                    </div>
        
                    <!-- FAQ Section -->
                    <div class="feature-box dark">
                        <h3>Need Assistance?</h3>
                        <p>Check our help center or contact support</p><br>
                        <button class="primary-btn"onclick="window.location.href='faq.html'">View FAQ</button>
                    </div>
                </div>
        
                <!-- Trending Section -->
                <section class="trending"><br><br>
                    <h2>TOP TRENDING</h2>
                    <div class="product-grid">
                        <!-- Product cards here -->
                        <div class="shoe-item">
                            <div class="discount-badge">-30%</div>
                            <a href="pro-details.html"><img src="images/shoe1.jpg" alt="UltraRide ProFoam Men's Running Shoes"></a>
                            <h3>UltraRide ProFoam Men's Running Shoes</h3>
                            <p class="product-price">
                                <span class="current-price">₹4,319</span>
                                <span class="original-price">₹5,548</span>
                            </p>
                            <button class="addtocart-btn" onclick="addToCart({
                                id: 1,
                                name: 'UltraRide ProFoam Mens Running Shoes',
                                price: 4319,
                                img: 'images/shoe1.jpg'
                            })">Add to Cart</button>
                        </div>
                        <!-- Repeat for other shoe items -->
                        <div class="shoe-item">
                            <div class="discount-badge">-20%</div>
                            <a href="pro-details2.html"><img src="images/shoe2.avif" alt="Skyrocket Lite Unisex Running Shoes"></a>
                            <h3>Skyrocket Lite Unisex Running Shoes</h3>
                            <p class="product-price">
                                <span class="current-price">₹2,999</span>
                                <span class="original-price">₹3,749</span>
                            </p>
                            <button class="addtocart-btn" onclick="addToCart({
                                id: 2,
                                name: 'Skyrocket Lite Unisex Running Shoes',
                                price: 2999,
                                img: 'images/shoe2.avif'
                            })">Add to Cart</button>
                        </div>
                        <div class="shoe-item">
                            <div class="discount-badge">-30%</div>
                            <a href="pro-details15.html"><img src="images/shoe15.jpg" alt="UltraRide ProFoam Men's Running Shoes"></a>
                            <h3>UltraRide ProFoam Men's Running Shoes</h3>
                            <p class="product-price">
                                <span class="current-price">₹7,999</span>
                                <span class="original-price">₹8,849</span>
                            </p>
                            <button class="addtocart-btn" onclick="addToCart({
                                id: 15,
                                name: 'Conduct Pro Unisex Running Shoes',
                                price: 7999,
                                img: 'images/shoe15.jpg'
                            })">Add to Cart</button>
                        </div>
                        <div class="shoe-item">
                            <div class="discount-badge">-20%</div>
                            <a href="pro-details7.html"><img src="images/shoe7.jpg" alt="Darter Pro Fade Unisex Running Shoes"></a>
                            <h3>Darter Pro Fade Unisex Running Shoes</h3>
                            <p class="product-price">
                                <span class="current-price">₹5,999</span>
                                <span class="original-price">₹7,500</span>
                            </p>
                            <button class="addtocart-btn" onclick="addToCart({
                                id: 14,
                                name: 'Darter Pro Fade Unisex Running Shoes',
                                price: 5999,
                                img: 'images/shoe7.jpg'
                            })">Add to Cart</button>
                        </div>
                        <div class="shoe-item">
                            <div class="discount-badge">-10%</div>
                            <a href="pro-details9.html"><img src="images/shoe9.jpg" alt="Deviate NITRO™ 2 Men's Running Shoes"></a>
                            <h3>Deviate NITRO™ 2 Men's Running Shoes</h3>
                            <p class="product-price">
                                <span class="current-price">₹11,199</span>
                                <span class="original-price">₹12,500</span>
                            </p>
                            <button class="addtocart-btn" onclick="addToCart({
                              id: 9, 
                              name: 'Deviate NITRO™ 2 Mens Running Shoes', 
                              price: 11199, 
                              img: 'images/shoe9.jpg'
                            })">Add to Cart</button>
                          </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
<!-- JS for Toggle menu -->
<script src="assets/js/cart.js"></script>
  </body>    
  </html>