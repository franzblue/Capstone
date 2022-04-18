<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<nav aria-label="breadcrumb">
    <ol class="breadcrumb">
<%--        <li class="breadcrumb-item"><a href="/home">Home</a></li>--%>
<%--        <li class="breadcrumb-item"><a href="/animal/table/dog">Dogs</a></li>--%>
        <li class="breadcrumb-item active" aria-current="page">Adoptable Animals</li>
    </ol>
</nav>

<script>
    function getSpecies(selectObject) {
        var value = selectObject.value;
        console.log("testing " + value);
        $.ajax({
            type: "GET",
            url: "/animal/species",
            data: {"species" : value},
            success: function (response) {
                $("body").html(response);
            },
            error: function (result) {
                // do something.
                console.log("species ?");
            }
        });
    }
    function getSex(selectObject) {
        var value = selectObject.value;
        console.log(value);
        $.ajax({
            type: "GET",
            url: "/animal/sex",
            data: {"sex" : value},
            success: function (response) {
                $("body").html(response);
            },
            error: function (result) {
                // do something.
                console.log("sex ?");
            }
        });
    }
    function getAge(selectObject) {
        var value = selectObject.value;
        console.log(value);
        $.ajax({
            type: "GET",
            url: "/animal/age",
            data: {"age" : value},
            success: function (response) {
                $("body").html(response);
            },
            error: function (result) {
                // do something.
                console.log("age ?");
            }
        });
    }
</script>

<form action="/animal/search" method="get">
    <select id="species" name="species" onchange="getSpecies(this)">
        <option>Species</option>
        <option value="dog" name="species">Dogs</option>
        <option value="cat" name="species">Cats</option>
        <option value="small" name="species">Rabbits And Small Animals</option>
        <div id="exampleDiv"></div>
    </select>
    <select action="/animal/species" id="sex" onchange="getSex(this)">
        <option>Sex</option>
        <option value="female">Female</option>
        <option value="male">Male</option>
    </select>
    <select id="age" onchange="getAge(this)">
        <option>Age</option>
        <option value=6>Less Than 6 Months</option>
        <option value=70>More Than 5 Years</option>
    </select>
    <input type="text" placeholder="${searchValue}" name="searchId"/>
    <button type="submit">Submit</button>
</form>

<%--<table class="table">--%>
<%--    <tr scope="row">--%>
<%--        <th>Name</th>--%>
<%--        <th>Species</th>--%>
<%--        <th>Breed</th>--%>
<%--        <th>Description</th>--%>
<%--        <th>Age</th>--%>
<%--        <th>Sex</th>--%>
<%--    </tr>--%>

<%--    <c:forEach items="${animals}" var="animal">--%>
<%--        <tr scope="row">--%>
<%--            <td>${animal.name}</td>--%>
<%--            <td>${animal.species}</td>--%>
<%--            <td>${animal.breed}</td>--%>
<%--            <td>${animal.description}</td>--%>
<%--            <td>${animal.age}</td>--%>
<%--            <td>${animal.sex}</td>--%>
<%--        </tr>--%>
<%--    </c:forEach>--%>
<%--</table>--%>



<jsp:include page="../include/footer.jsp"/>
