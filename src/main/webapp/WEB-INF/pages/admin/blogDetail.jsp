<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Blog Detail</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <spring:url value="/resources/css/main.css" var="mainCSS"/>
    <link href="${mainCSS}" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1>Blog Detail</h1>
    <hr>
    <table class="table table-striped table-bordered">
        <tr>
            <td>ID</td>
            <td>${blog.id}</td>
        </tr>
        <tr>
            <td>Title</td>
            <td>${blog.title}</td>
        </tr>
        <tr>
            <td>Author</td>
            <td>${blog.userInBlogByUserId.nickname}, ${blog.userInBlogByUserId.firstName} ${blog.userInBlogByUserId.lastName}</td>
        </tr>
        <tr>
            <td>Content</td>
            <td>${blog.content}</td>
        </tr>
        <tr>
            <td>Publish Date</td>
            <td>${blog.pubDate}</td>
        </tr>
    </table>
    <hr>
    <a type="button" class="btn btn-default btn-lg" href="/admin/index">Back</a>
</div>

<script src="https://code.jquery.com/jquery-1.12.2.min.js"   integrity="sha256-lZFHibXzMHo3GGeehn1hudTAP3Sc0uKXBXAzHX1sjtk="   crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</body>
</html>
