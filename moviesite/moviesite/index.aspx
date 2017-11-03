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
                    <li><a href="../navbar/">登录</a></li>
                    <li><a href="../navbar-static-top/">注册</a></li>
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
                        <span class="input-group-btn"><button class="btn btn-default btn-md" type="button">搜索</button></span>
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
                                <a href="#" class="list-group-item">
                                    <div class="row">
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <img src="img/9ebd5a8fcd91264f6dae5d823a863306.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-9">
                                            <h4>入门网站包</h4>
                                            <p>以下实例包含了4个网格，但是我们在小设备浏用工具来解决，如下我们在小设备浏览时无法确定网格显示的位置。 为了解决这个问题，可以使用 .clearfix class和 响应式实用工具来解决，如下我解决，如下我们在小设备浏览时无法确定网格显示的位置。 为了解决这个问题，可以使用 .clearfix class和 响应式实用工具来解决，如下我们在小设备浏览时无法确定网格显示的位置。 为了解决这个问题，可以使用 .clearfix class和 响应式实用工具来解决，如下面实例所示：</p>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="list-group-item">
                                    <div class="row">
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <img src="img/40e656b461c4df046cc72ceb271bd74d.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-9">
                                            <h4>入门网站包</h4>
                                            <p>栏目子栏目这么写的是，栏目和子栏目的字样都是靠底边对齐的，但是添加了pull-right之后：栏目子栏目栏目 是靠右边了，但是却往顶边对齐了。那么怎么才能让它往底边对</p>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="list-group-item">
                                    <div class="row">
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <img src="img/ce17edbce8482f7f4bfbe8f5dd9e3af4.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-9">
                                            <h4 class="list-group-item-heading">入门网站包</h4>
                                        </div>
                                    </div>
                                </a>
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
                                <a href="#" class="list-group-item">
                                    <div class="row">
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <img src="img/9ebd5a8fcd91264f6dae5d823a863306.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-9">
                                            <h4>入门网站包</h4>
                                            <p>以下实例包含了4个网格，但是我们在小设备浏用工具来解决，如下我们在小设备浏览时无法确定网格显示的位置。 为了解决这个问题，可以使用 .clearfix class和 响应式实用工具来解决，如下我解决，如下我们在小设备浏览时无法确定网格显示的位置。 为了解决这个问题，可以使用 .clearfix class和 响应式实用工具来解决，如下我们在小设备浏览时无法确定网格显示的位置。 为了解决这个问题，可以使用 .clearfix class和 响应式实用工具来解决，如下面实例所示：</p>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="list-group-item">
                                    <div class="row">
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <img src="img/40e656b461c4df046cc72ceb271bd74d.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-9">
                                            <h4>入门网站包</h4>
                                            <p>栏目子栏目这么写的是，栏目和子栏目的字样都是靠底边对齐的，但是添加了pull-right之后：栏目子栏目栏目 是靠右边了，但是却往顶边对齐了。那么怎么才能让它往底边对</p>
                                        </div>
                                    </div>
                                </a>
                                <a href="#" class="list-group-item">
                                    <div class="row">
                                        <div class="col-md-3 col-sm-3 col-xs-3">
                                            <img src="img/ce17edbce8482f7f4bfbe8f5dd9e3af4.jpg" class="img-responsive" alt="">
                                        </div>
                                        <div class="col-md-9 col-sm-9 col-xs-9">
                                            <h4 class="list-group-item-heading">入门网站包</h4>
                                        </div>
                                    </div>
                                </a>
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
                                    <li><a class="btn btn-default" href="#">12</a></li>
                                    <li><a class="btn btn-default" href="#">234</a></li>
                                    <li><a class="btn btn-default" href="#">6哈哈7</a></li>
                                    <li><a class="btn btn-default" href="#">8</a></li>
                                    <li><a class="btn btn-default" href="#">9</a></li>
                                    <li><a class="btn btn-default" href="#">123</a></li>
                                    <li><a class="btn btn-default" href="#">4剧情5</a></li>
                                    <li><a class="btn btn-default" href="#">678</a></li>
                                    <li><a class="btn btn-default" href="#">12</a></li>
                                    <li><a class="btn btn-default" href="#">12</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">最高票房</h3>
                            </div>
                            <div class="panel-body">
                                <a class="list-group-item text-nowrap">免费域名注册</a>
                                <a class="list-group-item text-nowrap">免费 Window 空间托管</a>
                                <a class="list-group-item text-nowrap">图像的数图像的数量图像的数量图像的数量图像的数量图像的数量量</a>
                                <a class="list-group-item text-nowrap">
                                    <span class="badge">新</span> 24*7 支持
                                </a>
                                <a class="list-group-item text-nowrap">每年更新成本</a>
                                <a class="list-group-item text-nowrap">
                                    <span class="badge">新</span> 折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠
                                </a>
                                <a class="list-group-item text-nowrap">每年更新成本</a>
                                <a class="list-group-item text-nowrap">
                                    <span class="badge">新</span> 折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠
                                </a>
                                <a class="list-group-item text-nowrap">每年更新成本</a>
                                <a class="list-group-item text-nowrap">
                                    <span class="badge">新</span> 折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠
                                </a>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title">最高评论</h3>
                            </div>
                            <div class="panel-body">
                                <a class="list-group-item text-nowrap">免费域名注册</a>
                                <a class="list-group-item text-nowrap">免费 Window 空间托管</a>
                                <a class="list-group-item text-nowrap">图像的数图像的数量图像的数量图像的数量图像的数量图像的数量量</a>
                                <a class="list-group-item text-nowrap">
                                    <span class="badge">新</span> 24*7 支持
                                </a>
                                <a class="list-group-item text-nowrap">每年更新成本</a>
                                <a class="list-group-item text-nowrap">
                                    <span class="badge">新</span> 折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠
                                </a>
                                <a class="list-group-item text-nowrap">每年更新成本</a>
                                <a class="list-group-item text-nowrap">
                                    <span class="badge">新</span> 折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠
                                </a>
                                <a class="list-group-item text-nowrap">每年更新成本</a>
                                <a class="list-group-item text-nowrap">
                                    <span class="badge">新</span> 折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠折扣优惠
                                </a>
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