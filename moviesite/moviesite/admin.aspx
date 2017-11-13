<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs" Inherits="moviesite.admin" %>

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
    <div class="container bottom-50" style="min-height: 600px;">
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
                            <caption>用户列表</caption>
                            <thead>
                                <tr>
                                    <th>用户名</th>
                                    <th>个性签名</th>
                                    <th>全名</th>
                                    <th>邮箱</th>
                                    <th>手机号码</th>
                                    <th>qq号码</th>
                                    <th>个人网站</th>
                                    <th>地址</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Tanmay</td>
                                    <td>Bangalore</td>
                                    <td>560001</td>
                                    <td>Tanmay</td>
                                    <td>Tanmay</td>
                                    <td>Bangalore</td>
                                    <td>560001</td>
                                    <td>Tanmay</td>
                                    <td><a href="#" class="badge" data-toggle="modal" data-target="#userchange">修改</a><a href="?delete=true&userid=1" class="badge">删除</a></td>
                                </tr>
                            </tbody>
                        </table>
                        <button class="btn btn-primary" data-toggle="modal" data-target="#useradd">新增用户</button>
                    </li>
                    <li class='tab-pane fade' id='tab3'>
                        <form role="form">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <div class="form-group">
                                        <h4>当前广告</h4>
                                        <img src="img/aa8df3d16e4209cb64ccfe609ab0985d.jpg" style="max-height: 100px;">
                                        <input type="file" id="avatar1" name="avatar1" />
                                        <p class="help-block">
                                            请选择你的广告。。。
                                        </p>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="form-group">
                                        <h4>当前广告</h4>
                                        <img src="img/aa8df3d16e4209cb64ccfe609ab0985d.jpg" style="max-height: 100px;">
                                        <input type="file" id="avatar2" name="avatar2" />
                                        <p class="help-block">
                                            请选择你的广告。。。
                                        </p>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="form-group">
                                        <h4>当前广告</h4>
                                        <img src="img/aa8df3d16e4209cb64ccfe609ab0985d.jpg" style="max-height: 100px;">
                                        <input type="file" id="avatar3" name="avatar3" />
                                        <p class="help-block">
                                            请选择你的广告。。。
                                        </p>
                                    </div>
                                </li>
                            </ul>
                            <button type="submit" class="btn btn-primary">保存更改</button>
                        </form>
                    </li>
                 </ul>

                <!--修改用户 模态框（Modal） -->
                    <div class="modal fade" id="userchange" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form role="form">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="myModalLabel">修改用户信息</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="name">名字</label>
                                            <input type="text" name="name" class="form-control input-sm" id="name" />
                                        </div>
                                        <div class="form-group">
                                            <label for="password">密码</label>
                                            <input type="password" name="password" class="form-control input-sm" id="password" />
                                        </div>
                                        <div class="form-group">
                                            <label for="description">个性签名</label>
                                            <input type="text" name="description" class="form-control input-sm" id="description" />
                                        </div>
                                        <div class="form-group">
                                            <label for="email">邮箱</label>
                                            <input type="text" name="email" class="form-control input-sm" id="email" />
                                        </div>
                                        <div class="form-group">
                                            <label for="qq">qq号码</label>
                                            <input type="text" name="qq" class="form-control input-sm" id="qq" />
                                        </div>
                                        <div class="form-group">
                                            <label for="url">个人网址</label>
                                            <input type="text" name="url" class="form-control input-sm" id="url" />
                                        </div>
                                        <div class="form-group">
                                            <label for="phone">手机号码</label>
                                            <input type="text" name="phone" class="form-control input-sm" id="phone" />
                                        </div>
                                        <div class="form-group">
                                            <label for="address">地址</label>
                                            <input type="text" name="address" class="form-control input-sm" id="address" />
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        <button type="submit" class="btn btn-primary">提交更改</button>
                                    </div>
                                </form>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal -->
                    </div>
                <!--新增用户 模态框（Modal） -->
                    <div class="modal fade" id="useradd" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form role="form">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                        <h4 class="modal-title" id="myModalLabel">新增用户</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="form-group">
                                            <label for="username">User Name</label>
                                            <input type="text" name="username" class="form-control" id="username" />
                                        </div>
                                        <div class="form-group">
                                            <label for="password">Password</label>
                                            <input type="password" name="password" class="form-control" id="password" />
                                        </div>
                                        <div class="form-group">
                                            <label for="avatar">头像</label>
                                            <input type="file" id="avatar" name="avatar" />
                                            <p class="help-block">
                                                请选择你的头像。。。
                                            </p>
                                        </div>
                                        <div class="form-group">
                                            <label for="name">Name</label>
                                            <input type="text" name="name" class="form-control" id="name" />
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                        <button type="submit" class="btn btn-primary">提交更改</button>
                                    </div>
                                </form>
                            </div>
                            <!-- /.modal-content -->
                        </div>
                        <!-- /.modal -->
                    </div>
            </div><!-- end col -->
        </div><!-- end row -->
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
