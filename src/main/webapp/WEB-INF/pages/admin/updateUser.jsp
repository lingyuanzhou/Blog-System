<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>User Update</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <spring:url value="/resources/css/main.css" var="mainCSS"/>
    <link href="${mainCSS}" rel="stylesheet">
</head>
<body>

<div class="container">
    <h1>User Update</h1>

    <form:form action="/admin/users/updatePost" method="post" commandName="userP" role="form">
        <div class="form-group">
            <label for="nicknameInput">Nickname:</label>
            <input type="text" class="form-control" id="nicknameInput" name="nickname" placeholder="Please Enter Nickname" value="${user.nickname}">
        </div>
        <div class="form-group">
            <label for="firstnameInput">First Name:</label>
            <input type="text" class="form-control" id="firstnameInput" name="firstName" placeholder="Please Enter First Name" value="${user.firstName}">
        </div>
        <div class="form-group">
            <label for="lastnameInput">Last Name:</label>
            <input type="text" class="form-control" id="lastnameInput" name="lastName" placeholder="Please Enter Last Name" value="${user.lastName}">
        </div>
        <div class="form-group">
            <label for="passwordInput">Password:</label>
            <input type="text" class="form-control" id="passwordInput" name="password" placeholder="Please Enter Password" value="${user.password}">
        </div>
        <div class="form-group">
            <label for="authUser">Role:</label>
            <select class="form-control" id="authUser" name="authUser">
                <option value="ROLE_USER">ROLE_USER</option>
                <option value="ROLE_ADMIN">ROLE_ADMIN</option>
            </select>
        </div>
        <input type="hidden" id="id" name="id" value="${user.id}">
        <button type="submit" class="btn btn-default">Submit</button>
    </form:form>

    <hr>
    <a type="button" class="btn btn-default btn-lg" href="/admin/index">Back</a>
</div>

<script src="https://code.jquery.com/jquery-1.12.2.min.js"   integrity="sha256-lZFHibXzMHo3GGeehn1hudTAP3Sc0uKXBXAzHX1sjtk="   crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</body>
</html>