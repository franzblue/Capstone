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
<hr>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-3 col-lg-3 mb-3 mb-lg-3 wow fadeIn">
            <div class="sidenav" style="border-radius: 25px">
                <div class="well text-center">
                    <a class="link-secondary"  href="/../animal/table/dog">
                        <img style="border-radius: 25px; border: 2px solid #606f7c;" src="../../../pub/images/dogs.jpeg" style="max-width: 100%; height: auto;">
                        <p>View all dogs here</p>
                    </a>
                </div>
                <div class="well text-center">
                    <a class="link-secondary" href="/../animal/table/cat">
                        <img style="border-radius: 25px; border: 2px solid #606f7c;" src="../../../pub/images/cats.jpeg" style="max-width: 100%; height: auto;">
                        <p>View all cats here</p>
                    </a>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="text-left">
                <h1>Welcome</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
                <hr>
                <div class="row">

                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>

                </div>
            </div>
        </div>
        <div class="col-md-3 col-lg-3 mb-3 mb-lg-3 wow fadeIn">
            <div class="sidenav" style="border-radius: 25px">
                <div class="well text-center">
                    <a class="link-secondary" href="/login/register">
                        <img style="border-radius: 25px; border: 2px solid #606f7c;" src="../../../pub/images/login.png" style="max-width: 100%; height: auto;">
                        <p>Create an account</p>
                    </a>
                </div>
                <div class="well text-center">
                    <a class="link-secondary" href="/cart/shop">
                        <img style="border-radius: 25px; border: 2px solid #606f7c;" src="../../../pub/images/supplies.png" style="max-width: 100%; height: auto;">
                        <p>Need some supplies? Shop here!</p>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>


<jsp:include page="include/footer.jsp"/>
