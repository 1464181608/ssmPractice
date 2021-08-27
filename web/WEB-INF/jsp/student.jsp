<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>学生管理模块</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container-fluid">
    <div class="row-fluid">
        <div class="span12">
            <div class="row-fluid">
                <div class="span2">
                    <ul class="nav nav-list">
                        <li class="active">
                            <a href="${pageContext.request.contextPath}/student/allStudent?startPage=1">学生管理</a>
                        </li>
                        <li class="divider"/>
                        <li>
                            <a href="#">班级管理</a>
                        </li>
                        <li class="divider"/>
                        <li>
                            <a href="#">入住管理</a>
                        </li>
                        <li class="divider"/>
                        <li>
                            <a href="#">房间管理</a>
                        </li>
                        <li class="divider"/>
                        <li>
                            <a href="#">维修管理</a>
                        </li>
                        <li class="divider"/>
                        <li>
                            <a href="#">访客管理</a>
                        </li>
                    </ul>
                </div>
                <div class="span10">
                    <div class="row-fluid">
                        <form class="form-search" action="${pageContext.request.contextPath}/student/getStudent" method="post">
                            <div class="span3">
                                <div class="row-fluid">
                                    <div class="span3">
                                        <p>学号：</p>
                                    </div>
                                    <div class="span9">
                                        <input class="input-medium search-query" type="text" name="id"/>
                                    </div>
                                </div>
                            </div>
                            <div class="span3">
                                <div class="row-fluid">
                                    <div class="span3">
                                        <p>姓名：</p>
                                    </div>
                                    <div class="span9">
                                        <input class="input-medium search-query" type="text" name="name"/>
                                    </div>
                                </div>
                            </div>
                            <div class="span3">
                                <div class="row-fluid">
                                    <div class="span3">
                                        <p>专业：</p>
                                    </div>
                                    <div class="span9">
                                        <input class="input-medium search-query" type="text" name="major"/>
                                    </div>
                                </div>
                            </div>
                            <div class="span3">
                                <div class="row-fluid">
                                    <div class="span3">
                                        <p>班级：</p>
                                    </div>
                                    <div class="span9">
                                        <input class="input-medium search-query" type="text" name="className"/>
                                    </div>
                                    <div class="span10">
                                        <button type="submit" class="btn">查找</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="row clearfix">
                        <div class="col-md-12 column">
                            <table class="table table-hover table-striped">
                                <thead>
                                <tr>
                                    <th>学生学号</th>
                                    <th>学生姓名</th>
                                    <th>学生性别</th>
                                    <th>学生电话</th>
                                    <th>学生年龄</th>
                                    <th>学生专业</th>
                                    <th>学生班级</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="student" items="${pageInfo.list}">
                                    <tr>
                                        <td>${student.getId()}</td>
                                        <td>${student.getName()}</td>
                                        <td>${student.getSex()}</td>
                                        <td>${student.getPhone()}</td>
                                        <td>${student.getAge()}</td>
                                        <td>${student.getStudentClass().getMajor()}</td>
                                        <td>${student.getStudentClass().getName()}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/student/toUpdateStudent?sid=${student.getSid()}">修改</a> |
                                            <a href="${pageContext.request.contextPath}/student/delete?sid=${student.getSid()}">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="pagination pagination-centered">
                        <ul>
                            <li>
                                <a href="${pageContext.request.contextPath}/student/allStudent?startPage=1"> 首页 </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/student/allStudent?startPage=${pageInfo.pageNum-1}"> 前一页 </a>
                            </li>

                            <li>
                                <a href="${pageContext.request.contextPath}/student/allStudent?startPage=${pageInfo.pageNum+1}"> 后一页 </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/student/allStudent?startPage=${pageInfo.pages}"> 尾页 </a>
                            </li>
                            <li>
                                一共${pageInfo.total}条记录
                            </li>
                            <li>
                                一共${pageInfo.pages}页
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
