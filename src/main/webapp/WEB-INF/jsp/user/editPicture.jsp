<jsp:include page="../include/header.jsp"/>





<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product details-->
                        <div class="card-body p-4">
                        <h1>Edit Profile Picture</h1>
                            <div class="text-center">
                                <form action="/upload" method="POST" enctype="multipart/form-data">

                                    <!-- Product actions-->
                                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        <div class="text-center">
                                        Select File: <input class="btn btn-outline-primary mt-auto" type="file" name="file">
                                            <button class="btn btn-outline-dark mt-auto" type="submit" value="submit">Submit</button>
                                        </div>
                                    </div>

                                </form>
                            </div>
                        </div>
                        <!-- Profile image-->
                        <img class="card-img-top" src="${image}" alt="profile picture" />
                </div>
        </div>
    </div>
</section>


<jsp:include page="../include/footer.jsp"/>
