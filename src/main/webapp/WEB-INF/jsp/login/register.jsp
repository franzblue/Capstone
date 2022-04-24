<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta charset ="utf-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title>All Paws On Deck!</title>
</head>
<%--<jsp:include page="../include/header.jsp"/>--%>



<%--<form action="/login/registerSubmit" method="post">--%>

<%--    <input type="hidden" name="id" value="${form.id}">--%>
<%--    First Name<input type="text" name="firstName" id="firstNameId" value="${form.firstName}">--%>
<%--    <c:forEach items="${bindingResult.getFieldErrors('firstName')}" var="error">--%>
<%--        <div style="color: red;">--%>
<%--                ${error.getDefaultMessage()}--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
<%--    <br>--%>
<%--    Last Name<input type="text" name="lastName" id="lastNameId" value="${form.lastName}">--%>
<%--    <c:forEach items="${bindingResult.getFieldErrors('lastName')}" var="error">--%>
<%--        <div style="color: red;">--%>
<%--                ${error.getDefaultMessage()}--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
<%--    <br>--%>
<%--    Email <input type="email" name="email" id="emailId" value="${form.email}">--%>
<%--    <c:forEach items="${bindingResult.getFieldErrors('email')}" var="error">--%>
<%--        <div style="color: red;">--%>
<%--                ${error.getDefaultMessage()}--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
<%--    <br>--%>
<%--    Username <input type="text" name="username" id="usernameId" value="${form.username}">--%>
<%--    <c:forEach items="${bindingResult.getFieldErrors('username')}" var="error">--%>
<%--        <div style="color: red;">--%>
<%--                ${error.getDefaultMessage()}--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
<%--    <br>--%>
<%--    Password <input type="password" name="password" id="passwordId" value="${form.password}">--%>
<%--    <c:forEach items="${bindingResult.getFieldErrors('password')}" var="error">--%>
<%--        <div style="color: red;">--%>
<%--                ${error.getDefaultMessage()}--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
<%--    <br>--%>
<%--    Confirm Password <input type="password" name="confirmPassword" id="confirmPasswordId" value="${form.confirmPassword}">--%>
<%--    <c:forEach items="${bindingResult.getFieldErrors('confirmPassword')}" var="error">--%>
<%--        <div style="color: red;">--%>
<%--                ${error.getDefaultMessage()}--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
<%--    <br>--%>
<%--&lt;%&ndash;    <br>&ndash;%&gt;--%>
<%--&lt;%&ndash;    Check Box<input type="checkbox" name="checkbox">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <br>&ndash;%&gt;--%>

<%--    <div class="slidecontainer">--%>
<%--        <input type="range" min="1" max="100" value="50" class="slider" id="dogRange">--%>
<%--&lt;%&ndash;            <div id="dogRangeValue"></div>&ndash;%&gt;--%>
<%--        <div id="dogRangeValue"></div>--%>
<%--    </div>--%>
<%--    <div class="slidecontainer">--%>
<%--        <input type="range" min="1" max="100" value="50" class="slider" id="catRange">--%>
<%--&lt;%&ndash;            <div id="catRangeValue"></div>&ndash;%&gt;--%>
<%--        <div id="catRangeValue"></div>--%>
<%--    </div>--%>
<%--    <div class="slidecontainer">--%>
<%--        <input type="range" min="1" max="100" value="50" class="slider" id="otherRange">--%>
<%--&lt;%&ndash;            <div id="otherRangeValue"></div>&ndash;%&gt;--%>
<%--        <div id="otherRangeValue"></div>--%>
<%--    </div>--%>

<%--    <br>--%>
<%--    <button type="submit">Submit</button>--%>

<%--</form>--%>

<%--<script>--%>

