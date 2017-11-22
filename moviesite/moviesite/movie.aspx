﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="movie.aspx.cs" Inherits="moviesite.movie" %>

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
                <a class="navbar-brand" href="#">拉普达</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#contact">Contact</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">分类<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">剧情</a></li>
                            <li><a href="#">动作</a></li>
                            <li><a href="#">爱情</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="login.aspx">登录</a></li>
                    <li><a href="register.aspx">注册</a></li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </nav>
    <!-- Fixed navbar -->
    <div class="container">
        <form class="form-inline" role="search" align="center">
            <br>
            <div class="input-group">
                <input type="text" class="form-control input-md" placeholder="请输入。。。">
                <span class="input-group-btn"><button class="btn btn-default btn-md" type="button">搜索</button></span>
            </div>
        </form>
        <div class="row">
            <div class="col-xs-12 col-md-8">
                <div class="row top">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><%= mymovie.Name %></h3>
                            </div>
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-4"><img src="img/9ebd5a8fcd91264f6dae5d823a863306.jpg" class="img-responsive"></div>
                                    <div class="col-md-8">
                                        <div id="info">
                                            <span>导演:<span><%= mymovie.Director %></span></span>
                                            <br>
                                            <br>
                                            <span>编剧:<span><%= mymovie.Scriptwriter %></span></span>
                                            <br>
                                            <br>
                                            <span>演员:<span><%= mymovie.Actor %></span></span>
                                            <br>
                                            <br>
                                            <span>类型<span>:<%= mymovie.Type %></span></span>
                                            <br>
                                            <br>
                                            <span>语言:<span><%= mymovie.Language %></span></span>
                                            <br>
                                            <br>
                                            <span>片长:<span><%= mymovie.Duration %></span></span>
                                            <br>
                                            <br>
                                            <span>票房:<span><%= mymovie.BoxOffice %></span></span>
                                            <br>
                                            <br>
                                            <span>上映时间:<span><%= mymovie.DateRelease %></span></span>
                                            <br>
                                            <br>
                                            <span>上传时间:<span><%= mymovie.DateUpload %></span></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-2"></div>
                                    <div class="col-md-8">
                                        <h3>简介</h3>
                                        <p>
                                            <%= mymovie.Summary %>
                                        </p>
                                        <div class="url top-50">
                                            <h5>观看链接：</h5><a href="<%= mymovie.Url %>"><%= mymovie.Url %></a>
                                            <h5>密码：</h5><%= mymovie.Password %>
                                        </div>
                                        <div class="comment top-50 bottom-50">
                                            <h5>评论</h5>
                                            <span>张三李四：<span>他们似乎无法阻止敌人对地球的进攻</span></span>
                                            <br>
                                            <br>
                                            <span>张三李四：<span>他们似乎无法阻止敌人对地球的进攻</span></span>
                                            <br>
                                            <br>
                                            <span>张三李四：<span>他们似乎无法阻止敌人对地球的进攻</span></span>
                                            <br>
                                            <br>
                                            <span>张三李四：<span>他们似乎无法阻止敌人对地球的进攻</span></span>
                                            <br>
                                            <br>
                                        </div>
                                    </div>
                                    <div class="col-md-2"></div>
                                </div>
                            </div>
                        </div>
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

                                <a class="list-group-item text-nowrap" href="movie.aspx?id=<%= li.MovieId %>">
                                    <% if (li.IsRecommend.ToLower() == "true")
                                        { %><span class="badge">推荐</span><% } %><%= li.Name %></a>
                                <% } %>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">最多评论</h3>
                            </div>
                            <div class="panel-body">
                                <% foreach (moviesite.Movie li in moviesite.PublicService.GetMovie_Comment_List())
                                    { %>
                                <a class="list-group-item text-nowrap" href="movie.aspx?id=<%= li.MovieId %>"><span class="badge"><%= li.CommentCount %></span>
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