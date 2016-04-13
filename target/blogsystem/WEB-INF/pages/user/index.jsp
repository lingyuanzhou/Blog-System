<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>${userName}</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <spring:url value="/resources/css/main.css" var="mainCSS"/>
    <link href="${mainCSS}" rel="stylesheet">
</head>
<body id="userBody">

<div class="navbar navbar-fixed-top navbar-default" id="userNavbar">
    <div class="container">

        <div class="navbar-header">
            <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-user"></span> ${userName}</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="/logout"><span class="glyphicon glyphicon-off"></span> Logout </a>
            </li>
        </ul>
    </div>
</div>

<hr>

<div class="container" id="main">

    <div class="row" id="userInfoPanel">
        <div id="userInfo" class="col-sm-4 col-sm-offset-4 text-center">
            <img src="/resources/images/photo.jpg" class="img-circle">
            <h2>${userName}</h2>
        </div>
    </div>

    <div class="row" id="userNav">
        <div class="col-sm-4 col-sm-offset-4 text-center">
            <ul class="nav nav-tabs">
                <li>
                    <a href="#tabAbout" data-toggle="tab">About</a>
                </li>
                <li class="active">
                    <a href="#tabPosts" data-toggle="tab">Posts</a>
                </li>
            </ul>
        </div>
    </div>

    <div class="row" id="userContent">
        <div class="tab-content">
            <div class="tab-pane fade" id="tabAbout">
                <table class="table table-striped table-bordered">
                    <tr>
                        <td>ID</td>
                        <td>${user.id}</td>
                    </tr>
                    <tr>
                        <td>Nickname</td>
                        <td>${user.nickname}</td>
                    </tr>
                    <tr>
                        <td>First Name</td>
                        <td>${user.firstName}</td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td>${user.lastName}</td>
                    </tr>
                    <tr>
                        <td>Role</td>
                        <td>${user.authUser}</td>
                    </tr>
                </table>
            </div>

            <div class="tab-pane fade in active" id="tabPosts">
                <c:if test="${empty blogList}">
                    <div class="alert alert-warning" role="alert">
                        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>Empty, please add a new blog.</a>
                    </div>
                </c:if>
                <c:if test="${!empty blogList}">
                    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                        <c:forEach items="${blogList}" var="blog">
                            <div class="panel panel-default">
                                <div class="panel-heading" role="tab" id="heading${blog.id}">
                                    <h4 class="panel-title">
                                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse${blog.id}" aria-expanded="true" aria-controls="collapse${blog.id}">
                                            ${blog.title}
                                        </a>
                                    </h4>
                                </div>
                                <div id="collapse${blog.id}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading${blog.id}">
                                    <div class="panel-body">
                                        ${blog.content}
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

</div>

<script src="https://code.jquery.com/jquery-1.12.2.min.js"   integrity="sha256-lZFHibXzMHo3GGeehn1hudTAP3Sc0uKXBXAzHX1sjtk="   crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</body>
</html>

