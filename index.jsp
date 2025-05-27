<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sports Ecommerce Website Design</title>
    <link rel="stylesheet" href="/Sports_Ecommerce/Working_Copy/assets/css/style.css"/>
    <link rel="stylesheet" href="./assets/css/sign-in.css" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,300;0,400;0,500;0,600;0,700;1,200&display=swap" rel="stylesheet"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"/>

<script src="/Sports_Ecommerce/Working_Copy/assets/js/search.js"></script>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setHeader("Expires", "0"); // Proxies
    
    if (session.getAttribute("userId") == null) {
        response.sendRedirect("/Sports_Ecommerce/Working_Copy/index.html"); // Redirect to index.html if not logged in
    }
%>

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
                <input type="text" id="searchBox" placeholder="Search for products..." autocomplete="off">
				<div id="searchResults" class="search-results"></div>
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
              <li><a href="sports.html">Sports</a></li>
              <li><a href="accessories.html">Accessories</a></li>
              <!-- Dropdown Menu -->
              <div class="dropdown">
               <% 
               String firstName = (String) session.getAttribute("firstName");
               %> 
               
               
               <a href="#" class="dropdown-button"> Hi, <%=firstName %></a>
                <ul class="dropdown-content">
                    <li><a href="home.jsp">My Account</a></li>
                   <!--   <li><a href="#">Wishlist</a></li>
                    <li><a href="#">Check Order</a></li>-->
                    <li><a href="/Sports_Ecommerce/logoutServlet">Logout</a></li>
                   
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
        

        <div class="row">
          <div class="col-2">
            <h1>
            Gear Up for Victory!
            </h1>
            <h4>
              Discover top-quality sports apparel, equipment and accessories designed to elevate your performance.</p><br>Stay ahead of the game
            </h4>
            <a href="" class="btn">Explore Now &#8594;</a>
          </div>
          <div class="col-2">
            <img src="./assets/images/image1.png" alt="" />
          </div>
        </div>
      </div>
    </div>
    <!----- Featurd Categories--------->
    <div class="categories">
      <div class="small-container">
        <div class="row">
          <div class="col-3">
            <a href="ws7.html">
            <img src="images/Speedcat.jpg" alt="Speedcat.jpg" />
            <br><h3>SPEEDCAT</h3>
          </a>
          </div>
          <div class="col-3">
            <a href="ws8.html">
            <img src="images/palmero.jpg" alt="Palmero.jpg" />
            <br><h3>PALERMO</h3>
          </a>
          </div>
          <div class="col-3">
            <a href="pro-details6.html">
            <img src="images/Easy Rider.jpg" alt="Easy Rider.jpg" />
            <br><h3>EASY RIDER</h3>
          </a>
          </div>
        </div>
      </div>
    </div>
    <!----- Featurd Products--------->
    <div class="small-container">
      <h2 class="title">GEAR UP</h2>
      <div class="row">
        <div class="col-4">
            <a href="pro-details7.html">
            <img src="images/run.jpg" alt="run.jpg"/>
          </a>
        </div>

        <div class="col-4">
          <a href="dumbbell.html">
          <img src="images/train.jpg" alt="train.jpg"/>
          </a>
        </div>

        <div class="col-4">
          <a href="sp3.html">
          <img src="images/basketball.jpg" alt="basketball.jpg"/>
        </a>
     
        </div>
        <div class="col-4">
          <a href="sp5.html">
          <img src="images/football.jpg" alt="football.jpg"/>
        </a>
        </div>
        <!-- <div class="col-4">
          <img src="images/studio.jpg" alt="studio.jpg"/>
          
        </div> -->
      </div>
      <h2 class="title">Latest Products</h2>
	<div class="row">
        <div class="col-4">
          <a href="ws3.html">
            <img src="images/ws3.avif" class="product-img" alt="Varion II Unisex Indoor Sports Shoes" />
          </a>
          <br><h4>Varion II Unisex Indoor Sports Shoes</h4>
          <div class="rating">
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star-half-o"></i>
          </div>
          <p><h3>₹599</h3></p>
        </div>

        <div class="col-4">
          <a href="ms9.html">
            <img src="images/ms9.avif" class="product-img" alt="TEENAGE MUTANT NINJA TURTLES MensFit Graphic Tee" />
          </a>
          <br><h4>TEENAGE NINJA TURTLES MensFit Tee</h4>
          <div class="rating">
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
          </div>
          <p><h3>₹500</h3></p>
        </div>

        <div class="col-4">
          <a href="ac5.html">
            <img src="images/ac5.avif" class="product-img" alt="Sports Quarter Unisex Socks Pack of 3" />
          </a>
          <h4>Sports Quarter Unisex Socks Pack of 3</h4>
          <div class="rating">
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
          </div>
          <p><h3>₹150</h3></p>
        </div>

        <div class="col-4">
          <a href="sp3.html">
            <img src="images/sp3.jpg" class="product-img" alt="Cosco Dribble S-7 Basketball" />
          </a>
          <h4>Cosco Dribble S-7 Basketball</h4>
          <div class="rating">
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
            <i class="fa fa-star"></i>
          </div>
          <p><h3>₹599</h3></p>
        </div>
      </div>
	<div class="row">
      <div class="col-4">
        <a href="ac3.html">
          <img src="images/ac3.avif" class="product-img" alt="PUMA City Unisex Backpack" />
        </a>
        <h4>PUMA City Unisex Backpack</h4>
        <div class="rating">
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star-half-o"></i>
        </div>
        <p><h3>₹800</h3></p>
      </div>

      <div class="col-4">
        <a href="pro-details3.html">
          <img src="images/shoe3.avif" class="product-img" alt="Skyrocket Lite Unisex Running Shoes" />
        </a>
        <h4>Skyrocket Lite Unisex Running Shoes</h4>
        <div class="rating">
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star-half-o"></i>
        </div>
        <p><h3>₹2,349</h3></p>
      </div>

      <div class="col-4">
        <a href="ws2.html">
          <img src="images/ws2.avif" class="product-img" alt="Genetics Unisex Basketball Shoes" />
        </a>
        <h4>Genetics Unisex Basketball Shoes</h4>
        <div class="rating">
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star-half-o"></i>
        </div>
        <p><h3>₹200</h3></p>
      </div>

      <div class="col-4">
        <a href="shirtg3.html">
          <img src="images/sh3.avif" class="product-img" alt="Women's Polo T-shirt" />
        </a>
        <h4>Women's Polo T-shirt</h4>
        <div class="rating">
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star"></i>
          <i class="fa fa-star-half-o"></i>
        </div>
        <p><h3>₹250</h3></p>
      </div>
      </div>
    </div>

    <!-------- Offer --------->
