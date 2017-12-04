<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="moviesite.contact" %>

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
                    <li class="active"><a href="contact.aspx">Contact</a></li>
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
            <div class="col-md-3 col-sm-2 col-xs-1 column">
            </div>
            <div class="col-md-6 col-sm-8 col-xs-10 column">
                <form role="form" action="contact.aspx" method="post" >
                    <div class="form-group">
                        <label for="Name">Name</label>
                        <input type="text" name="name" class="form-control" id="Name" />
                    </div>
                    <div class="form-group">
                        <label for="Email">Your Email</label>
                        <input type="text" name="email" class="form-control" id="Email" />
                    </div>
                    <div class="form-group">
                        <label for="Content">Content</label>
                        <textarea class="form-control" id="Content" rows="8" name="content"></textarea>
                    </div>
                    <button type="submit" class="btn btn-default">提交</button>
                </form>
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
                    name: {
                        message: '名字验证失败',
                        validators: {
                            notEmpty: {
                                message: '名字不能为空'
                            },
                            stringLength: {
                                min: 1,
                                max: 50,
                                message: '名字长度必须在1到50位之间'
                            },
                            regexp: {
                                regexp: /^[^'"`‘“]+$/,
                                message: '名称包含敏感字符'
                            }
                        }
                    },
                    content: {
                        validators: {
                            notEmpty: {
                                message: '内容不能为空'
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
                }
            });
        });
    </script>
</body>

</html>