<%--    $(document).ready(function() {--%>
<%--        $("#dogRange").on("input", function () {--%>
<%--            let sliderValue = $("#myRange").val();--%>
<%--            $("#rangeValue1").text(sliderValue);--%>

<%--            $.ajax( {--%>
<%--                url : "/ajaxRequest",--%>
<%--                type : "GET",--%>
<%--                data : {--%>
<%--                    "sliderValue" : sliderValue--%>
<%--                },--%>
<%--                // dataType : "json",--%>
<%--                success : function(data) {--%>
<%--                    console.log("Data: " + data);--%>
<%--                },--%>
<%--                error : function(request, error) {--%>
<%--                    console.log("Error: " + error + " " + request);--%>
<%--                }--%>
<%--            });--%>
<%--        });--%>
<%--    });--%>

<%--</script>--%>
<style>



    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif
    }

    body {
        background: #ecf0f3
    }

    .wrapper {
        max-width: 350px;
        min-height: 500px;
        margin: 80px auto;
        padding: 40px 30px 30px 30px;
        background-color: #ecf0f3;
        border-radius: 15px;
        box-shadow: 13px 13px 20px #cbced1, -13px -13px 20px #fff
    }

    .logo {
        width: 80px;
        margin: auto
    }

    .logo img {
        width: 100%;
        height: 80px;
        object-fit: cover;
        border-radius: 50%;
        box-shadow: 0px 0px 3px #5f5f5f, 0px 0px 0px 5px #ecf0f3, 8px 8px 15px #a7aaa7, -8px -8px 15px #fff
    }

    .wrapper .name {
        font-weight: 600;
        font-size: 1.4rem;
        letter-spacing: 1.3px;
        padding-left: 10px;
        color: #555
    }

    .wrapper .stat {
        font-weight: 600;
        font-size: 1.08rem;
        letter-spacing: 1.3px;
        padding-left: 10px;
        color: #555
    }

    .wrapper .form-field input {
        width: 100%;
        display: block;
        border: none;
        outline: none;
        background: none;
        font-size: 1.2rem;
        color: #666;
        padding: 10px 15px 10px 10px
    }

    .wrapper .form-field {
        padding-left: 10px;
        margin-bottom: 20px;
        border-radius: 20px;
        box-shadow: inset 8px 8px 8px #cbced1, inset -8px -8px 8px #fff
    }

    .wrapper .form-field .fas {
        color: #555
    }

    .wrapper .btn {
        box-shadow: none;
        width: 100%;
        height: 40px;
        background-color: #738c96;
        color: #fff;
        border-radius: 25px;
        box-shadow: 3px 3px 3px #b1b1b1, -3px -3px 3px #fff;
        letter-spacing: 1.3px
    }

    .wrapper .btn:hover {
        background-color: #527b8c
    }

    .wrapper a {
        text-decoration: none;
        font-size: 1rem;
        color: #03A9F4
    }

    .wrapper a:hover {
        color: #039BE5
    }

    @media(max-width: 380px) {
        .wrapper {
            margin: 30px 20px;
            padding: 40px 15px 15px 15px
        }
    }
</style>

<div class="wrapper">
    <div class="logo"> <img src="../../../pub/images/welcome.jpg" alt="Cute animal"> </div>

    <%--Header--%>
    <c:choose>
        <c:when test = "${empty form.id}">
            <div class="text-center mt-4 name">Sign Up</div>
            <form class="p-3 mt-3" action="/login/registerSubmit" method="post">
        </c:when>

        <c:when test = "${not empty form.id}">
            <div class="text-center mt-4 name">Edit User</div>
            <form class="p-3 mt-3" action="/user/editSubmit/${form.id}" method="post">
        </c:when>
    </c:choose>
            <br>

            <%--ID--%>
            <input type="hidden" name="id" value="${form.id}">

            <%--FirstName--%>
        <div class="text-center mt-4 stat">First Name: </div>
            <div class="form-field d-flex align-items-center">
                <span class="far fa-firstname"></span>
                <input type="text" class="form-control" name="firstName" id="firstNameId" placeholder="First Name" value="${form.firstName}">
            </div>
            <c:forEach items="${bindingResult.getFieldErrors('firstName')}" var="error">
                <div style="color: red;">
                        ${error.getDefaultMessage()}
                </div>
            </c:forEach>

            <%--LastName--%>
            <div class="text-center mt-4 stat">Last Name: </div>
            <div class="form-field d-flex align-items-center">
                <span class="far fa-lastname"></span>
                <input type="text" class="form-control" name="lastName" id="lastNameId" placeholder="Last Name" value="${form.lastName}">
            </div>
            <c:forEach items="${bindingResult.getFieldErrors('lastName')}" var="error">
                <div style="color: red;">
                        ${error.getDefaultMessage()}
                </div>
            </c:forEach>

            <%--Email--%>
            <c:if test="${not empty form.email}">
