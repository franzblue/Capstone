<jsp:include page="../include/header.jsp"/>

<h1>Edit</h1>

<form action="/upload" method="POST" enctype="multipart/form-data">

    Subject: <input type="text" name="subject">
    <br>
    Select File: <input type="file" name="file">
    <br>

    <button type="submit" value="submit">Submit</button>

</form>


<jsp:include page="../include/footer.jsp"/>
