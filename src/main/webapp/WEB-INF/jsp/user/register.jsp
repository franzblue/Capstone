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

<form action="/user/registerSubmit" method="post">

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

    <br>
    <button type="submit">Submit</button>

</form>

<jsp:include page="../include/footer.jsp"/>
