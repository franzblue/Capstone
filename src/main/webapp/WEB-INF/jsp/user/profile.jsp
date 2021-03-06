<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>

<script>
    function editPic() {
        $.ajax({
            type: "GET",
            url: "/user/editPicture",
            success: function (response) {
                window.location.href = "/user/editPicture";
            },
            error: function (result) {
                // do something.
                console.log("problem with pic");
            }
        });
    }
</script>


<%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />--%>
<%--<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/ti-icons@0.1.2/css/themify-icons.css">--%>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-7 col-lg-4 mb-5 mb-lg-0 wow fadeIn">
            <div class="card border-0 shadow">
                <div onclick="editPic()" class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem; cursor: pointer;">Change Picture</div>
                <img onclick="editPic()" src="${form.image}" alt="profile picture" style=" cursor: pointer;">
                <div class="card-body p-1-9 p-xl-5">
                    <div class="mb-4">
                        <h3 class="h4 mb-0">${form.firstName} ${form.lastName}</h3>
                        <span class="text-primary">CEO &amp; Founder</span>
                    </div>
                    <ul class="list-unstyled mb-4">
                        <li class="mb-3"><a href="#!"><i class="far fa-envelope display-25 me-3 text-secondary"></i>${form.email}</a></li>
                        <li class="mb-3"><a href="#!"><i class="fas fa-mobile-alt display-25 me-3 text-secondary"></i>${form.telephone}</a></li>
                        <li><a href="#!"><i class="fas fa-map-marker-alt display-25 me-3 text-secondary"></i>${form.address}</a></li>
                    </ul>
                    <!-- <ul class="social-icon-style2 ps-0">
                        <li><a href="#!" class="rounded-3"><i class="fab fa-facebook-f"></i></a></li>
                        <li><a href="#!" class="rounded-3"><i class="fab fa-twitter"></i></a></li>
                        <li><a href="#!" class="rounded-3"><i class="fab fa-youtube"></i></a></li>
                        <li><a href="#!" class="rounded-3"><i class="fab fa-linkedin-in"></i></a></li>
                    </ul> -->

                    <div class="container">
                        <div class="row">
                            <div class="col text-center">
                                <form action="/user/edit/${form.id}" method="get">
                                    <button class="btn btn-primary" type="submit">Edit Profile</button>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <div class="col-lg-8">
            <div class="ps-lg-1-6 ps-xl-5">
                <div class="mb-5 wow fadeIn">
                    <div class="text-start mb-1-6 wow fadeIn">
                        <h2 class="h1 mb-0 text-primary">About Me</h2>
                    </div>
                    <br>
                    <p>${form.blurb}</p>
                    <p class="mb-0">${form.description}</p>
                </div>
                <div class="wow fadeIn">
                    <h3>My preferences: </h3>
                    <hr>
                    <div class="progress-style1">
                        <div class="progress-text">
                            <div class="row">
                                <div class="col-6 fw-bold">Dog Lover</div>
                                <div class="col-6 text-end">${form.dogLove}%</div>
                            </div>
                        </div>
                        <div class="custom-progress progress rounded-3 mb-4">
                            <div class="animated custom-bar progress-bar slideInLeft" style="width:${form.dogLove}%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="0" role="progressbar"></div>
                        </div>
                        <div class="progress-text">
                            <div class="row">
                                <div class="col-6 fw-bold">Cat Lover</div>
                                <div class="col-6 text-end">${form.catLove}%</div>
                            </div>
                        </div>
                        <div class="custom-progress progress rounded-3 mb-4">
                            <div class="animated custom-bar progress-bar bg-secondary slideInLeft" style="width:${form.catLove}%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="70" role="progressbar"></div>
                        </div>
                        <div class="progress-text">
                            <div class="row">
                                <div class="col-6 fw-bold">Other Animals</div>
                                <div class="col-6 text-end">${form.smallLove}%</div>
                            </div>
                        </div>
                        <div class="custom-progress progress rounded-3">
                            <div class="animated custom-bar progress-bar bg-dark slideInLeft" style="width:${form.smallLove}%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="70" role="progressbar"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="../include/footer.jsp"/>
