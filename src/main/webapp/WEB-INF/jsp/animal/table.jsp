<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<%--<nav aria-label="breadcrumb">--%>
<%--    <ol class="breadcrumb">--%>
<%--        <li class="breadcrumb-item"><a href="/animal/table/${animals[0].species}">Adoptable Animals</a></li>--%>
<%--        <li class="breadcrumb-item active" aria-current="page">${animals[0].species}s</li>--%>
<%--    </ol>--%>
<%--</nav>--%>
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
<!-- Header-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Find your companion</h1>
            <p class="lead fw-normal text-white-50 mb-0">Every pet needs a helping paw.</p>
        </div>
    </div>
</header>
<div class="container">
<form action="/animal/search" method="get">
    <select id="species" name="species" onchange="getSpecies(this)">
        <option>Species</option>
        <option value="Dog" name="species">Dogs</option>
        <option value="Cat" name="species">Cats</option>
        <option value="Other" name="species">Rabbits And Small Animals</option>
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

<div class="container">
    <div class="row card-deck">
<c:forEach items="${animals}" var="item" varStatus="status">

<%--    <p>${status.begin.toString()}</p>--%>

<%--    Id: ${item.id}<br>--%>
<%--    Name: ${item.name}<br>--%>
<%--    Species: ${item.species}<br>--%>
<%--    Breed: ${item.breed}<br>--%>
<%--    Description: ${item.description}<br>--%>
<%--    Age: ${item.age} years old<br>--%>
<%--    Sex: ${item.sex}<br>--%>
<%--    Image: ${item.img}<br>--%>
<%--    <br>--%>
<%--    <hr>--%>

<div class="col-sm-4" style="border: solid #555555">
    <b class="card-text">Description: ${item.description}</b>
    <br>
    <b class="card-text">MORE INFO REGARDING PET</b>
</div>
    <div class="card col-sm-4">
        <img class="card-img-top" src="${item.image}" alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title">${item.name}</h5>
            <p class="card-text">${item.description}</p>
        </div>
        <a href="/../animal/card/${item.id}" class="btn btn-primary">Learn more about ${item.name}</a>
        <div class="card-footer">
            <small class="text-muted">Last updated 3 mins ago</small>
        </div>
    </div>
<div class="col-sm-4" style="border: solid #555555">
    <p class="card-text">Age: ${item.age}</p>
    <p class="card-text">Sex: ${item.sex}</p>
    <p class="card-text">Species: ${item.species}</p>
    <p class="card-text">Breed: ${item.breed}</p>
</div>



<hr>

</c:forEach>
    </div>
    </div>
</div>




<jsp:include page="../include/footer.jsp"/>
