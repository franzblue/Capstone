<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
<%--        <li class="breadcrumb-item"><a href="/home">Home</a></li>--%>
<%--        <li class="breadcrumb-item"><a href="/animal/table/dog">Dogs</a></li>--%>
        <li class="breadcrumb-item active" aria-current="page">Adoptable Animals</li>
    </ol>
</nav>

<form action="/animal/search" method="get">
    <input type="text" placeholder=${searchValue} name="searchId"/>
    <button type="submit">Submit</button>
</form>

<table class="table">
    <tr scope="row">
        <th>Name</th>
        <th>Species</th>
        <th>Breed</th>
        <th>Description</th>
        <th>Age</th>
        <th>Sex</th>
    </tr>

    <c:forEach items="${animals}" var="animal">
        <tr scope="row">
            <td>${animal.name}</td>
            <td>${animal.species}</td>
            <td>${animal.breed}</td>
            <td>${animal.description}</td>
            <td>${animal.age}</td>
            <td>${animal.sex}</td>
        </tr>
    </c:forEach>
</table>

<jsp:include page="../include/footer.jsp"/>
