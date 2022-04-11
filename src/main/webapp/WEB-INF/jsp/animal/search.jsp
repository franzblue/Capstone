<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<h1>Animal Search</h1>
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