<%--                <div class="text-center mt-4 stat">Email: </div>--%>
<%--                <div class="form-field d-flex align-items-center">--%>
<%--                    <span class="far fa-email"></span>--%>
<%--                    <input type="email" class="form-control" name="email" id="emailId" placeholder="Email" value="${form.email}" disabled>--%>
<%--                </div>--%>
            </c:if>
            <c:if test="${empty form.email}">
                <div class="text-center mt-4 stat">Email: </div>
                <div class="form-field d-flex align-items-center">
                    <span class="far fa-email"></span>
                    <input type="email" class="form-control" name="email" id="emailId" placeholder="Email" value="${form.email}">
                </div>
            </c:if>
            <c:forEach items="${bindingResult.getFieldErrors('email')}" var="error">
                <div style="color: red;">
                        ${error.getDefaultMessage()}
                </div>
            </c:forEach>

            <%--Username--%>
            <c:if test="${not empty form.username}">
<%--                <div class="text-center mt-4 stat">Username: </div>--%>
<%--                <div class="form-field d-flex align-items-center">--%>
<%--                    <span class="far fa-username"></span>--%>
<%--                    <input type="text" class="form-control" name="username" id="usernameId" placeholder="Username" value="${form.username}" disabled>--%>
<%--                </div>--%>
            </c:if>
            <c:if test="${empty form.username}">
                <div class="text-center mt-4 stat">Username: </div>
                <div class="form-field d-flex align-items-center">
                    <span class="far fa-username"></span>
                    <input type="text" class="form-control" name="username" id="usernameId" placeholder="Username" value="${form.username}">
                </div>
            </c:if>
            <c:forEach items="${bindingResult.getFieldErrors('username')}" var="error">
                <div style="color: red;">
                        ${error.getDefaultMessage()}
                </div>
            </c:forEach>

            <%--password--%>
            <c:if test="${not empty form.password}">
