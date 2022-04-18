<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<h1>${cartItems[0].shoppingCart.user.username}'s Shopping Cart</h1>

<script>
    var totalz = 0;
    var pricez = 0;
    var quantz = 0;
</script>

<c:forEach items="${cartItems}" var="item">

<%--    <b>Complete Product: ${item.product}</b>--%>

<%--    <p>Username: ${item.shoppingCart.user.username}</p>--%>
    <p>Name: ${item.product.name}</p>
    <p>Name: ${item.product.description}</p>

    <c:choose>
        <c:when test="${item.product.sale == 0}">
            <p>Price: $${item.product.price}.00</p>
        </c:when>
        <c:otherwise>
            <b>On sale!</b>
            <p>Price: $${item.product.sale}.00</p>
        </c:otherwise>
    </c:choose>

    <p>Quantity: ${item.quantity}</p>
    <p>Total: $${item.quantity * item.product.price}.00</p>

    <script>

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
    <hr>

</c:forEach>

<script>
    // var totalz = 1;
</script>

    <h2 >"TOTAL AMOUNT DUE: " <script type="text/javascript">
        document.write("$"+totalz+".00")
    </script></h2>

<jsp:include page="../include/footer.jsp"/>
