﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SQLite;
namespace moviesite
{
    public partial class moviechange : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("~/login.aspx?next=" + HttpContext.Current.Request.Path);
            }
            if (!(Session["is_superuser"].ToString() == "true"))
            {
                Response.Redirect("~/index.aspx");
            }
            if (Request.QueryString["logout"] == "true")
            {
                Session["username"] = null;
                Session["is_superuser"] = null;
                Response.Redirect("login.aspx");
            }
            if (Request.QueryString["add"] == "true" && Request.RequestType.ToLower() == "post")
            {
                Movie movie = new Movie();
                movie.Name = Request.Form["name"];
                if (Request.Files.Count > 0)
                {
                    HttpPostedFile f = Request.Files["image"];//multipart/form-data
                    f.SaveAs(Server.MapPath("002.jpg"));
                }
                //movie.Image = Request.Form["image"];
                //Request.Files["image"].SaveAs(Server.MapPath("~/") +"hahe.jpg"); //Path.GetFileName(Request.Files["file"].FileName));
                movie.Summary = Request.Form["summary"];
                movie.IsRecommend = Request.Form["isrecommend"];
                movie.BoxOffice = Request.Form["boxoffice"];
                movie.Grade =Convert.ToDouble(Request.Form["grade"]);
                movie.Url = Request.Form["url"];
                movie.Password = Request.Form["password"];
                movie.DateUpload =Convert.ToDateTime(Request.Form["dateupload"]);
                movie.Type = Request.Form["type"];
                movie.Duration =Convert.ToInt32(Request.Form["duration"]);
                movie.Director = Request.Form["director"];
                movie.Scriptwriter = Request.Form["scriptwrite"];
                movie.Actor = Request.Form["actor"];
                movie.DateRelease = Convert.ToDateTime(Request.Form["daterelease"]);
                movie.CategoryId =Convert.ToInt32(Request.Form["categoryid"]);
                Response.Write(movie.DateRelease);
                Response.Write(movie.IsRecommend);
                Response.Write(movie.Duration);
                //Response.Write(movie.Image);
            }
        }
        public List<Category> category
        {
            get
            {
                return GetCategory();
            }
        }
        private List<Category> GetCategory()
        {
            List<Category> list = new List<Category>();
            string sql = string.Format("select * from category");
            DataSet ds = SQLiteHelper.Query(sql);
            foreach(DataRow dr in ds.Tables[0].Rows)
            {
                Category li = new Category();
                li.Categoryid =Convert.ToInt32(dr["id"]);
                li.Name = dr["id"].ToString();
                list.Add(li);
            }
            return list;
        }
    }
}