<div class="offer">
      <div class="small-container">
        <div class="row">
          <div class="col-2">
            <a href="ac1.html"><img src="./assets/images/exclusive.png" class="offer-img" alt="" /></a>
          </div>
          <div class="col-2">
            <b>Exclusively available on our Store</b>
            <h1>Smart Band 4</h1>
            <h4
              >From steps to sleep, track every aspect of your well-being with the Smart Band 4.
          </h4><br>
            <a href="ac1.html" class="btn">Shop Now &#8594;</a>
          </div>
        </div>
      </div>
    </div>

    <!------ Testimonial  ------>
   <!-- <div class="testimonial">
      <div class="small-container">
        <div class="row">
          <div class="col-3">
            <i class="fa fa-quote-left"></i>

            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea, esse
              quae ex sequi praesentium fuga voluptatem placeat voluptates odio
              rerum.
            </p>
            <div class="rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star-o"></i>
            </div>
            <img src="./assets/images/user-1.png" alt="" />
            <h3>Sean Parker</h3>
          </div>

          <div class="col-3">
            <i class="fa fa-quote-left"></i>

            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea, esse
              quae ex sequi praesentium fuga voluptatem placeat voluptates odio
              rerum.
            </p>
            <div class="rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star-o"></i>
            </div>
            <img src="./assets/images/user-2.png" alt="" />
            <h3>Michel Joe</h3>
          </div>

          <div class="col-3">
            <i class="fa fa-quote-left"></i>

            <p>
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Ea, esse
              quae ex sequi praesentium fuga voluptatem placeat voluptates odio
              rerum.
            </p>
            <div class="rating">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star-o"></i>
            </div>
            <img src="./assets/images/user-3.png" alt="" />
            <h3>Kaily Jenner</h3>
          </div>
        </div>
      </div>
    </div>

    <!-- Brands

    <div class="brands">
      <div class="small-container">
        <div class="row">
          <div class="col-5">
            <img src="./assets/images/logo-godrej.png" alt="" />
          </div>
          <div class="col-5">
            <img src="./assets/images/logo-oppo.png" alt="" />
          </div>
          <div class="col-5">
            <img src="./assets/images/logo-paypal.png" alt="" />
          </div>
          <div class="col-5">
            <img src="./assets/images/logo-philips.png" alt="" />
          </div>
          <div class="col-5">
            <img src="./assets/images/logo-coca-cola.png" alt="" />
          </div>
        </div>
      </div>
    </div> --> 

    <!-- Footer -->
    <div class="footer">
      <div class="container">
        <div class="row">
          <div class="footer-col-1">
            <h3>Support</h3>
            <ul>
              <li>Contact us</li>
              <li>Track Order</li>
              <li><a href="shoecare.html">Shoe Care</a></li>
              <li>Promotions & Sale</li>
              <li>Initiate Return / Exchange</li>
              <li>Cookies Settings</li>
            </ul>
          </div>
          <!--<div class="footer-col-2">
            <img src="./assets/images/logo-white.png" alt="" />
            <p>
              Lorem, ipsum dolor sit amet consectetur <br />adipisicing elit.
              Porro, eum?
            </p>
          </div>-->
          <div class="footer-col-1">
            <h3>About Us</h3>
            <ul>
              <li>Who we are</li>
              <li>Comapany</li>
              <li>Made in India</li>
              <li>Investors</li>
              <li>Coporate News</li>
              <li>Careers</li>
            </ul>
          </div>

              <div class="footer-col-3">
                <h3>Stay up to date</h3>
                <div class="social-icons">
                    <a href="https://www.youtube.com" target="_blank">
                        <i class="fab fa-youtube"></i>
                    </a>
                    <a href="https://www.instagram.com" target="_blank">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a href="https://www.facebook.com" target="_blank">
                        <i class="fab fa-facebook"></i>
                    </a>
                    <a href="https://www.whatsapp.com" target="_blank">
                        <i class="fab fa-whatsapp"></i>
                    </a>
                </div>
            </div>
          </div>
        </div>
        <hr />
        <p style="text-align: center;">&copy; 2024 Sports Gear - All rights reserved.</p>
        <div class="payment-options">
          <p style="text-align: center;">Safe Payment Options: <span> Debit Card</span> | <span>Credit Card</span> | <span>Net Banking</span> | <span>UPI</span></p>
      </div>
      </div>
    </div>
    
    <!-- scripts -->
    <script src="../assets/js/toggleMenu.js"></script>
   	
  </body>
</html>

  