<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<c:choose>

    <c:when test = "${empty form.id}">
        <h1>Sign Up</h1>
    </c:when>

    <c:when test = "${not empty form.id}">
        <h1>Edit User</h1>
    </c:when>


</c:choose>

<form action="/login/registerSubmit" method="post">

    <input type="hidden" name="id" value="${form.id}">
    First Name<input type="text" name="firstName" id="firstNameId" value="${form.firstName}">
    <c:forEach items="${bindingResult.getFieldErrors('firstName')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
    </c:forEach>
    <br>
    Last Name<input type="text" name="lastName" id="lastNameId" value="${form.lastName}">
    <c:forEach items="${bindingResult.getFieldErrors('lastName')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
    </c:forEach>
    <br>
    Email <input type="email" name="email" id="emailId" value="${form.email}">
    <c:forEach items="${bindingResult.getFieldErrors('email')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
    </c:forEach>
    <br>
    Username <input type="text" name="username" id="usernameId" value="${form.username}">
    <c:forEach items="${bindingResult.getFieldErrors('username')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
    </c:forEach>
    <br>
    Password <input type="password" name="password" id="passwordId" value="${form.password}">
    <c:forEach items="${bindingResult.getFieldErrors('password')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
    </c:forEach>
    <br>
    Confirm Password <input type="password" name="confirmPassword" id="confirmPasswordId" value="${form.confirmPassword}">
    <c:forEach items="${bindingResult.getFieldErrors('confirmPassword')}" var="error">
        <div style="color: red;">
                ${error.getDefaultMessage()}
        </div>
    </c:forEach>
    <br>
<%--    <br>--%>
<%--    Check Box<input type="checkbox" name="checkbox">--%>
<%--    <br>--%>

    <div class="slidecontainer">
        <input type="range" min="1" max="100" value="50" class="slider" id="dogRange">
<%--            <div id="dogRangeValue"></div>--%>
        <div id="dogRangeValue"></div>
    </div>
    <div class="slidecontainer">
        <input type="range" min="1" max="100" value="50" class="slider" id="catRange">
<%--            <div id="catRangeValue"></div>--%>
        <div id="catRangeValue"></div>
    </div>
    <div class="slidecontainer">
        <input type="range" min="1" max="100" value="50" class="slider" id="otherRange">
<%--            <div id="otherRangeValue"></div>--%>
        <div id="otherRangeValue"></div>
    </div>

    <br>
    <button type="submit">Submit</button>

</form>

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

<jsp:include page="../include/footer.jsp"/>
