<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="moviesite.login" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>登录</title>
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
                    <li><a href="../navbar/">登录</a></li>
                    <li><a href="../navbar-static-top/">注册</a></li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </nav>
    <!-- Fixed navbar -->
    <div class="container" style="min-height: 600px;">
        <div class="row top-50 bottom-50 clearfix">
            <div class="col-md-3 col-sm-2 col-xs-1 column">
            </div>
            <div class="col-md-6 col-sm-8 col-xs-10 column">
                <form role="form" action="<%= Request.Url %>" method="post">
                    <div class="form-group">
                        <label for="InputUserName">User Name</label>
                        <input type="text" name="username" class="form-control" id="InputUserName" />
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Password</label>
                        <input type="password" name="password" class="form-control" id="exampleInputPassword1" />
                    </div>
                    <button type="submit" class="btn btn-default">登录</button>
                </form>
                <div class="panel panel-default top-50 bottom-50">
                    <!-- 社交图标列表，其中图标采用的是Font Awesome图标字体库-->
                    <div class="panel-heading">
                        <h3 class="panel-title">其他方式登录</h3>
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
            <div class="col-md-3 col-sm-2 col-xs-1 column">
            </div>
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
    <script type="text/javascript" src="js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="js/validator.js?d=<%= DateTime.Now %> ">
    </script>
</body>

</html>
