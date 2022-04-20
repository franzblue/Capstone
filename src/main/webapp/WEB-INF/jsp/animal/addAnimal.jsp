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


<div class="card" style="width: 25rem;margin: 0 auto; float: none; margin-bottom: 10px;">
    <form action="/animal/addAnimalSubmit" method="post">
        <input type="hidden" name="id" value="${form.id}">


        <div class="form-group card-body">
            <label for="nameId">Name: </label>
            <br>
            <input type="text" name="name" id="nameId" aria-describedby="nameHelp" placeholder="Enter name" value="${form.name}">
            <%--        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
        </div>
        <c:forEach items="${bindingResult.getFieldErrors('name')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
        </c:forEach>

        <div class="form-group card-body">
            <label for="nameId">Breed: </label>
            <br>
            <input type="text" name="breed" id="breedId" aria-describedby="breedHelp" placeholder="Enter breed" value="${form.breed}">
            <small id="breedHelp" class="form-text text-muted">Please enter specific breed details</small>
        </div>
        <c:forEach items="${bindingResult.getFieldErrors('breed')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
        </c:forEach>

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
            <label for="ageId">Age: </label>
            <br>
            <input type="number" name="age" id="ageId" aria-describedby="ageHelp" placeholder="Enter age" value="${form.age}">
            <small id="ageHelp" class="form-text text-muted">Please enter the age</small>
        </div>
        <c:forEach items="${bindingResult.getFieldErrors('age')}" var="error">
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

        <div class="input-group mb-3 card-body">
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

        <div class="input-group mb-3 card-body">
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
        <%--    Check Box<input type="checkbox" name="checkbox">--%>
        <%--    <br>--%>

        <div class="container">
            <div class="row">
                <div class="col text-center">
                    <button class="btn btn-outline-dark mt-auto card-body" type="submit">Submit</button>
                </div>
            </div>
        </div>


        <%--    <ul class="list-group list-group-flush">--%>
        <%--        <li class="list-group-item">Age: ${animal.age}</li>--%>
        <%--        <li class="list-group-item">Sex: ${animal.sex}</li>--%>
        <%--        <li class="list-group-item"Breed: >${animal.breed}</li>--%>
        <%--    </ul>--%>
        <%--    <div class="card-body">--%>
        <%--        <a href="#" class="card-link">Contact Us</a>--%>
        <%--        <a href="#" class="card-link">Sign Up</a>--%>
        <%--    </div>--%>
</div>
</form>

<jsp:include page="../include/footer.jsp"/>