<%--                <div class="text-center mt-4 stat">Password: </div>--%>
<%--                <div class="form-field d-flex align-items-center">--%>
<%--                    <span class="far fa-password"></span>--%>
<%--                    <input type="password" class="form-control" name="password" id="passwordId" placeholder="Password" value="${form.password}" disabled>--%>
<%--                </div>--%>
            </c:if>
            <c:if test="${empty form.password}">
                <div class="text-center mt-4 stat">Password: </div>
                <div class="form-field d-flex align-items-center">
                    <span class="far fa-password"></span>
                    <input type="password" class="form-control" name="password" id="passwordId" placeholder="Password" value="${form.password}">
                </div>
            </c:if>
            <c:if test="${empty form.password}">
                <div class="text-center mt-4 stat">Confirm Password: </div>
                <div class="form-field d-flex align-items-center">
                    <span class="far fa-password"></span>
                    <input type="password" class="form-control" name="confirmPassword" id="confirmPasswordId" placeholder="Confirm Password">
                </div>
            </c:if>
            <c:forEach items="${bindingResult.getFieldErrors('password')}" var="error">
                <div style="color: red;">
                        ${error.getDefaultMessage()}
                </div>
            </c:forEach>

            <%--telephone--%>
            <c:if test="${not empty form.telephone}">
                <div class="text-center mt-4 stat">Telephone: </div>
                <div class="form-field d-flex align-items-center">
                    <span class="far fa-telephone"></span>
                    <input type="text" id="telephoneId" name="telephone" placeholder="Telephone" value="${form.telephone}">
                </div>
            </c:if>

            <%--address--%>
            <c:if test="${not empty form.address}">
                <div class="text-center mt-4 stat">Street Address: </div>
                <div class="form-field d-flex align-items-center">
                    <span class="far fa-address"></span>
                    <input type="text" id="addressId" name="address" placeholder="Address" value="${form.address}">
                </div>
            </c:if>




            <%--DESRIPTION--%>
            <c:if test="${not empty form.blurb}">
                <div class="text-center mt-4 stat">Your Tagline: </div>
                <div class="form-field d-flex align-items-center">
                    <span class="far fa-blurb"></span>
                    <textarea class="form-control" id="blurbId" name="blurb" cols="35" rows="3"
                              style="padding-left: 5px; padding-top: 5px; resize: none; outline: none; border: none; background: none;"
                              value="${form.blurb}" placeholder="${form.blurb}"></textarea>
                </div>
            </c:if>

            <c:if test="${not empty form.description}">
                <div class="text-center mt-4 stat">Describe Yourself: </div>
                <div class="form-field d-flex align-items-center">
                    <span class="far fa-description"></span>
                    <textarea class="form-control" id="descriptionId" name="description" cols="30" rows="5"
                              style="padding-left: 5px; padding-top: 5px; resize: none; outline: none; border: none; background: none;"
                              value="${form.description}" placeholder="${form.description}"></textarea>
                </div>
            </c:if>


            <%--SLIDERS--%>
            <c:if test="${not empty form.dogLove}">
                <div class="text-center mt-4 stat">Rate Your Preferences: </div>
                <br>
                <div class="slidecontainer stat">
                    <label for="dogRange" class="col-sm-2 control-label">Dog Person: </label>
                    <br>
                    <input type="range" min="1" max="100" class="slider" name="dogLove" id="dogRange" value="${form.dogLove}">
                    <div id="dogRangeValue"></div>
                </div>
            </c:if>
            <c:if test="${not empty form.catLove}">
                <div class="slidecontainer stat">
                    <label for="catRange" class="col-sm-2 control-label">Cat Person: </label>
                    <br>
                    <input type="range" min="1" max="100" class="slider" name="catLove" id="catRange" value="${form.catLove}">
                    <div id="catRangeValue"></div>
                </div>
            </c:if>
            <c:if test="${not empty form.smallLove}">
                <div class="slidecontainer stat">
                    <label for="otherRange" class="col-sm-2 control-label">Small Animals: </label>
                    <br>
                    <input type="range" min="1" max="100" class="slider" name="smallLove" id="otherRange" value="${form.smallLove}">
                    <div id="otherRangeValue"></div>
                </div>
            </c:if>
                <br>

            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
        <br>
        <div class="text-center fs-6"> <a href="/index">Home Page</a></div>
</div>

<script>
    var dogSlider = document.getElementById("dogRange");
    var dogOutput = document.getElementById("dogRangeValue");
    dogOutput.innerHTML = dogSlider.value; // Display the default slider value

    // Update the current slider value (each time you drag the slider handle)
    dogSlider.oninput = function() {
        dogOutput.innerHTML = this.value;
    }
    var catSlider = document.getElementById("catRange");
    var catOutput = document.getElementById("catRangeValue");
    catOutput.innerHTML = catSlider.value; // Display the default slider value

    // Update the current slider value (each time you drag the slider handle)
    catSlider.oninput = function() {
        catOutput.innerHTML = this.value;
    }
    var otherSlider = document.getElementById("otherRange");
    var otherOutput = document.getElementById("otherRangeValue");
    otherOutput.innerHTML = otherSlider.value; // Display the default slider value

    // Update the current slider value (each time you drag the slider handle)
    otherSlider.oninput = function() {
        otherOutput.innerHTML = this.value;
    }
</script>
