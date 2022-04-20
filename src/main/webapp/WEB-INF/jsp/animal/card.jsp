<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/animal/search">Adoptable Animals</a></li>
        <li class="breadcrumb-item"><a href="/animal/table/${animal.species}">${animal.species}s</a></li>
        <li class="breadcrumb-item active" aria-current="page">${animal.name}</li>
    </ol>
</nav>

<div class="card" style="width: 18rem;margin: 0 auto; float: none; margin-bottom: 10px;">
    <img class="card-img-top" src="${animal.image}" alt="Animal image">
    <div class="card-body">
        <h5 class="card-title">Name: ${animal.name}</h5>
        <p class="card-text">Description: ${animal.description}</p>
    </div>
    <ul class="list-group list-group-flush">
        <li class="list-group-item">Age: ${animal.age}</li>
        <li class="list-group-item">Sex: ${animal.sex}</li>
        <li class="list-group-item"Breed: >${animal.breed}</li>
    </ul>
    <div class="card-body">
        <a href="#" class="card-link">Contact Us</a>
        <a href="#" class="card-link">Sign Up</a>
    </div>
</div>

<jsp:include page="../include/footer.jsp"/>






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