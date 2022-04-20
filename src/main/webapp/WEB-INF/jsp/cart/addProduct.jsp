<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/cartHeader.jsp"/>



<div class="card" style="width: 25rem; margin: 0 auto; float: none; margin-bottom: 100px; background: #d7e4ef">
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

    <div class="form-group card-body">
        <label for="nameId">Name: </label>
        <br>
        <input type="text" name="name" id="nameId" aria-describedby="nameHelp" placeholder="Enter name" value="${form.name}">
        <small id="emailHelp" class="form-text text-muted">Product Name</small>
    </div>
    <c:forEach items="${bindingResult.getFieldErrors('name')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
    </c:forEach>

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

    <div class="form-group card-body">
        <label for="descriptionId">Description: </label>
        <br>
        <input type="text" name="description" id="descriptionId" aria-describedby="descriptionHelp" placeholder="Enter description" value="${form.description}">
        <small id="descriptionHelp" class="form-text text-muted">Please enter your description</small>
    </div>
    <c:forEach items="${bindingResult.getFieldErrors('description')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
    </c:forEach>

    <div class="form-group card-body">
        <label for="priceId">Price: </label>
        <br>
        <input type="number" name="price" min="0" id="priceId" aria-describedby="ageHelp" placeholder="Enter price" value="${form.price}">
        <small id="priceHelp" class="form-text text-muted">Please enter the price in whole dollars</small>
    </div>
    <c:forEach items="${bindingResult.getFieldErrors('price')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
    </c:forEach>

    <div class="form-group card-body">
        <label for="saleId">Sale Price: </label>
        <br>
        <input type="number" name="sale" min="0" id="saleId" aria-describedby="ageHelp" placeholder="Enter sale" value="${form.sale}">
        <small id="saleHelp" class="form-text text-muted">If on sale, enter discounted price here</small>
    </div>
    <c:forEach items="${bindingResult.getFieldErrors('sale')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
    </c:forEach>

    <div class="form-group card-body">
        <label for="imageId">Image: </label>
        <br>
        <input type="text" name="image" id="imageId" aria-describedby="sexHelp" placeholder="Enter image" value="${form.image}">
        <small id="imageHelp" class="form-text text-muted">Please enter the image</small>
    </div>
    <c:forEach items="${bindingResult.getFieldErrors('image')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
    </c:forEach>

    <%--    <br>--%>
    <%--    Check Box<input type="checkbox" name="checkbox">--%>
    <%--    <br>--%>

    <div class="container">
        <div class="row">
            <div class="col text-center">
                <button style="background: #8f8f8f" class="btn btn-outline-dark mt-auto card-body" type="submit">Submit</button>
            </div>
        </div>
    </div>

</form>
</div>

<jsp:include page="../include/footer.jsp"/>