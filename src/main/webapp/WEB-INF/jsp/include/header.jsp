<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset ="utf-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../../../pub/css/main.css">
    <title>All Paws On Deck!</title>
</head>

<script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>



<body onload="showCart()">
<%--<ul class="nav justify-content-end">--%>

<%--    <li class="nav-item">--%>
<%--        <a class="nav-link active bannerLink" href="/../animal/how">How To Help</a>--%>
<%--    </li>--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link active bannerLink" href="/../login/register">Register User</a>--%>
<%--    </li>--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link active bannerLink" href="/../user/search">User Search</a>--%>
<%--    </li>--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link active bannerLink" href="/../animal/addAnimal">Add Animal</a>--%>
<%--    </li>--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link active bannerLink" href="/../animal/search">Animal Search</a>--%>
<%--    </li>--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link bannerLink" href="/../user/profile">Profile</a>--%>
<%--    </li>--%>
<%--    <li class="nav-item">--%>
<%--        <a class="nav-link bannerLink" href="/login/logout">Log Out</a>--%>
<%--    </li>--%>
<%--</ul>--%>

<%--<sec:authorize access="!isAuthenticated()">--%>
<%--| <a href="/login/login">Log In</a>--%>
<%--</sec:authorize>--%>
<%--<sec:authorize access="isAuthenticated()">--%>
<%--| <a href="/login/logout">Log Out</a>--%>
<%--    <sec:authentication property="principal.username" />--%>
<%--</sec:authorize>--%>

    <script src="https://code.jquery.com/jquery-3.1.1.min.js">
    <%--<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>--%>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>



<%--<div class="container">--%>
<%--    <h1>Hello World</h1>--%>

<%--    <a href="/index">Index</a> |--%>
<%--    <a href="/user/register">Sign Up</a> |--%>
<%--    <a href="/user/search">Search</a>--%>

<script>
    function showCart(selectObject) {
        $.ajax({
            type: "GET",
            url: "/cart/showCart",
            success: function (response) {
                console.log("test")
                $("cartId").html(69);
            },
            error: function (result) {
                // do something.
                console.log("cart header ?");
            }
        });
    }
</script>


<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="/../index">All Paws On Deck!</a>
        <a style="text-decoration: none; color: inherit;" class="nav-link" href="/../user/profile/${principal.username}">Welcome, <sec:authentication property="principal.username"/>!</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <sec:authorize access="hasAnyAuthority('ADMIN')">
<%--                    <li class="nav-item"><a class="nav-link" href="/user/search">User Table</a></li>--%>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="adminNavbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Admin</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="/user/search">User Table</a></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li><a class="dropdown-item" href="#">Add Animal</a></li>
                            <li><a class="dropdown-item" href="#">Add Product</a></li>
<%--                            <li><a class="dropdown-item" href="/../animal/table/small">Small Animals</a></li>--%>
                        </ul>
                    </li>





                </sec:authorize>

                <li class="nav-item"><a class="nav-link" href="/../home">Home</a></li>

                <sec:authorize access="!isAuthenticated()">
                    <li class="nav-item"><a class="nav-link" href="/login/login">Log In</a></li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                    <li class="nav-item"><a class="nav-link" href="/../user/profile/${principal.username}">Profile</a></li>
                </sec:authorize>


                <li class="nav-item"><a class="nav-link" href="/../cart/shop">Shop</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Animals</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="/../animal/table/all">All Animals</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="/../animal/table/dog">Dogs</a></li>
                        <li><a class="dropdown-item" href="/../animal/table/cat">Cats</a></li>
                        <li><a class="dropdown-item" href="/../animal/table/small">Small Animals</a></li>
                    </ul>
                </li>
            </ul>
            <form action="/../cart/cart" class="d-flex">
                <button class="btn btn-outline-dark" type="submit">
                    <i class="bi-cart-fill me-1"></i>
                    My Cart
                    <span id="cartId" class="badge bg-dark text-white ms-1 rounded-pill">0</span>
                </button>
            </form>
        </div>
    </div>
</nav>
    <hr>
