<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset ="utf-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="../../../pub/css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oxygen&display=swap" rel="stylesheet">
    <title>All Paws On Deck!</title>
</head>

<script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<body>

</head>
<body>
<div class="header-row" id="header-row" style="padding: 0px; overflow:hidden;">
    <div class="container-fluid" style="padding: 0px;">
        <div class="row">
            <div class="col-xs-12 bannerDiv">
                <a class="logo" href="index">
                    <img src="../../../pub/images/banner.jpg" alt="company logo" style="width: 100%;">
                </a>
            </div>
        </div>
    </div>
</div>
<hr>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-3 col-lg-3 mb-3 mb-lg-3 wow fadeIn">
            <div class="sidenav" style="border-radius: 25px">
                <div class="well text-center">
                    <a style="text-decoration: none;" class="link-secondary"  href="/../animal/table/dog">
                        <img style="border-radius: 25px; border: 2px solid #606f7c;" src="../../../pub/images/dogs.jpeg" style="max-width: 100%; height: auto;">
                        <p>View all our dogs</p>
                    </a>
                </div>
                <div class="well text-center">
                    <a style="text-decoration: none;" class="link-secondary" href="/../animal/table/cat">
                        <img style="border-radius: 25px; border: 2px solid #606f7c;" src="../../../pub/images/catInTree.jpeg" style="max-width: 100%; height: auto;">
                        <p>View all our cats</p>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="text-left">
                <h1>Welcome</h1>
                <p style="font-size: 20px;"><b>All Paws On Deck!</b> is a web based application designed to connect people with their future animal companions.
                        You are free to create a profile filled out with personal preferences relating to finding your next pet.
                        You will then be able to search through our database of animals to help make a decision on what animal best suits your needs.
                        An online shop is also available to purchase everyday essentials for your animal -
                        simply add products to your cart and checkout whenever you are ready!</p>
                <hr>
                <div class="row">
                    <div class="col-3"></div>
                    <sec:authorize access="!isAuthenticated()">
                        <form action="/login/loginSubmit" method="POST" class="col-6">
                            <div class="form-group">
                                <h3 class="text-center">Sign In Here</h3>
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="username" placeholder="Enter email">
                                <%--                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="Password">
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </sec:authorize>
                    <div class="col-3"></div>
                </div>
            </div>
        </div>
        <div class="col-md-3 col-lg-3 mb-3 mb-lg-3 wow fadeIn">
            <div class="sidenav" style="border-radius: 25px">
                <div class="well text-center">
                    <a style="text-decoration: none;" class="link-secondary" href="/login/register">
                        <img style="border-radius: 25px; border: 2px solid #606f7c;" src="../../../pub/images/login.png" style="max-width: 100%; height: auto;">
                        <p>Click here to create an account</p>
                    </a>
                </div>
                <div class="well text-center">
                    <a style="text-decoration: none;" class="link-secondary" href="/cart/shop">
                        <img style="border-radius: 25px; border: 2px solid #606f7c;" src="../../../pub/images/supplies.png" style="max-width: 100%; height: auto;">
                        <p>Need some supplies? Shop here!</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="include/footer.jsp"/>
