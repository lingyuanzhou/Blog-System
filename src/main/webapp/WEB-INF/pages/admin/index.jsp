<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-COMPATIBLE" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Welcome to Blog System!</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <spring:url value="/resources/css/main.css" var="mainCSS"/>
    <link href="${mainCSS}" rel="stylesheet">
</head>
<body>

<div class="navbar navbar-fixed-top navbar-default">
    <div class="container">

        <div class="navbar-header">
            <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-user"></span> ${adminName}</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li>
                <a href="/logout"><span class="glyphicon glyphicon-off"></span> Logout </a>
            </li>
        </ul>
    </div>
</div>

<hr>

<div class="container" id="infoTab">
    <div>
        <ul class="nav nav-tabs">
            <li class="active">
                <a href="#tab1" data-toggle="tab">User List</a>
            </li>
            <li>
                <a href="#tab2" data-toggle="tab">Blog List</a>
            </li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane fade in active" id="tab1">
                <h3>All Users</h3>
                <hr>

                <a href="/admin/users/add" type="button" class="btn btn-primary btn-sm">Add New User</a>

                <c:if test="${empty userList}">
                    <div class="alert alert-warning" role="alert">
                        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>Empty, please add a new user</a>
                    </div>
                </c:if>

                <c:if test="${!empty userList}">
                    <table class="table table-striped table-bordered">
                        <tr>
                            <th>ID</th>
                            <th>nickname</th>
                            <th>name</th>
                            <th>role</th>
                            <th>operations</th>
                        </tr>

                        <c:forEach items="${userList}" var="user">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.nickname}</td>
                                <td>${user.firstName} ${user.lastName}</td>
                                <td>${user.roleById.auth}</td>
                                <td>
                                    <a href="/admin/users/detail/${user.id}" type="button" class="btn btn-sm btn-success">Details</a>
                                    <a href="/admin/users/update/${user.id}" type="button" class="btn btn-sm btn-warning">Modify</a>
                                    <a href="/admin/users/delete/${user.id}" type="button" class="btn btn-sm btn-danger">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
            </div>

            <div class="tab-pane fade" id="tab2">
                <h3>All blogs</h3>
                <hr>

                <a href="/admin/blogs/add" type="button" class="btn btn-primary btn-sm">Add New Blog</a>

                <c:if test="${empty blogList}">
                    <div class="alert alert-warning" role="alert">
                        <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>Empty, please add a new blog.</a>
                    </div>
                </c:if>

                <c:if test="${!empty blogList}">
                    <table class="table table-striped table-bordered">
                        <tr>
                            <th>ID</th>
                            <th>title</th>
                            <th>content</th>
                            <th>post date</th>
                            <th>operations</th>
                        </tr>

                        <c:forEach items="${blogList}" var="blog">
                            <tr>
                                <td>${blog.id}</td>
                                <td>${blog.title}</td>
                                <td>${blog.content}</td>
                                <td>${blog.pubDate}</td>
                                <td>
                                    <a href="/admin/blogs/detail/${blog.id}" type="button" class="btn btn-sm btn-success">Details</a>
                                    <a href="/admin/blogs/update/${blog.id}" type="button" class="btn btn-sm btn-warning">Modify</a>
                                    <a href="/admin/blogs/delete/${blog.id}" type="button" class="btn btn-sm btn-danger">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </c:if>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-1.12.2.min.js"   integrity="sha256-lZFHibXzMHo3GGeehn1hudTAP3Sc0uKXBXAzHX1sjtk="   crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
</body>
</html>
