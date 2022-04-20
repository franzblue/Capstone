<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/cartHeader.jsp"/>

<c:choose>

    <c:when test = "${empty form.id}">
        <h1>Add Product</h1>
    </c:when>

    <c:when test = "${not empty form.id}">
        <h1>Edit Product</h1>
    </c:when>

</c:choose>


<form action="/cart/addProductSubmit" method="post">


    <input type="hidden" name="id" value="${form.id}">

    <div class="form-group">
        <label for="nameId">Name </label>
        <input type="text" name="name" id="nameId" aria-describedby="nameHelp" placeholder="Enter name" value="${form.name}">
        <%--        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
    </div>
    <c:forEach items="${bindingResult.getFieldErrors('name')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
    </c:forEach>


    <br>
<%--    <div class="form-group">--%>
<%--        <label for="nameId">Description </label>--%>
<%--        <input type="text" name="desription" id="descriptionId" aria-describedby="descriptionHelp" placeholder="Enter description" value="${form.description}">--%>
<%--        <small id="breedHelp" class="form-text text-muted">Please enter specific breed details</small>--%>
<%--    </div>--%>
<%--    <c:forEach items="${bindingResult.getFieldErrors('description')}" var="error">--%>
<%--        <div style="color: red;">--%>
<%--                ${error.getDefaultMessage()}--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
<%--    <br>--%>

    <br>
    <div class="form-group">
        <label for="descriptionId">Description </label>
        <input type="text" name="description" id="descriptionId" aria-describedby="descriptionHelp" placeholder="Enter description" value="${form.description}">
        <small id="descriptionHelp" class="form-text text-muted">Please enter your description</small>
    </div>
    <c:forEach items="${bindingResult.getFieldErrors('description')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
    </c:forEach>
    <br>

    <div class="form-group">
        <label for="priceId">Price </label>
        <input type="number" name="price" id="priceId" aria-describedby="ageHelp" placeholder="Enter price" value="${form.price}">
        <small id="priceHelp" class="form-text text-muted">Please enter the price</small>
    </div>
    <c:forEach items="${bindingResult.getFieldErrors('price')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
    </c:forEach>
    <br>

    <div class="form-group">
        <label for="saleId">Sale Price </label>
        <input type="number" name="sale" id="saleId" aria-describedby="ageHelp" placeholder="Enter sale" value="${form.sale}">
        <small id="saleHelp" class="form-text text-muted">If on sale, enter new price</small>
    </div>
    <c:forEach items="${bindingResult.getFieldErrors('sale')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
    </c:forEach>
    <br>






    <br>


    <div class="form-group">
        <label for="imageId">Image </label>
        <input type="text" name="image" id="imageId" aria-describedby="sexHelp" placeholder="Enter image" value="${form.image}">
        <small id="imageHelp" class="form-text text-muted">Please enter the image</small>
    </div>
    <c:forEach items="${bindingResult.getFieldErrors('image')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
    </c:forEach>
    <br>


    <br>
    <%--    <br>--%>
    <%--    Check Box<input type="checkbox" name="checkbox">--%>
    <%--    <br>--%>

    <br>
    <button type="submit">Submit</button>

</form>

<jsp:include page="../include/footer.jsp"/>