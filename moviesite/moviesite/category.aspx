﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="moviesite.category" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>电影资源下载</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
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
                <a class="navbar-brand" href="/">拉普达</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/">Home</a></li>
                    <li><a href="about.aspx">About</a></li>
                    <li><a href="contact.aspx">Contact</a></li>
                    <li><a href="message.aspx">留言板</a></li>
                    <li class="dropdown active">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">分类<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <% foreach (moviesite.Category cate in moviesite.PublicService.GetCategory_List())
                                { %>
                            <li><a href="category.aspx?id=<%= cate.Categoryid %>"><%= cate.Name %></a></li>
                            <% } %>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <% if (Session["username"] == null)
                        { %>
                    <li><a href="/login.aspx?next=<%= HttpContext.Current.Request.RawUrl %>">登录</a></li>
                    <li><a href="/register.aspx">注册</a></li>
                    <% }
                        else
                        { %>
                    <li><a href="profile.aspx"><%= Session["username"] %></a></li>
                    <li><a href="?logout=true">退出</a></li>
                    <% } %>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </nav>
    <!-- Fixed navbar -->
    <div class="container" style="min-height:600px;">
        <form class="form-inline" role="search" action="search.aspx" method="post" >
            <div class="row">
                <br>
                <div class="col-lg-6 col-lg-offset-4 col-md-6 col-md-offset-4 col-sm-6 col-sm-offset-4">
                    <div class="input-group">
                        <input type="text" class="form-control input-md" placeholder="请输入。。。" name="keyword">
                        <span class="input-group-btn">
                            <button class="btn btn-default btn-md" type="submit">搜索</button></span>
                    </div>
                    <!-- /input-group -->
                </div>
                <!-- /.col-lg-6 -->
            </div>
            <!-- /.row -->
        </form>
        <div class="row">
            <div class="col-xs-12 col-md-8">
                <div class="row top">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">电影</h3>
                            </div>
                            <div class="panel-body">
                                <% foreach (moviesite.Movie li in MovieList)
                                    { %>
                                <a href="movie.aspx?id=<%= li.MovieId %>" class="list-group-item">
                                    <div class="row">
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <img src="img/9ebd5a8fcd91264f6dae5d823a863306.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-9">
                                            <h4><%= li.Name %></h4>
                                            <p><%= li.Summary %></p>
                                        </div>
                                    </div>
                                </a>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-7 "></div>
                    <div class="col-md-5 " align="center">
                        <ul class="pagination">
                            <li <% if (Convert.ToInt32(Request.QueryString.Get("page")) <= 1){ %>class="disabled"<% } %>><a href="<%= pre %>">&laquo;</a></li>
                            <li <% if (Convert.ToInt32(Request.QueryString.Get("page")) >= pagecount||!is_next){ %>class="disabled"<% } %>><a href="<%= next %>">&raquo;</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- left side -->
            <div class="col-xs-12 col-md-4">
                <div class="row top">
                    <div class="col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">标签云</h3>
                            </div>
                            <div class="panel-body">
                                <ul class="tag">
                                    <% foreach (moviesite.Tag tag in moviesite.PublicService.GetTag_List())
                                        { %>
                                    <li><a class="btn btn-default" href="tag.aspx?id=<%= tag.Tagid %>"><%= tag.Name %></a></li>
                                    <% } %>
                                </ul>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">最高票房</h3>
                            </div>
                            <div class="panel-body">
                                <% foreach (moviesite.Movie li in moviesite.PublicService.GetMovie_BoxOffice_List())
                                    { %>

                                <a class="list-group-item text-nowrap"  href="movie.aspx?id=<%= li.MovieId %>">
                                    <% if (li.IsRecommend.ToLower() == "true")
                                        { %><span class="badge">推荐</span><% } %><%= li.Name %></a>
                                <% } %>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">最高评论</h3>
                            </div>
                            <div class="panel-body">
                                <% foreach (moviesite.Movie li in moviesite.PublicService.GetMovie_Comment_List())
                                    { %>
                                <a class="list-group-item text-nowrap"  href="movie.aspx?id=<%= li.MovieId %>"><span class="badge"><%= li.CommentCount %></span>
                                    <%= li.Name %></a>
                                <% } %>
                            </div>
                        </div>
                        <!-- end pannel -->
                        <div class="panel panel-default">
                            <!-- 社交图标列表，其中图标采用的是Font Awesome图标字体库-->
                            <div class="panel-heading">
                                <h3 class="panel-title">关注我们</h3>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-2 col-sm-2 col-xs-2"></div>
                                    <div class="col-md-2 col-sm-2 col-xs-2"><a href="#" title="Twitter Profile"><i class="fa fa-qq fa-2x" aria-hidden="true"></i></a></div>
                                    <div class="col-md-2 col-sm-2 col-xs-2"><a href="#" title="Facebook Page"><i class="fa fa-github fa-2x" aria-hidden="true"></i></a></div>
                                    <div class="col-md-2 col-sm-2 col-xs-2"><a href="#" title="LinkedIn Profile"><i class="fa fa-facebook fa-2x"></i></a></div>
                                    <div class="col-md-2 col-sm-2 col-xs-2"><a href="#" title="Goole+ Profile"><i class="fa fa-weibo fa-2x" aria-hidden="true"></i></a></div>
                                    <div class="col-md-2"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- right side -->
        </div>
    </div>
    <!-- end container  -->
    <!-- footer -->
    <footer class="container-fluid" style="background-color: #e7e7e7;">
        <p align="center" class="top">
            Copyright &copy;2015 Dreyer
        </p>
    </footer>
    <!-- end footer -->
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
</body>

</html>