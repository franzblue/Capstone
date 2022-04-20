<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<c:choose>

    <c:when test = "${empty form.id}">
        <h1>Add Animal</h1>
    </c:when>

    <c:when test = "${not empty form.id}">
        <h1>Edit Animal</h1>
    </c:when>

<%--    <form>--%>

<%--        <div class="form-group">--%>
<%--            <label for="exampleInputPassword1">Password</label>--%>
<%--            <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">--%>
<%--        </div>--%>
<%--        <div class="form-check">--%>
<%--            <input type="checkbox" class="form-check-input" id="exampleCheck1">--%>
<%--            <label class="form-check-label" for="exampleCheck1">Check me out</label>--%>
<%--        </div>--%>
<%--        <button type="submit" class="btn btn-primary">Submit</button>--%>
<%--    </form>--%>


</c:choose>

<form action="/animal/addAnimalSubmit" method="post">


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
    <div class="input-group mb-3">
        <div class="input-group-prepend">
            <label class="input-group-text" for="speciesId">Species</label>
        </div>
        <select class="custom-select" name="species" id="speciesId" value="${form.species}">
            <option selected>Choose...</option>
            <option value="dog">Dog</option>
            <option value="cat">Cat</option>
            <option value="small">Other Animals</option>
        </select>
        <c:forEach items="${bindingResult.getFieldErrors('species')}" var="error">
            <div style="color: red;">
                    ${error.getDefaultMessage()}
            </div>
        </c:forEach>
    </div>
<%--    <br>--%>
<%--    Species <input type="text" name="species" id="speciesId" value="${form.species}">--%>
<%--    <c:forEach items="${bindingResult.getFieldErrors('species')}" var="error">--%>
<%--        <div style="color: red;">--%>
<%--                ${error.getDefaultMessage()}--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
    <br>
    <div class="form-group">
        <label for="nameId">Breed </label>
        <input type="text" name="breed" id="breedId" aria-describedby="breedHelp" placeholder="Enter breed" value="${form.breed}">
        <small id="breedHelp" class="form-text text-muted">Please enter specific breed details</small>
    </div>
    <c:forEach items="${bindingResult.getFieldErrors('breed')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
    </c:forEach>
    <br>

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
        <label for="ageId">Age </label>
        <input type="number" name="age" id="ageId" aria-describedby="ageHelp" placeholder="Enter age" value="${form.age}">
        <small id="ageHelp" class="form-text text-muted">Please enter the age</small>
    </div>
    <c:forEach items="${bindingResult.getFieldErrors('age')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
    </c:forEach>
    <br>

        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <label class="input-group-text" for="sexId">Sex </label>
            </div>
            <select class="custom-select" name="sex" id="sexId" value="${form.sex}">
                <option selected>Choose...</option>
                <option value="Female">Female</option>
                <option value="Male">Male</option>
            </select>
            <c:forEach items="${bindingResult.getFieldErrors('sex')}" var="error">
            <div style="color: red;">
                    ${error.getDefaultMessage()}
            </div>
            </c:forEach>
        </div>






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
