<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<jsp:include page="../include/header.jsp"/>

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
    function deleteAnimal(animalId) {
        $.ajax({
            type: "GET",
            url: "/animal/deleteAnimal/",
            data: {"animalId" : animalId},
            success: function (response) {
            },
            error: function (result) {
                // do something.
                console.log("delete ?");
            }
        });
        $(document).ajaxStop(function(){
            window.location.reload();
        });
    }
    function editAnimal(animalId) {
        $.ajax({
            type: "GET",
            url: "/animal/editAnimal/{animalId}",
            data: {"animalId" : animalId},
            success: function (response) {
            },
            error: function (result) {
                // do something.
                console.log("delete ?");
            }
        });
        $(document).ajaxStop(function(){
            window.location.reload();
        });
    }
</script>
<!-- Header-->
<header class="bg-dark py-5">
    <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
            <h1 class="display-4 fw-bolder">Find your companion</h1>
            <p class="lead fw-normal text-white-50 mb-0">Because every pet needs a helping paw.</p>
        </div>
    </div>
</header>
<br>
<div class="container">
<form action="/animal/search" method="get">
    <select class="btn btn-secondary dropdown-toggle" id="species" name="species" onchange="getSpecies(this)">
        <option>Species</option>
        <option value="dog" name="species">Dogs</option>
        <option value="cat" name="species">Cats</option>
        <option value="small" name="species">Rabbits And Small Animals</option>
        <div id="exampleDiv"></div>
    </select>
    <select class="btn btn-secondary dropdown-toggle" action="/animal/species" id="sex" onchange="getSex(this)">
        <option>Sex</option>
        <option value="female">Female</option>
        <option value="male">Male</option>
    </select>
    <select class="btn btn-secondary dropdown-toggle" id="age" onchange="getAge(this)">
        <option>Age</option>
        <option value=6>Less Than 6 Months</option>
        <option value=70>More Than 5 Years</option>
    </select>
    <input type="text" placeholder="${searchValue}" name="searchId"/>
    <button class="btn btn-outline-dark mt-auto" type="submit">Submit</button>
</form>
<br>

    <section class="py-5" style="padding-top: 0px!important;">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <c:forEach items="${animals}" var="item" varStatus="status">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Amimal image-->
                            <img class="card-img-top" src="${item.image}" alt="..." />
                            <!-- Animal details-->
                            <div class="card-body p-4">
                                <h5 class="fw-bolder">${item.name}</h5>
                                <p class="fw-bolder">${item.sex}</p>
                                <p class="card-text">${item.breed}</p>
                                <!-- Animal Age-->
                                <p class="card-text">Age:
                                    <fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="0" value="${item.age / 12}"/>
                                    years old</p>
                            </div>

                            <!-- Learn More -->
                            <a href="/../animal/card/${item.id}" class="btn btn-outline-primary mt-auto">Learn more about ${item.name}</a>
                            <div class="card-footer">

                                <sec:authorize access="hasAuthority('ADMIN')">
                                    <div class=" text-center m-2">
                                        <button class="btn btn-outline-danger mt-auto" onclick="deleteAnimal(${item.id})" type="button">DELETE ANIMAL</button>
                                    </div>
                                    <div class=" text-center m-2">
                                        <form action="/animal/editAnimal/${item.id}">
                                            <button class="btn btn-outline-secondary mt-auto" type="submit">EDIT ANIMAL</button>
                                        </form>
                                    </div>
                                </sec:authorize>
<%--                                <small class="text-muted">Last updated 3 mins ago</small>--%>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

<jsp:include page="../include/footer.jsp"/>
