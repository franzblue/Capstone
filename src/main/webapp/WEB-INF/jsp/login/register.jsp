<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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


<div class="card" style="width: 18rem;margin: 0 auto; float: none; margin-bottom: 10px;">
    <c:choose>

        <c:when test = "${empty form.id}">
            <h1>Sign Up</h1>
        <form class="form-horizontal" action="/login/registerSubmit" method="post">
        </c:when>

        <c:when test = "${not empty form.id}">
            <h1>Edit User</h1>
            <form class="form-horizontal" action="/user/editSubmit/${form.id}" method="post">
        </c:when>

    </c:choose>

        <div class="form-group">
            <input type="hidden" name="id" value="${form.id}">
            <label for="firstNameId" class="col-sm-2 control-label">First Name: </label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="firstName" id="firstNameId" placeholder="First Name" value="${form.firstName}">
            </div>
        </div>
        <c:forEach items="${bindingResult.getFieldErrors('firstName')}" var="error">
            <div style="color: red;">
                    ${error.getDefaultMessage()}
            </div>
        </c:forEach>
        <div class="form-group">
            <label for="lastNameId" class="col-sm-2 control-label">Last Name: </label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="lastName" id="lastNameId" placeholder="Last Name" value="${form.lastName}">
            </div>
        </div>
        <c:forEach items="${bindingResult.getFieldErrors('lastName')}" var="error">
            <div style="color: red;">
                    ${error.getDefaultMessage()}
            </div>
        </c:forEach>

        <c:if test="${not empty form.email}">
            <div class="form-group">
                <label for="emailId" class="col-sm-2 control-label disabled">Email: </label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" name="email" id="emailId" placeholder="Email" value="${form.email}" disabled>
                </div>
            </div>
        </c:if>

        <c:if test="${empty form.email}">
            <div class="form-group">
                <label for="emailId" class="col-sm-2 control-label">Email: </label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" name="email" id="emailId" placeholder="Email" value="${form.email}">
                </div>
            </div>
        </c:if>


        <c:forEach items="${bindingResult.getFieldErrors('email')}" var="error">
            <div style="color: red;">
                    ${error.getDefaultMessage()}
            </div>
        </c:forEach>
        <div class="form-group">
            <label for="usernameId" class="col-sm-2 control-label">Username: </label>
            <div class="col-sm-10">
                <input type="text" class="form-control" name="username" id="usernameId" placeholder="Username" value="${form.username}">
            </div>
        </div>
        <c:forEach items="${bindingResult.getFieldErrors('username')}" var="error">
            <div style="color: red;">
                    ${error.getDefaultMessage()}
            </div>
        </c:forEach>

            <c:if test="${not empty form.password}">
                <div class="form-group">
                    <label for="passwordId" class="col-sm-2 control-label disabled">Password: </label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="password" id="passwordId" placeholder="Password" value="${form.password}" disabled>
                    </div>
                </div>
            </c:if>

            <c:if test="${empty form.password}">
                <div class="form-group">
                    <label for="passwordId" class="col-sm-2 control-label">Password: </label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="password" id="passwordId" placeholder="Password" value="${form.password}">
                    </div>
                </div>
            </c:if>

            <c:if test="${empty form.password}">
                <div class="form-group">
                    <label for="confirmPasswordId" class="col-sm-2 control-label">Password: </label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" name="confirmPassword" id="confirmPasswordId" placeholder="Confirm Password">
                    </div>
                </div>
            </c:if>

        <c:forEach items="${bindingResult.getFieldErrors('password')}" var="error">
            <div style="color: red;">
                    ${error.getDefaultMessage()}
            </div>
        </c:forEach>

        <div class="form-group">
            <label for="telephoneId">Telephone:</label>
                <small>ex. 123-456-7890</small>
            <div class="col-sm-10">
                <input type="tel" id="telephoneId" name="telephone" placeholder="Telephone" value="${form.telephone}">
            </div>
        </div>

        <div class="form-group">
            <label for="addressId">Address:</label>
                <small>ex. Street Address</small>
            <div class="col-sm-10">
                <input type="tel" id="addressId" name="text" placeholder="Address" value="${form.address}">
            </div>
        </div>

        <c:if test="${empty form.blurb}">
            <div class="form-group">
                <label for="blurbId">Describe yourself in one sentence: </label>
                <div class="col-sm-10">
                    <textarea class="form-control" id="blurbId" name="blurb" rows="1" value="${form.blurb}" placeholder="Short blurb"></textarea>
                </div>
            </div>
        </c:if>

        <c:if test="${not empty form.blurb}">
            <div class="form-group">
                <label for="blurbId">Describe yourself in one sentence: </label>
                <div class="col-sm-10">
                    <textarea class="form-control" id="blurbId" name="blurb" rows="1" value="${form.blurb}" placeholder="${form.blurb}"></textarea>
                </div>
            </div>
        </c:if>


        <c:if test="${empty form.description}">
            <div class="form-group">
                <label for="blurbId">Describe yourself in more detail: </label>
                <div class="col-sm-10">
                    <textarea class="form-control" id="descriptionId" name="description" rows="3" value="${form.description}" placeholder="Longer description"></textarea>
                </div>
            </div>
        </c:if>

        <c:if test="${not empty form.description}">
            <div class="form-group">
                <label for="blurbId">Describe yourself in more detail: </label>
                <div class="col-sm-10">
                    <textarea class="form-control" id="descriptionId" name="description" rows="3" value="${form.description}" placeholder="${form.description}"></textarea>
                </div>
            </div>
        </c:if>

        <div class="slidecontainer">
            <label for="dogRange" class="col-sm-2 control-label">Dog Person: </label>
            <br>
            <input type="range" min="1" max="100" class="slider" name="dogLove" id="dogRange" value="${form.dogLove}">
            <div id="dogRangeValue"></div>
        </div>
        <div class="slidecontainer">
            <label for="catRange" class="col-sm-2 control-label">Cat Person: </label>
            <br>
            <input type="range" min="1" max="100" class="slider" name="catLove" id="catRange" value="${form.catLove}">
            <div id="catRangeValue"></div>
        </div>
        <div class="slidecontainer">
            <label for="otherRange" class="col-sm-2 control-label">Small Animals: </label>
            <br>
            <input type="range" min="1" max="100" class="slider" name="smallLove" id="otherRange" value="${form.smallLove}">
            <div id="otherRangeValue"></div>
        </div>
<%--        <div class="custom-file">--%>
<%--            <label class="custom-file-label" for="imageId">Upload Profile Picture: </label>--%>
<%--            <input type="file" class="custom-file-input" id="imageId" name="image" value="form.image">--%>
<%--        </div>--%>
        <br>
        <button type="submit">Submit</button>
    </form>
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

<%--<jsp:include page="../include/footer.jsp"/>--%>
