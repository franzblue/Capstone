<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<script>
    function sortById() {
        $.ajax({
            type: "GET",
            url: "/user/sortId",
            success: function (response) {
                $("body").html(response);
            },
            error: function (result) {
                // do something.
                console.log("Id ?");
            }
        });
    }
    function sortByRole() {
        $.ajax({
            type: "GET",
            url: "/user/sortRole",
            success: function (response) {
                $("body").html(response);
            },
            error: function (result) {
                // do something.
                console.log("role ?");
            }
        });
    }
    function sortByEmail() {
        $.ajax({
            type: "GET",
            url: "/user/sortEmail",
            success: function (response) {
                $("body").html(response);
            },
            error: function (result) {
                // do something.
                console.log("email ?");
            }
        });
    }
    function sortByFirst() {
        $.ajax({
            type: "GET",
            url: "/user/sortFirst",
            success: function (response) {
                $("body").html(response);
            },
            error: function (result) {
                // do something.
                console.log("first ?");
            }
        });
    }
    function sortByLast() {
        $.ajax({
            type: "GET",
            url: "/user/sortLast",
            success: function (response) {
                $("body").html(response);
            },
            error: function (result) {
                // do something.
                console.log("last ?");
            }
        });
    }
    function sortByUsername() {
        $.ajax({
            type: "GET",
            url: "/user/sortUsername",
            success: function (response) {
                $("body").html(response);
            },
            error: function (result) {
                // do something.
                console.log("username ?");
            }
        });
    }
    function sortByTelephone() {
        $.ajax({
            type: "GET",
            url: "/user/sortTelephone",
            success: function (response) {
                $("body").html(response);
            },
            error: function (result) {
                // do something.
                console.log("telephone ?");
            }
        });
    }
    function sortByAddress() {
        $.ajax({
            type: "GET",
            url: "/user/sortAddress",
            success: function (response) {
                $("body").html(response);
            },
            error: function (result) {
                // do something.
                console.log("address ?");
            }
        });
    }
</script>

<style>
    th {
        cursor: pointer;
    }
</style>

<h1>User Table</h1>
<form action="/user/search" method="get">
    <input type="text" placeholder=${searchValue} name="searchId"/>
    <button type="submit">Submit</button>
</form>

<table class="table">
    <tr scope="row">
        <th onclick="sortById()">ID</th>
        <th onclick="sortByRole()">Role</th>
        <th onclick="sortByEmail()">Email</th>
        <th onclick="sortByFirst()">First Name</th>
        <th onclick="sortByLast()">Last Name</th>
        <th onclick="sortByUsername()">Username</th>
        <th onclick="sortByTelephone()">Telephone</th>
        <th onclick="sortByAddress()">Address</th>
    </tr>

    <c:forEach items="${users}" var="user">
        <tr scope="row">
            <td>${user.id}</td>
            <td>${user.role}</td>
            <td>${user.email}</td>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.username}</td>
            <td>${user.telephone}</td>
            <td>${user.address}</td>
        </tr>
    </c:forEach>
</table>

<jsp:include page="../include/footer.jsp"/>
