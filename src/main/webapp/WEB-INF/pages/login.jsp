<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Blog System Login</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <spring:url value="/resources/css/main.css" var="mainCSS"/>
    <link href="${mainCSS}" rel="stylesheet"></head>
<body id="loginBody">
<div class="container">
    <div class="col-sm-4 col-sm-offset-4" id="login">
        <div class="panel panel-info">
            <div class="panel-heading text-center">
                <h3 class="panel-title">
                    <span class="glyphicon glyphicon-lock"></span>
                    <strong>User Login</strong>
                </h3>
            </div>
            <div class="panel-body">
                <c:if test="${param.error != null}">
                    <div class="alert alert-danger fade in alert-dismissable" role="alert">
                        <a class="close" data-dismiss="alert">&times;</a>
                        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                        <span class="sr-only">Error:</span>
                        Invalide username and password.
                    </div>
                </c:if>
                <c:if test="${param.logout != null}">
                    <div class="alert alert-danger fade in alert-dismissable" role="alert">
                        <a class="close" data-dismiss="alert">&times;</a>
                        <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                        <span class="sr-only">Error:</span>
                        You have been logged out.
                    </div>
                </c:if>
                <form action="<c:url value="/j_spring_security_check"></c:url>" method="post">
                    <div class="form-group">
                        <label for="username">User Name</label>
                        <input class="form-control" id="username" name="username" type="text" required autofocus>
                    </div>
                    <div class="form-group">
                        <label form="password">Password</label>
                        <input class="form-control" id="password" name="password" type="password" required>
                    </div>
                    <div class="form-group">
                        <button type="submit" name="submit" class="btn btn-info btn-block">Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>

<script   src="https://code.jquery.com/jquery-1.12.2.min.js"   integrity="sha256-lZFHibXzMHo3GGeehn1hudTAP3Sc0uKXBXAzHX1sjtk="   crossorigin="anonymous"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</body>
</html>
