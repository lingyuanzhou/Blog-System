<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Add New Blog</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <spring:url value="/resources/css/main.css" var="mainCSS"/>
    <link href="${mainCSS}" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Add New Blog</h1>
    <hr>

    <form:form action="/admin/blogs/addPost" method="post" commandName="blog" role="form">

        <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="Please Enter Title">
        </div>

        <div class="form-group">
            <label for="userInBlogByUserId.id">Author:</label>
            <select class="form-control" id="userInBlogByUserId.id" name="userInBlogByUserId.id">
                <c:forEach items="${userList}" var="user">
                    <option value="${user.id}">${user.nickname}, ${user.firstName} ${user.lastName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="content">Content:</label>
            <input type="text" class="form-control" id="content" name="content" placeholder="Please Enter Content">
        </div>
        <div class="form-group">
            <label for="pubDate">Post Date:</label>
            <input type="date" class="form-control" id="pubDate" name="pubDate" placeholder="Please Enter Date">
        </div>
        <div>
            <button type="submit" class="btn btn-default">Submit</button>
        </div>
    </form:form>
    <a type="button" class="btn btn-default" href="/admin/index">Back</a>
</div>

<script src="https://code.jquery.com/jquery-1.12.2.min.js"   integrity="sha256-lZFHibXzMHo3GGeehn1hudTAP3Sc0uKXBXAzHX1sjtk="   crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</body>
</html>
