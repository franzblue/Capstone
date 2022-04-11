<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<h1>Search</h1>
<form action="/user/search" method="get">
    <input type="text" placeholder=${searchValue} name="searchId"/>
    <button type="submit">Submit</button>
</form>

<table class="table">
    <tr scope="row">
        <th>Email</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Username</th>
    </tr>

    <c:forEach items="${users}" var="user">
        <tr scope="row">
            <td>${user.email}</td>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.username}</td>
        </tr>
    </c:forEach>
</table>

<jsp:include page="../include/footer.jsp"/>
