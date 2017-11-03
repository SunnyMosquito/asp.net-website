﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SQLite;
namespace moviesite
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.RequestType.ToLower() == "post")
            {
                string username = Request.Form["username"];
                string password = Request.Form["password"];
                //Response.Write("<script type='text/javascript'>alert('haha');</script>");
                string sql = string.Format("select * from user where username=@para1 and password=@para2");
                SQLiteParameter[] sps = new SQLiteParameter[]{
                    new SQLiteParameter("@para1",username),
                    new SQLiteParameter("@para2",password)
                };
                if (SQLiteHelper.Exists(sql, sps))
                {
                    Session["username"] = username;
                    if (Is_superuser(username,password))
                    {
                        string next = Request.QueryString["next"];
                        Session["is_superuser"] = "true";
                        Response.Redirect(next);
                    }
                    else
                    {
                        Response.Redirect("/index.aspx");
                    }
                }
            }
        }

        private bool Is_superuser(string username,string password)
        {
            //string sql = string.Format("select is_superuser from user where username=@para1");
            //SQLiteParameter[] sps = new SQLiteParameter[] {
            //    new SQLiteParameter("@para1",username)
            //};
            //return bool.Parse(SQLiteHelper.ExecuteScalar(sql));
            string sql = string.Format("select * from user where username=@para1 and password=@para2 and is_superuser='true'");
            SQLiteParameter[] sps = new SQLiteParameter[] {
                new SQLiteParameter("@para1",username),
                new SQLiteParameter("@para2",password)
            };
            return SQLiteHelper.Exists(sql, sps);
        }
    }

    /// <summary>
    /// 所有的aspx.cs页面必须继承的基类,用于全局判断用户是否登陆.
    /// </summary>
    public class BasePage : System.Web.UI.Page
    {
        public BasePage()
        {
        }
        protected override void OnInit(EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("~/login.aspx?next="+ HttpContext.Current.Request.Path);
            }
            base.OnInit(e);
        }
    }
}