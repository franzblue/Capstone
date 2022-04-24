<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<style>
    table {
        border-collapse: collapse;
        width: 100%;
    }

    th, td {
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even) {background-color: #f2f2f2;}
</style>

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
    function changeRole(roleId) {
        console.log(roleId);
        $.ajax({
            type: "GET",
            url: "/user/changeRole",
            data: {"roleId" : roleId},
            success: function (response) {
                alert("Role updated.")
            },
            error: function (result) {
                // do something.
                console.log("Id ?");
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
    <tr scope="row" style="background: #8f8f8f">
        <th onclick="sortById()">ID</th>
        <th onclick="sortByRole()">Role</th>
        <th onclick="sortByEmail()">Email</th>
        <th onclick="sortByFirst()">First Name</th>
        <th onclick="sortByLast()">Last Name</th>
        <th onclick="sortByUsername()">Username</th>
        <th onclick="sortByTelephone()">Telephone</th>
        <th onclick="sortByAddress()">Address</th>
        <th>DELETE USER</th>
    </tr>

    <c:forEach items="${users}" var="user">
        <tr scope="row">
            <td>${user.id}</td>
            <td>
                <select name="role" id="roleId" value="${form.species}">
                <option value="${user.role}">${user.role}</option>
                <option value="ADMIN">ADMIN</option>
                <option value="USER">USER</option>
                </select>
                <button onclick="changeRole(${user.id})">Change</button>
            </td>
            <td>${user.email}</td>
            <td>${user.firstName}</td>
            <td>${user.lastName}</td>
            <td>${user.username}</td>
            <td>${user.telephone}</td>
            <td>${user.address}</td>
            <td class="text-center"><form action="/user/delete/${user.id}"><button style="background: #fd5656;">DELETE</button></form></td>
        </tr>
    </c:forEach>
</table>

<jsp:include page="../include/footer.jsp"/>
