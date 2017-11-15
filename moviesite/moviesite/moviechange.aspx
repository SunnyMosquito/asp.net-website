<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="moviechange.aspx.cs" Inherits="moviesite.moviechange" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>moviechange</title>
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
                    <h1>更改movie</h1>
                </div>
                <form role="form" action="<%= Request.Url %>" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="name">名称</label>
                        <input type="text" class="form-control" id="name" placeholder="请输入名称" name="name" value="<%= mymovie.Name %>">
                    </div>
                    <div class="form-group">
                        <label for="image">图像</label>
                        <input type="file" id="image" name="image">
                        <p class="help-block">请选择图像，下面是当前图像</p>
                        <img src="<%= mymovie.Image %>" alt="">
                    </div>
                    <div class="form-group">
                        <label for="summary">简介</label>
                        <textarea class="form-control" id="summary" placeholder="请输入名称" rows="5" name="summary"><%= mymovie.Summary %></textarea>
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" name="isrecommend" <% if (mymovie.IsRecommend == "true")
                                {%>checked<% } %>/>是否推荐<%= mymovie.IsRecommend %>
                        </label>
                    </div>
                    <div class="form-group">
                        <label for="boxoffice">票房</label>
                        <input type="text" class="form-control" id="boxoffice" placeholder="请输入票房" name="boxoffice" value="<%= mymovie.BoxOffice %>">
                    </div>
                    <div class="form-group">
                        <label for="grade">评分</label>
                        <input type="text" class="form-control" id="grade" placeholder="请输入评分" name="grade" value="<%= mymovie.Grade %>">
                    </div>
                    <div class="form-group">
                        <label for="url">链接</label>
                        <input type="text" class="form-control" id="url" placeholder="请输入链接" name="url" value="<%= mymovie.Url %>">
                    </div>
                    <div class="form-group">
                        <label for="password">密码</label>
                        <input type="text" class="form-control" id="password" placeholder="请输入链接密码" name="password" value="<%= mymovie.Password %>">
                    </div>
                    <div class="form-group">
                        <label for="type">类型</label>
                        <input type="text" class="form-control" id="type" placeholder="请输入电影类型" name="type" value="<%= mymovie.Type %>">
                    </div>
                    <div class="form-group">
                        <label for="duration">时长</label>
                        <input type="text" class="form-control" id="duration" placeholder="请输入电影时长" name="duration" value="<%= mymovie.Duration %>">
                    </div>
                    <div class="form-group">
                        <label for="director">导演</label>
                        <input type="text" class="form-control" id="director" placeholder="请输入导演" name="director" value="<%= mymovie.Director %>">
                    </div>
                    <div class="form-group">
                        <label for="scriptwriter">编剧</label>
                        <input type="text" class="form-control" id="scriptwriter" placeholder="请输入编剧" name="scriptwriter" value="<%= mymovie.Scriptwriter %>">
                    </div>
                    <div class="form-group">
                        <label for="actor">演员</label>
                        <input type="text" class="form-control" id="actor" placeholder="请输入演员" name="actor" value="<%= mymovie.Actor %>">
                    </div>
                    <div class="form-group">
                        <label for="date_release">上映时间</label>
                        <input type="date" class="form-control" id="date_release" name="daterelease" value="<%= mymovie.DateRelease.ToString("yyyy-MM-dd") %>">
                    </div>
                    <div class="form-group">
                        <label for="language">语言</label>
                        <input type="text" class="form-control" id="language" placeholder="请输入语言" name="language" value="<%= mymovie.Language %>">
                    </div>
                    <div class="form-group">
                        <label for="category_id">分类</label>
                        <select class="form-control" id="category_id" name="categoryid">
                            <% foreach (moviesite.Category li in category)
                                { %>
                                <option value="<%= li.Categoryid %>" <% if (mymovie.CategoryId == li.Categoryid){ %>selected<% } %>><%= li.Name %></option>
                            <% } %>
                            <option value="xixi">haha</option>
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
    <script type="text/javascript">
    $(function() {
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
                boxoffice: {
                    validators: {
                        notEmpty: {
                            message: '票房不能为空'
                        },
                        stringLength: {
                            min: 1,
                            max: 50,
                            message: '名称长度必须在1到50位之间'
                        },
                        regexp: {
                            regexp: /^[^'"]+$/,
                            message: '名称包含敏感字符'
                        }
                    }
                },
                grade: {
                    validators: {
                        notEmpty: {
                            message: '评分不能为空'
                        },
                        stringLength: {
                            min: 1,
                            max: 10,
                            message: '评分长度必须在1到10位之间'
                        },
                        regexp: {
                            regexp: /^([0-9]+.[0-9]+)|[0-9]+$/,
                            message: '请输入正确的分数'
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
                },
                type: {
                    validators: {
                        notEmpty: {
                            message: '类型不能为空'
                        },
                        stringLength: {
                            min: 1,
                            max: 50,
                            message: '类型长度必须在1到50位之间'
                        },
                    }
                },
                duration: {
                    validators: {
                        notEmpty: {
                            message: '时长不能为空'
                        },
                        stringLength: {
                            min: 1,
                            max: 10,
                            message: '时长长度必须在1到10位之间'
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: '只能输入数字'
                        }
                    }
                },
                director: {
                    validators: {
                        notEmpty: {
                            message: '导演不能为空'
                        },
                        stringLength: {
                            min: 1,
                            max: 50,
                            message: '名称长度必须在1到50位之间'
                        },
                        regexp: {
                            regexp: /^[^'"]+$/,
                            message: '名称包含敏感字符'
                        }
                    }
                },
                scriptwriter: {
                    validators: {
                        notEmpty: {
                            message: '编剧不能为空'
                        },
                        stringLength: {
                            min: 1,
                            max: 50,
                            message: '编剧长度必须在1到50位之间'
                        },
                        regexp: {
                            regexp: /^[^'"]+$/,
                            message: '包含敏感字符'
                        }
                    }
                },
                actor: {
                    validators: {
                        notEmpty: {
                            message: '演员不能为空'
                        },
                        stringLength: {
                            min: 1,
                            max: 200,
                            message: '演员长度必须在1到200位之间'
                        },
                        regexp: {
                            regexp: /^[^'"]+$/,
                            message: '包含敏感字符'
                        }
                    }
                },
                date_release:{
                    validators:{
                        notEmpty: {
                            message: '时间不能为空'
                        }
                    }
                },
                language: {
                    validators: {
                        notEmpty: {
                            message: '语言不能为空'
                        },
                        stringLength: {
                            min: 1,
                            max: 20,
                            message: '语言长度必须在1到20位之间'
                        },
                        regexp: {
                            regexp: /^[^'"]+$/,
                            message: '包含敏感字符'
                        }
                    }
                },
                category_id: {
                    validators: {
                        notEmpty: {
                            message: '分类不能为空'
                        }
                    }
                },
            }
        });
    });
    </script>
</body>

</html>