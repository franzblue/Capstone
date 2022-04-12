<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/animal/search">Adoptable Animals</a></li>
        <li class="breadcrumb-item active" aria-current="page">${animals[0].species}s</li>
    </ol>
</nav>

<div class="card-deck">

<c:forEach items="${animals}" var="item">
<%--    Id: ${item.id}<br>--%>
<%--    Name: ${item.name}<br>--%>
<%--    Species: ${item.species}<br>--%>
<%--    Breed: ${item.breed}<br>--%>
<%--    Description: ${item.description}<br>--%>
<%--    Age: ${item.age} years old<br>--%>
<%--    Sex: ${item.sex}<br>--%>
<%--    Image: ${item.img}<br>--%>
<%--    <br>--%>
<%--    <hr>--%>



    <div class="card">
        <img class="card-img-top" src="${item.img_table}" alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title">${item.name}</h5>
            <p class="card-text">${item.description}</p>
        </div>
        <a href="/../animal/card/${item.id}" class="btn btn-primary">Learn more about ${item.name}</a>
        <div class="card-footer">
            <small class="text-muted">Last updated 3 mins ago</small>
        </div>
    </div>




</c:forEach>

    </div>


<jsp:include page="../include/footer.jsp"/>
