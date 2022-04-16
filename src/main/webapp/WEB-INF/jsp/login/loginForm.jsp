<%--<jsp:include page="../include/header.jsp"/>--%>

<form action="/login/loginSubmit" method="POST">
    <div class="form-group">
        <h3>Sign In Here</h3>
        <label for="exampleInputEmail1">Email address</label>
        <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="username" placeholder="Enter email">
        <%--                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>--%>
    </div>
    <div class="form-group">
        <label for="exampleInputPassword1">Password</label>
        <input type="password" class="form-control" id="exampleInputPassword1" name="password" placeholder="Password">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
</form>


<jsp:include page="../include/footer.jsp"/>
