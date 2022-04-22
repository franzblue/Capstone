<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<script>
    var qauntityValue;
    function changeValue(quantity) {
        quantityValue = document.getElementById(quantity).value;
        console.log(quantityValue, quantity);
    }

    function addToCart(productId, quantityValue) {
        if(quantityValue < 1) {
            alert("Please enter a positive quantity.");
            return null;
        }
        $.ajax({
            type: "POST",
            url: "/cart/addToCart/",
            data: {"productId" : productId, "quantityValue" : quantityValue},
            success: function (response) {
                if(quantityValue == 1) {
                    alert(quantityValue + " item added to cart!");
                } else {
                    alert(quantityValue + " items added to cart!");
                }
            },
            error: function (result) {
                // do something.
                console.log("product ?");
            }
        });
        $(document).ajaxStop(function(){
            window.location.reload();
        });
    }
</script>

<!-- Header-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Shop for your pet</h1>
            <p class="lead fw-normal text-white-50 mb-0">Everything a little critter needs.</p>
        </div>
    </div>
</header>
<!-- Section-->
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
           <c:forEach items="${products}" var="item">
               <div class="col mb-5">
                   <div class="card h-100">
                       <c:if test="${item.sale > 0}">
                           <!-- Sale badge-->
                           <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                       </c:if>
                       <!-- Product image-->
                       <img class="card-img-top" src="${item.image}" alt="..." />
                       <!-- Product details-->
                       <div class="card-body p-4">

                               <!-- Product name-->
                               <h5 class="fw-bolder">${item.name}</h5>

                               <!-- Product price-->
                               <c:if test="${item.sale > 0}">
                                   <span class="text-muted text-decoration-line-through">$${item.price}.00</span>
                                   <h6 class="fw-bolder">$${item.sale}.00</h6>
                               </c:if>
                                <c:if test="${item.sale == 0}">
                                    <h6 class="fw-bolder">$${item.price}.00</h6>
                                </c:if>
                               <!-- Product description-->
                               <p class="card-text">${item.description}</p>

                       </div>

                       <!-- Product actions-->
                       <div class="input-group mb-3 card-footer p-4 pt-0 border-top-0 bg-transparent">
                           <input type="number" placeholder="0" id="quantity${item.id}" min="1" onchange="changeValue('quantity${item.id}')" class="form-control">
                           <div class="input-group-append">
                               <button class="btn btn-outline-dark mt-auto" onclick="addToCart(${item.id}, quantityValue)" type="button">Add to Cart</button>
                           </div>
                       </div>

                   </div>
               </div>
           </c:forEach>
        </div>
    </div>
</section>

<jsp:include page="../include/footer.jsp"/>
