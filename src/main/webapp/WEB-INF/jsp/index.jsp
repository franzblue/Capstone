<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="user" scope="request" type="java.util.List"></jsp:useBean>
<jsp:include page="include/header.jsp"/>

<h1>This is an index page</h1>

<c:forEach var="user" items="${user}">
    <div>
        ${user.firstName}
    </div>
</c:forEach>

<jsp:include page="include/footer.jsp"/>
