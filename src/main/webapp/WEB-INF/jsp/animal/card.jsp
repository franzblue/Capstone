<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<div class="card" style="width: 18rem;">
    <img class="card-img-top" src="${animal.img_table}" alt="Animal image">
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
