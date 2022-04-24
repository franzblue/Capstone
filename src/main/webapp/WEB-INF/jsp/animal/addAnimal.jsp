<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>


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


<div class="card" style="width: 25rem; margin: 0 auto; float: none; margin-bottom: 100px; background: #d7e4ef">
    <c:choose>

        <c:when test = "${empty form.id}">
            <h1>Add Animal</h1>
        </c:when>

        <c:when test = "${not empty form.id}">
            <h1>Edit Animal</h1>
        </c:when>

    </c:choose>
    <form action="/animal/addAnimalSubmit" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${form.id}">


        <div class="form-group card-body" style="margin-bottom: 0px; padding-top: 0px;">
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

        <div class="form-group card-body" style="margin-bottom: 0px; padding-top: 0px;">
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

        <div class="form-group card-body" style="margin-bottom: 0px; padding-top: 0px;">
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

        <div class="form-group card-body" style="margin-bottom: 0px; padding-top: 0px;">
            <label for="ageId">Age: </label>
            <br>
            <input type="number" name="age" min="0" id="ageId" aria-describedby="ageHelp" placeholder="Enter age" value="${form.age}">
            <small id="ageHelp" class="form-text text-muted">Please enter the age</small>
        </div>
        <c:forEach items="${bindingResult.getFieldErrors('age')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
        </c:forEach>

        <div class="form-group card-body" style="margin-bottom: 0px; padding-top: 0px;">
            <label for="imageId">Image: </label>
            <br>
            <input id="imageId" type="file" name="file">
            <small id="imageHelp" class="form-text text-muted">Please enter the image</small>
        </div>
        <c:forEach items="${bindingResult.getFieldErrors('image')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
        </c:forEach>

        <div class="input-group mb-3 card-body" style="margin-bottom: 0px; padding-top: 0px;">
            <div class="input-group-prepend">
                <label class="input-group-text" for="sexId">Sex </label>
            </div>
            <select class="custom-select" name="sex" id="sexId" value="${form.sex}">
                <option value="Female">Female</option>
                <option value="Male">Male</option>
            </select>
            <c:forEach items="${bindingResult.getFieldErrors('sex')}" var="error">
                <div style="color: red;">
                        ${error.getDefaultMessage()}
                </div>
            </c:forEach>
        </div>

        <div class="input-group mb-3 card-body" style="margin-bottom: 0px; padding-top: 0px;">
            <div class="input-group-prepend">
                <label class="input-group-text" for="speciesId">Species</label>
            </div>
            <select class="custom-select" name="species" id="speciesId" value="${form.species}">
                <option value="dog">Dog</option>
                <option value="cat">Cat</option>
                <option value="small">Other</option>
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
                    <button style="background: #8f8f8f" class="btn btn-outline-dark mt-auto card-body" type="submit">Submit</button>
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
</form>
</div>

<jsp:include page="../include/footer.jsp"/>
