<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="message.aspx.cs" Inherits="moviesite.message" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>拉普达电影资源分享</title>
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
                    <li><a href="/">Home</a></li>
                    <li><a href="about.aspx">About</a></li>
                    <li><a href="contact.aspx">Contact</a></li>
                    <li class="active"><a href="message.aspx">留言板</a></li>
                    <li class="dropdown">
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
        <div class="row top-50 bottom-50 clearfix">
            <div class="col-md-2 col-sm-2 col-xs-1 column">
            </div>
            <div class="col-md-8 col-sm-8 col-xs-10 column">
                <form role="form" action="message.aspx" method="post">
                    <div class="form-group">
                        <label for="content">输入你想说的内容：</label>
                        <textarea class="form-control" id="content" rows="5" name="content"></textarea>
                    </div>
                    <button type="submit" class="btn btn-default">提交</button>
                </form>
                <div class="panel panel-default top-50 bottom-50">
                    <div class="panel-heading">
                        <h3 class="panel-title">留言版</h3>
                    </div>
                    <div class="panel-body">
                        <% foreach (moviesite.Message li in MessageList())
                            { %>
                        <blockquote>
                            <%= li.Content %>
                            <small><%= li.UserName %><cite title="Source Title">&nbsp;&nbsp;&nbsp;&nbsp;<%= li.DateRelease %></cite></small>
                        </blockquote>
                        <% } %>
                    </div>
                </div>
            </div>
            <div class="col-md-2 col-sm-2 col-xs-1 column">
            </div>
        </div>
     </div>
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
