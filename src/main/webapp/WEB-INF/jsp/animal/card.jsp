<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="../include/header.jsp"/>


<div class="card" style="width: 18rem;margin: 0 auto; float: none; margin-bottom: 10px;">
<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/animal/search">Adoptable Animals</a></li>
        <li class="breadcrumb-item"><a href="/animal/table/${animal.species}">${animal.species}s</a></li>
        <li class="breadcrumb-item active" aria-current="page">${animal.name}</li>
    </ol>
</nav>
    <img class="card-img-top" src="${animal.image}" alt="Animal image">
    <div class="card-body  card-footer">
        <h5 class="card-title">Name: ${animal.name}</h5>
        <p class="card-text">Description: ${animal.description}</p>
    </div>
    <ul class="list-group list-group-flush">
        <li class="list-group-item">Age: <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="0" value="${animal.age / 12}"/> years old</li>
        <li class="list-group-item">Sex: ${animal.sex}</li>
        <li class="list-group-item">Breed: ${animal.breed}</li>
    </ul>
    <div class="card-body">
        <a href="#" class="card-link">Contact Us</a>
    </div>
</div>

<jsp:include page="../include/footer.jsp"/>
