﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="moviesite.admin" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>admin</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrapValidator.css">
    <style>

    </style>
</head>

<body>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%= Request.ApplicationPath %>">拉普达</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a>欢迎,admin</a></li>
                    <li><a href="/">去我的网站</a></li>
                    <li><a href="../navbar-static-top/">退出</a></li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </nav>
    <!-- end Fixed navbar -->
    <!-- container -->
    <div class="container bottom-50" style="min-height: 500px;">
        <div class="page-header">
            <h1>我的网站管理
                <small>子标题</small>
            </h1>
        </div>
        <div class="row">
            <div class="col-md-2">
                <!--选项卡：通过BS的类来控制选项卡的样式 -->
                <ul class='nav nav-pills nav-stacked'>
                    <li class='active'><a href='#tab1' data-toggle='tab'>电影</a></li>
                    <li><a href='#tab2' data-toggle='tab'>用户</a></li>
                    <li><a href='#tab3' data-toggle='tab'>广告</a></li>
                    <li><a href='#tab4' data-toggle='tab'>分类</a></li>
                    <li><a href='#tab5' data-toggle='tab'>标签</a></li>
                </ul>
            </div>
            <div class="col-md-10">
                <!--选项卡的内容定义-->
                <ul class='tab-content' style="padding: 0;">
                    <li class='tab-pane active' id='tab1'>
                        <table class="table table-condensed">
                            <caption>电影列表</caption>
                            <thead>
                                <tr>
                                    <th>名称</th>
                                    <th>上映日期</th>
                                    <th>票房</th>
                                    <th>评分</th>
                                    <th>change</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% foreach(moviesite.Movie movie in GetMovies())
                                    { %>
                                <tr>
                                    <td><%= movie.Name %></td>
                                    <td><%= movie.DateRelease %></td>
                                    <td><%= movie.BoxOffice %></td>
                                    <td><%= movie.Grade %></td>
                                    <td><a href="moviechange.aspx?change=true&id=<%= movie.MovieId %>" class="badge">修改</a><a href="?delete=<%= movie.MovieId %>" class="badge">删除</a></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                        <a href="moviechange.aspx?add=true" class="btn btn-primary">新增电影</a>
                    </li>
                    <li class='tab-pane fade' id='tab2'>
                        <table class="table table-condensed">
                            <caption>电影列表</caption>
                            <thead>
                                <tr>
                                    <th>名称</th>
                                    <th>上映日期</th>
                                    <th>票房</th>
                                    <th>评分</th>
                                    <th>change</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Tanmay</td>
                                    <td>Bangalore</td>
                                    <td>560001</td>
                                    <td>Tanmay</td>
                                    <td><a href="#" class="badge">修改</a><a href="#" class="badge">删除</a></td>
                                </tr>
                                <tr>
                                    <td>Sachin</td>
                                    <td>Mumbai</td>
                                    <td>400003</td>
                                    <td>Badgalore</td>
                                    <td><a href="#" class="badge">修改</a><a href="#" class="badge">删除</a></td>
                                </tr>
                                <tr>
                                    <td>Uma</td>
                                    <td>Pune</td>
                                    <td>411027</td>
                                    <td>Tanmay</td>
                                    <td><a href="#" class="badge">修改</a><a href="#" class="badge">删除</a></td>
                                </tr>
                            </tbody>
                        </table>
                        <button class="btn btn-primary">新增电影</button>
                    </li>
                    <li class='tab-pane fade' id='tab3'>
                        <ul>
                            <li>1</li>
                            <li>2</li>
                            <li>3</li>
                        </ul>
                        <button class="btn btn-primary">新增电影</button>
                    </li>
                    <li class='tab-pane fade' id='tab4'>
                        <table class="table table-condensed">
                            <caption>电影列表</caption>
                            <thead>
                                <tr>
                                    <th>名称</th>
                                    <th>上映日期</th>
                                    <th>票房</th>
                                    <th>评分</th>
                                    <th>change</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Tanmay</td>
                                    <td>Bangalore</td>
                                    <td>560001</td>
                                    <td>Tanmay</td>
                                    <td><a href="#" class="badge">修改</a><a href="#" class="badge">删除</a></td>
                                </tr>
                                <tr>
                                    <td>Sachin</td>
                                    <td>Mumbai</td>
                                    <td>400003</td>
                                    <td>Badgalore</td>
                                    <td><a href="#" class="badge">修改</a><a href="#" class="badge">删除</a></td>
                                </tr>
                                <tr>
                                    <td>Uma</td>
                                    <td>Pune</td>
                                    <td>411027</td>
                                    <td>Tanmay</td>
                                    <td><a href="#" class="badge">修改</a><a href="#" class="badge">删除</a></td>
                                </tr>
                            </tbody>
                        </table>
                        <button class="btn btn-primary">新增电影</button>
                    </li>
                    <li class='tab-pane fade' id='tab5'>
                        <table class="table table-condensed">
                            <caption>电影列表</caption>
                            <thead>
                                <tr>
                                    <th>名称</th>
                                    <th>上映日期</th>
                                    <th>票房</th>
                                    <th>评分</th>
                                    <th>change</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Tanmay</td>
                                    <td>Bangalore</td>
                                    <td>560001</td>
                                    <td>Tanmay</td>
                                    <td><a href="#" class="badge">修改</a><a href="#" class="badge">删除</a></td>
                                </tr>
                                <tr>
                                    <td>Sachin</td>
                                    <td>Mumbai</td>
                                    <td>400003</td>
                                    <td>Badgalore</td>
                                    <td><a href="#" class="badge">修改</a><a href="#" class="badge">删除</a></td>
                                </tr>
                                <tr>
                                    <td>Uma</td>
                                    <td>Pune</td>
                                    <td>411027</td>
                                    <td>Tanmay</td>
                                    <td><a href="#" class="badge">修改</a><a href="#" class="badge">删除</a></td>
                                </tr>
                            </tbody>
                        </table>
                        <button class="btn btn-primary">新增电影</button>
                    </li>
                 </ul>
            </div>
        </div>
        <!-- <div class="row">
            <div class="col-md-9">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">site administration</h3>
                    </div>
                    <div class="panel-body">
                        <li class="list-group-item text-nowrap"><a href="#">免费域名注册</a><a href="#" class="badge">add</a></li>
                        <li class="list-group-item text-nowrap"><a href="#">免费 Window 空间托管</a><a href="#" class="badge">add</a></li>
                        <li class="list-group-item text-nowrap"><a href="#">图像的数图像的数量图像的数量图</a><a href="#" class="badge">add</a></li>
                        <li class="list-group-item text-nowrap"><a href="#">每年更新成本</a><a href="#" class="badge">add</a></li>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <ul class="list-group">
                    <li class="list-group-item">免费域名注册</li>
                    <li class="list-group-item">免费 Window 空间托管</li>
                    <li class="list-group-item">图像的数量</li>
                    <li class="list-group-item">
                        <span class="badge">新</span> 24*7 支持
                    </li>
                    <li class="list-group-item">每年更新成本</li>
                    <li class="list-group-item">
                        <span class="badge">新</span> 折扣优惠
                    </li>
                </ul>
            </div>
        </div> -->
    </div>
    </div>
    <!-- end container  -->
    <!-- footer -->
    <footer class="container-fluid" style="background-color: #e7e7e7;">
        <!--/.container-->
        <p align="center" class="top">
            Copyright &copy;2015 Dreyer
        </p>
    </footer>
    <!-- end footer -->
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="js/validator.js">
    </script>
</body>

</html>
