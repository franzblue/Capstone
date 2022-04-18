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

<body>

<style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 450px}

    /* Set gray background color and 100% height */
    .sidenav {
        padding-top: 20px;
        background-color: #f1f1f1;
        height: 100%;
    }

    /* Set black background color, white text and some padding */
    footer {
        background-color: #555;
        color: white;
        padding: 15px;
    }

    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
        .sidenav {
            height: auto;
            padding: 15px;
        }
        .row.content {height:auto;}
    }
</style>
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

<div class="container-fluid text-center" style="margin-bottom: 100px">
    <div class="row content">
        <div class="col-sm-2 sidenav">
            <a href="/../animal/table/dog">
                <img src="../../../pub/images/placeholder.png" style="max-width: 100%; height: auto;">
                <p>View all dogs here</p>
            </a>
            <a href="/../animal/table/cat">
                <img src="../../../pub/images/placeholder.png" style="max-width: 100%; height: auto;">
                <p>View all cats here</p>
            </a>
        </div>
        <div class="col-sm-8 text-left">
            <h1>Welcome</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
            <hr>
            <div class="row">
                <div class="col-6">
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                </div>
            <form action="/login/loginSubmit" method="POST" class="col-6">
                <div class="form-group">
                    <h3>Sign In Here</h3>
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
            </div>
        </div>
        <div class="col-sm-2 sidenav">
            <div class="well">
                <a href="/login/register">
                    <img src="../../../pub/images/placeholder.png" style="max-width: 100%; height: auto;">
                    <p>New member? Register an account here!</p>
                </a>
            </div>
            <div class="well">
                <a href="/cart/shop">
                    <img src="../../../pub/images/placeholder.png" style="max-width: 100%; height: auto;">
                    <p>Need some supplies? Shop here!</p>
                </a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="include/footer.jsp"/>
