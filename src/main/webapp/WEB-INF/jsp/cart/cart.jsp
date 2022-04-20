<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/cartHeader.jsp"/>

<script>
    var totalz = 0;
    var pricez = 0;
    var quantz = 0;
</script>
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">

        <c:if test="${empty cartItems[0].shoppingCart.user.username}">
            <h1>$Your Cart Is Empty</h1>
            <h2 id="totalDue">TOTAL AMOUNT DUE: </h2>
        </c:if>
        <c:if test="${not empty cartItems[0].shoppingCart.user.username}">
            <h1>${cartItems[0].shoppingCart.user.username}'s Shopping Cart</h1>
            <h2 id="totalDue">TOTAL AMOUNT DUE: </h2>
            <p class="text-muted" style="display: flex; justify-content: center;">Please review items below.</p>
        </c:if>
        <hr>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-3 justify-content-center">

<c:forEach items="${cartItems}" var="item">

<%--    <b>Complete Product: ${item.product}</b>--%>

<%--    <p>Username: ${item.shoppingCart.user.username}</p>--%>
<%--    <p>Name: ${item.product.name}</p>--%>
<%--    <p>Name: ${item.product.description}</p>--%>

<%--    <c:choose>--%>
<%--        <c:when test="${item.product.sale == 0}">--%>
<%--            <p>Price: $${item.product.price}.00</p>--%>
<%--        </c:when>--%>
<%--        <c:otherwise>--%>
<%--            <b>On sale!</b>--%>
<%--            <p>Price: $${item.product.sale}.00</p>--%>
<%--        </c:otherwise>--%>
<%--    </c:choose>--%>

<%--    <p>Quantity: ${item.quantity}</p>--%>
<%--    <p>Total: $${item.quantity * item.product.price}.00</p>--%>

    <div class="col mb-5">
        <div class="card h-100">
        <img class="card-img-top" src="${item.product.image}" alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title">${item.product.name}</h5>
            <p class="card-text">${item.product.description}</p>
            <c:choose>
                <c:when test="${item.product.sale == 0}">
                    <p class="card-text">Price: $${item.product.price}.00</p>
                </c:when>
                <c:otherwise>
                    <b>On sale!</b>
                    <p class="card-text">Price: $${item.product.sale}.00</p>
                </c:otherwise>
            </c:choose>
            <p class="card-text">Quantity: ${item.quantity}</p>
        </div>

            <button class="btn btn-outline-danger mt-auto" onclick="removeFromCart(${item.id})" type="button">Remove From Cart</button>

        <div class="card-footer">
            <small class="text-muted">Item Total: $${item.quantity * item.product.price}.00</small>
        </div>
    </div>
    </div>

    <script>

        function removeFromCart(productId) {
            console.log("testing " + productId);
            $.ajax({
                type: "POST",
                url: "/cart/removeFromCart/",
                data: {"productId" : productId},
                success: function (response) {
                    $("body").html(response);
                },
                error: function (result) {
                    // do something.
                    console.log("remove from cart ?");
                }
            });
        }

        if(${item.product.sale == 0}){
            pricez = ${item.product.price};
            quantz = ${item.quantity};
        } else {
            pricez = ${item.product.sale};
            quantz = ${item.quantity};
        }

         totalz += this.pricez * this.quantz;

    </script>

<%--    <b>Complete User: ${item.shoppingCart.user}</b>--%>
<%--    <hr>--%>

</c:forEach>
        </div>
    </div>
</section>


<script type="text/javascript">
    document.querySelector("#totalDue").innerHTML+= "$"+totalz+".00";
</script>

<jsp:include page="../include/footer.jsp"/>
