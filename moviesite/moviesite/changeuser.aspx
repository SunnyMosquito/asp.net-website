<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="changeuser.aspx.cs" Inherits="moviesite.changeuser" %>

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
                <a class="navbar-brand" href="/">拉普达</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a>欢迎,admin</a></li>
                    <li><a href="/">去我的网站</a></li>
                    <li><a href="?logout=true">退出</a></li>
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
                    <h1>更改用户信息</h1>
                </div>
                <form role="form" action="<%= Request.Url %>" method="post" enctype="multipart/form-data" >
                    <div class="form-group">
                        <label for="name">名字</label>
                        <input type="text" name="name" class="form-control input-sm" id="name" value="<%= myuser.Name %>" />
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="password" name="password" class="form-control input-sm" id="password" value="<%= myuser.PassWord %>"/>
                    </div>
                    <div class="form-group">
                        <label for="description">个性签名</label>
                        <input type="text" name="description" class="form-control input-sm" id="description" value="<%= myuser.Description %>"/>
                    </div>
                    <div class="form-group">
                        <label for="email">邮箱</label>
                        <input type="text" name="email" class="form-control input-sm" id="email" value="<%= myuser.Email %>"/>
                    </div>
                    <div class="form-group">
                        <label for="qq">qq号码</label>
                        <input type="text" name="qq" class="form-control input-sm" id="qq" value="<%= myuser.Qq %>"/>
                    </div>
                    <div class="form-group">
                        <label for="url">个人网址</label>
                        <input type="text" name="url" class="form-control input-sm" id="url" value="<%= myuser.Url %>"/>
                    </div>
                    <div class="form-group">
                        <label for="phone">手机号码</label>
                        <input type="text" name="phone" class="form-control input-sm" id="phone" value="<%= myuser.Phone %>"/>
                    </div>
                    <div class="form-group">
                        <label for="address">地址</label>
                        <input type="text" name="address" class="form-control input-sm" id="address" value="<%= myuser.Address %>"/>
                    </div>
                    <button type="submit" class="btn btn-primary">提交更改</button>
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
                    name: {
                        message: '名称验证失败',
                        validators: {
                            notEmpty: {
                                message: '名称不能为空'
                            },
                            stringLength: {
                                min: 1,
                                max: 50,
                                message: '名称长度必须在1到50位之间'
                            },
                            regexp: {
                                regexp: /^[^'"`‘“]+$/,
                                message: '名称包含敏感字符'
                            }
                        }
                    },
                    image: {
                        validators: {
                            notEmpty: {
                                message: '图像不能为空'
                            }
                        }
                    },
                    summary: {
                        message: '简介验证失败',
                        validators: {
                            notEmpty: {
                                message: '简介不能为空'
                            },
                            stringLength: {
                                min: 1,
                                max: 200,
                                message: '名称长度必须在1到200位之间'
                            },
                            regexp: {
                                regexp: /^[^'"]+$/,
                                message: '名称包含敏感字符'
                            }
                        }
                    },
                    url: {
                        validators: {
                            notEmpty: {
                                message: '票房不能为空'
                            },
                            stringLength: {
                                min: 1,
                                max: 200,
                                message: '名称长度必须在1到200位之间'
                            },
                            regexp: {
                                regexp: /^[^'"]+$/,
                                message: '名称包含敏感字符'
                            }
                        }
                    },
                    password: {
                        validators: {
                            notEmpty: {
                                message: '密码不能为空'
                            },
                            stringLength: {
                                min: 4,
                                max: 18,
                                message: '密码长度必须在4到18位之间'
                            },
                        }
                    }
                }
            });
        });
    </script>
</body>

</html>
