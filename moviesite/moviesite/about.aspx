<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="moviesite.about" %>

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
                    <li class="active"><a href="about.aspx">About</a></li>
                    <li><a href="#contact">Contact</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">分类<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <% foreach (moviesite.Category cate in moviesite.CategoryControl.GetCategory())
                                { %>
                            <li><a href="#"><%= cate.Name %></a></li>
                            <% } %>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <% if (Session["username"] == null)
                        { %>
                    <li><a href="login.aspx">登录</a></li>
                    <li><a href="register.aspx">注册</a></li>
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

    <div class="container bottom-50 top-50">
        <div class="row">
            <div class="col-md-2 ">
            </div>
            <div class="col-md-8">
                <article class="post page">
                    <section class="post-content">
                        <h2>关于我们</h2>
                        <p>Bootstrap中文网 -- www.bootcss.com 创建于2012年。起因是国内没有较好的关于Bootstrap的中文教程和交流渠道，因此，我们对Bootstrap的文档进行了翻译整理，并且建立了QQ群和微博（<a href="http://weibo.com/bootcss">@bootcss</a>），方便更多热爱这个CSS框架的攻城师们分享、交流自己在前端设计、开发方面的心得。</p>
                        <h2 id="-bootstrap-">展示你的Bootstrap作品</h2>
                        <p>你是Bootstrap粉丝吗？你正在用Bootstrap做开发吗？你开发的网站是 Powered By Bootstrap 的吗？那就把你的网站show出来吧！</p>
                        <p>凡是经过确认采用Bootstrap CSS框架的网站，我们会将你所提交网站的截图及介绍展示到“Bootstrap优站精选”列表中，并有机会在 Bootstrap中文网 的首页进行推荐。</p>
                        <blockquote>
                            <p>请发邮件到下面的邮箱，并在邮件标题上注明（Bootstrap网站作品提交 -- 网站名称或网址）。
                                <br>Mail： admin@bootcss.com</p>
                        </blockquote>
                        <h2>加入我们</h2>
                        <p>Bootstrap中文网致力于前端开发推广，坚持分享、开放的互联网精神，旨在为广大前端攻城师、设计师提供交流的平台，如果你和我们有相同的目标，我们乐意一起携手前行。</p>
                        <p>如果你也热爱前端开发、热爱 Bootstrap，有一颗创业的心，欢迎和我们联系，更欢迎你加入我们的团队！</p>
                        <p>Mail: admin@bootcss.com</p>
                    </section>
                </article>
            </div>
            <div class="col-md-2"></div>
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