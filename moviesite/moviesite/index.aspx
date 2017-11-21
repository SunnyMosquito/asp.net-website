<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="moviesite.index" %>

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
                <a class="navbar-brand" href="<%# HttpContext.Current.Request.Url.Host %>">拉普达</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="about.aspx">About</a></li>
                    <li><a href="#contact">Contact</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">分类<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <% foreach (moviesite.Category cate in category)
                                { %>
                            <li><a href="#"><%= cate.Name %></a></li>
                            <% } %>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <% if (Session["username"] == null)
                        { %>
                    <li><a href="/login.aspx">登录</a></li>
                    <li><a href="/login.aspx">注册</a></li>
                    <% }
                        else
                        { %>
                    <li><a href="../navbar/"><%= Session["username"] %></a></li>
                    <li><a href="?logout=true">退出</a></li>
                    <% } %>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </nav>
    <!-- Fixed navbar -->
    <div class="container">
        <form class="form-inline" role="search">
            <div class="row">
                <br>
                <div class="col-lg-6 col-lg-offset-4 col-md-6 col-md-offset-4 col-sm-6 col-sm-offset-4">
                    <div class="input-group">
                        <input type="text" class="form-control input-md" placeholder="请输入。。。">
                        <span class="input-group-btn">
                            <button class="btn btn-default btn-md" type="button">搜索</button></span>
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
                    <div class="col-xs-12 col-md-12">
                        <div id="myCarousel" class="carousel slide">
                            <!-- 轮播（Carousel）指标 -->
                            <ol class="carousel-indicators">
                                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                <li data-target="#myCarousel" data-slide-to="1"></li>
                                <li data-target="#myCarousel" data-slide-to="2"></li>
                            </ol>
                            <!-- 轮播（Carousel）项目 -->
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img src="img/5f6f9df55a8f6b59b207fb0cf6798edf.gif" alt="First slide">
                                    <div class="carousel-caption">标题 1</div>
                                </div>
                                <div class="item">
                                    <img src="img/d0ea27daa7f57a909306c7be8a262f5c.jpg" alt="Second slide">
                                    <div class="carousel-caption">标题 2</div>
                                </div>
                                <div class="item">
                                    <img src="img/62ef22ab23569100cff195caac58636b.jpg" alt="Third slide">
                                    <div class="carousel-caption">标题 3</div>
                                </div>
                            </div>
                            <!-- 轮播（Carousel）导航 -->
                            <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                            <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
                        </div>
                    </div>
                </div>
                <!-- carousel end -->
                <div class="row top">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">最新推荐<span class="pull-right"><a href="#">more</a></span></h3>
                            </div>
                            <div class="panel-body">
                                <% foreach (moviesite.Movie li in recommend_list)
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
                <div class="row top">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">最多下载<span class="pull-right"><a href="#">more</a></span></h3>
                            </div>
                            <div class="panel-body">
                                <% foreach (moviesite.Movie li in click_count_list)
                                    { %>
                                <a href="#" class="list-group-item">
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
                                    <% foreach (moviesite.Tag tag in taglist)
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
                                <% foreach (moviesite.Movie li in box_office_list)
                                    { %>

                                <a class="list-group-item text-nowrap">
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
                                <% foreach (moviesite.Movie li in comment_list)
                                    { %>
                                <a class="list-group-item text-nowrap"><span class="badge"><%= li.CommentCount %></span>
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
        <!--采用container，使得页尾内容居中 -->
        <div class="container hidden-xs hidden-sm">
            <div class="row">
                <div class="row-content col-lg-2 col-md-2"></div>
                <div class="row-content col-lg-2 col-md-2">
                    <h3>Subscribe</h3>
                    <ul>
                        <li><a href="#">Newsletter</a></li>
                        <li><a href="#">RSS feed</a></li>
                        <li><a href="#">RSS to Email</a></li>
                        <li><a href="#">Product Hunt</a></li>
                        <li><a href="#">Twitter</a></li>
                    </ul>
                </div>
                <div class="row-content col-lg-2 col-md-2">
                    <h3>BROWSE</h3>
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Gallery</a></li>
                        <li><a href="#">Templates</a></li>
                        <li><a href="#">Resources</a></li>
                        <li><a href="#">OPL Themes</a></li>
                    </ul>
                </div>
                <div class="row-content col-lg-2 col-md-2">
                    <h3>INFORMA</h3>
                    <ul>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Why One Page?</a></li>
                        <li><a href="#">OPL Blog</a></li>
                        <li><a href="#">Product Hunt</a></li>
                        <li><a href="#">Advertise</a></li>
                    </ul>
                </div>
                <div class="row-content col-lg-2 col-md-2">
                    <h3>RESOURCES</h3>
                    <ul>
                        <li><a href="#">Browse All</a></li>
                        <li><a href="#">Design</a></li>
                        <li><a href="#">Development</a></li>
                        <li><a href="#">Hosting</a></li>
                        <li><a href="#">Round Ups</a></li>
                    </ul>
                </div>
                <div class="row-content col-lg-2 col-md-2"></div>
            </div>
            <!--/.row -->
        </div>
        <!--/.container-->
        <p align="center" class="top">
            Copyright &copy;2015 Dreyer
        </p>
    </footer>
    <!-- end footer -->
    <script type="text/javascript" src="js/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
</body>

</html>
