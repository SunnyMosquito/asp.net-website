﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="moviechange.aspx.cs" Inherits="moviesite.moviechange" %>

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
                <a class="navbar-brand" href="#">拉普达</a>
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
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6">
                <div class="page-header">
                    <h1>更改movie</h1>
                </div>
                <form role="form">
                    <div class="form-group">
                        <label for="name">名称</label>
                        <input type="text" class="form-control" id="name" placeholder="请输入名称">
                    </div>
                    <div class="form-group">
                        <label for="image">图像</label>
                        <input type="file" id="image">
                        <p class="help-block">请选择图像，下面是当前图像</p>
                        <img src="https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1109204397,2942247306&fm=27&gp=0.jpg" alt="">
                    </div>
                    <div class="form-group">
                        <label for="summary">简介</label>
                        <textarea class="form-control" id="summary" placeholder="请输入名称" rows="5"></textarea>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="is_recommend">是否推荐
                        </label>
                    </div>
                    <div class="form-group">
                        <label for="boxoffice">票房</label>
                        <input type="text" class="form-control" id="boxoffice" placeholder="请输入票房" name="boxoffice">
                    </div>
                    <div class="form-group">
                        <label for="grade">评分</label>
                        <input type="text" class="form-control" id="grade" placeholder="请输入评分" name="grade">
                    </div>
                    <div class="form-group">
                        <label for="url">链接</label>
                        <input type="text" class="form-control" id="url" placeholder="请输入链接" name="url">
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="text" class="form-control" id="password" placeholder="请输入链接密码" name="password">
                    </div>
                    <div class="form-group">
                        <label for="type">类型</label>
                        <input type="text" class="form-control" id="type" placeholder="请输入电影类型" name="type">
                    </div>
                    <div class="form-group">
                        <label for="duration">时长</label>
                        <input type="text" class="form-control" id="duration" placeholder="请输入电影时长" name="duration">
                    </div>
                    <div class="form-group">
                        <label for="director">导演</label>
                        <input type="text" class="form-control" id="director" placeholder="请输入导演" name="director">
                    </div>
                    <div class="form-group">
                        <label for="scriptwriter">编剧</label>
                        <input type="text" class="form-control" id="scriptwriter" placeholder="请输入编剧" name="scriptwriter">
                    </div>
                    <div class="form-group">
                        <label for="director">演员</label>
                        <input type="text" class="form-control" id="director" placeholder="请输入演员" name="director">
                    </div>
                    <div class="form-group">
                        <label for="date_release">上映时间</label>
                        <input type="date" class="form-control" id="date_release" name="date_release">
                    </div>
                    <div class="form-group">
                        <label for="language">语言</label>
                        <input type="text" class="form-control" id="language" placeholder="请输入语言" name="language">
                    </div>
                    <div class="form-group">
                        <label for="category_id">选择列表</label>
                        <select class="form-control" id="category_id" name="category_id">
                            <option>1</option>
                            <option>2</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-default">提交</button>
                </form>
            </div>
            <div class="col-md-3"></div>
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