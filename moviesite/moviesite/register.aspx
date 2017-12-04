<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="moviesite.register" %>

<!DOCTYPE html>
<html lang="zh">

<head>
    <meta charset="UTF-8">
    <title>注册</title>
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
                <a class="navbar-brand" href="/">拉普达</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a href="/">Home</a></li>
                    <li><a href="about.aspx">About</a></li>
                    <li><a href="contact.aspx">Contact</a></li>
                    <li><a href="message.aspx">留言板</a></li>
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
                    <li><a href="/login.aspx">登录</a></li>
                </ul>
            </div>
            <!--/.nav-collapse -->
        </div>
    </nav>
    <!-- Fixed navbar -->
    <div class="container">
        <div class="row top-50 bottom-50 clearfix">
            <div class="col-md-3 col-sm-2 col-xs-1 column">
            </div>
            <div class="col-md-6 col-sm-8 col-xs-10 column">
                <form role="form" action="<%= Request.Url %>" method="post" enctype="multipart/form-data" >
                    <div class="form-group">
                        <label for="exampleInputEmail1">Email address</label>
                        <input type="email" name="email" class="form-control" id="exampleInputEmail1" />
                    </div>
                    <div class="form-group">
                        <label for="InputUserName">User Name</label>
                        <input type="text" name="username" class="form-control" id="InputUserName" />
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" name="password" class="form-control" id="password" />
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Retype Password</label>
                        <input type="password" name="confirmPassword" class="form-control" id="confirmPassword" />
                    </div>
                    <div class="form-group">
                        <label for="exampleInputFile">头像</label>
                        <input type="file" id="exampleInputFile" name="avatar"/>
                        <p class="help-block">
                            请选择你的头像。。。
                        </p>
                    </div>
                    <button type="submit" class="btn btn-default">提交</button>
                </form>
                <div class="panel panel-default top bottom">
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
    <script type="text/javascript">
        $(function () {
            $('form').bootstrapValidator({
                message: 'This value is not valid',
                feedbackIcons: {
                    valid: 'glyphicon glyphicon-ok',
                    invalid: 'glyphicon glyphicon-remove',
                    validating: 'glyphicon glyphicon-refresh'
                },
                fields: {
                    username: {
                        message: '用户名验证失败',
                        validators: {
                            notEmpty: {
                                message: '用户名不能为空'
                            },
                            stringLength: {
                                min: 5,
                                max: 18,
                                message: '用户名长度必须在5到16位之间'
                            },
                            regexp: {
                                regexp: /^[a-zA-Z0-9_]+$/,
                                message: '用户名只能包含大写、小写、数字和下划线'
                            }
                        }
                    },
                    email: {
                        validators: {
                            notEmpty: {
                                message: '邮箱不能为空'
                            },
                            emailAddress: {
                                message: '邮箱地址格式有误'
                            }
                        }
                    },
                    avatar: {
                        validators: {
                            notEmpty: {
                                message: '头像不能为空'
                            }
                        }
                    },
                    password: {
                        validators: {
                            notEmpty: {
                                message: '密码不能为空'
                            },
                            stringLength: {
                                min: 6,
                                max: 18,
                                message: '密码长度必须在6到18位之间'
                            },
                        }
                    },
                    confirmPassword: {
                        validators: {
                            notEmpty: {
                                message: '确认密码不能为空'
                            },
                            identical: {
                                field: 'password',
                                message: '两次输入不一样'
                            },
                            different: {
                                field: 'username',
                                message: '密码跟用户名不能相同'
                            }
                        }
                    },
                }
            });
        });
    </script>
</body>

</html>