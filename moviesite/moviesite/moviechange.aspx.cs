using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SQLite;
using System.IO;
namespace moviesite
{
    public partial class moviechange : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["username"] == null)
            //{
            //    Response.Redirect("~/login.aspx?next=" + HttpContext.Current.Request.Path);
            //}
            //if (!(Session["is_superuser"].ToString() == "true"))
            //{
            //    Response.Redirect("~/index.aspx");
            //}
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
                    movie.Image = SaveFile(Request.Files["image"]);//form必须要加multipart/form-data
                }
                movie.Summary = Request.Form["summary"];
                if (Request.Form["isrecommend"] != null)
                {
                    if (Request.Form["isrecommend"].ToLower() == "on")
                    {
                        movie.IsRecommend = "true";
                    }
                }
                else
                {
                    movie.IsRecommend = "false";
                }
                movie.BoxOffice = Convert.ToDouble(Request.Form["boxoffice"]);
                movie.Grade = Convert.ToDouble(Request.Form["grade"]);
                movie.Url = Request.Form["url"];
                movie.Password = Request.Form["password"];
                movie.DateUpload = DateTime.Now; //Convert.ToDateTime(Request.Form["dateupload"]);
                movie.Type = Request.Form["type"];
                movie.Duration = Convert.ToInt32(Request.Form["duration"]);
                movie.Director = Request.Form["director"];
                movie.Scriptwriter = Request.Form["scriptwriter"];
                movie.Actor = Request.Form["actor"];
                movie.DateRelease = Convert.ToDateTime(Request.Form["daterelease"]);
                movie.Language = Request.Form["language"];
                movie.CategoryId = Convert.ToInt32(Request.Form["categoryid"]);
                Response.Write(movie.DateRelease);
                Response.Write(movie.IsRecommend);
                Response.Write(movie.Duration);
                Response.Write(movie.Image);
                string sql = string.Format("insert into movie(name,summary,is_recommend,box_office,grade,url,password,date_upload,type,duration,director,scriptwriter,actor,date_release,language,category_id) values(@para1,@para2,@para3,@para4,@para5,@para6,@para7,@para8,@para9,@para10,@para11,@para12,@para13,@para14,@para15,@para16)");
                SQLiteParameter[] sps = new SQLiteParameter[]
                {
                        new SQLiteParameter("@para1",movie.Name),
                        new SQLiteParameter("@para2",movie.Summary),
                        new SQLiteParameter("@para3",movie.IsRecommend),
                        new SQLiteParameter("@para4",movie.BoxOffice),
                        new SQLiteParameter("@para5",movie.Grade),
                        new SQLiteParameter("@para6",movie.Url),
                        new SQLiteParameter("@para7",movie.Password),
                        new SQLiteParameter("@para8",movie.DateUpload),
                        new SQLiteParameter("@para9",movie.Type),
                        new SQLiteParameter("@para10",movie.Duration),
                        new SQLiteParameter("@para11",movie.Director),
                        new SQLiteParameter("@para12",movie.Scriptwriter),
                        new SQLiteParameter("@para13",movie.Actor),
                        new SQLiteParameter("@para14",movie.DateRelease),
                        new SQLiteParameter("@para15",movie.Language),
                        new SQLiteParameter("@para16",movie.CategoryId)
                };
                if (SQLiteHelper.ExecuteSql(sql, sps) > 0)
                {
                    Response.Write("<script>alert('新增成功');window.location.href='admin.aspx';</script>");
                }
            }
            if (Request.QueryString["change"] == "true")
            {
                string sql = string.Format("select * from movie where id=@para1");
                mymovie.MovieId = Convert.ToInt32(Request.QueryString["id"]);
                SQLiteParameter[] sps = new SQLiteParameter[]
                {
                        new SQLiteParameter("@para1",mymovie.MovieId)
                };
                DataRow dr = SQLiteHelper.Query(sql, sps).Tables[0].Rows[0];
                mymovie.Name = dr["name"].ToString();
                mymovie.Image = dr["image"].ToString();
                mymovie.Summary = dr["summary"].ToString();
                mymovie.IsRecommend = dr["is_recommend"].ToString().ToLower();
                mymovie.BoxOffice = Convert.ToDouble(dr["box_office"]);
                mymovie.Grade = Convert.ToDouble(dr["grade"]);
                mymovie.Url = dr["url"].ToString();
                mymovie.Password = dr["password"].ToString();
                mymovie.Type = dr["type"].ToString();
                mymovie.Duration = Convert.ToInt32(dr["duration"]);
                mymovie.Director = dr["director"].ToString();
                mymovie.Scriptwriter = dr["scriptwriter"].ToString();
                mymovie.Actor = dr["actor"].ToString();
                mymovie.DateRelease = Convert.ToDateTime(dr["date_release"]);
                mymovie.Language = dr["language"].ToString();
                mymovie.CategoryId = Convert.ToInt32(dr["category_id"]);
                if (Request.RequestType.ToLower() == "post")
                {
                    Movie movie = new Movie();
                    movie.MovieId = mymovie.MovieId;
                    movie.Name = Request.Form["name"];
                    if (Request.Files.Count > 0)
                    {
                        movie.Image = SaveFile(Request.Files["image"]);//form必须要加multipart/form-data
                    }
                    else
                    {
                        movie.Image = mymovie.Image;
                    }
                    movie.Summary = Request.Form["summary"];
                    if (Request.Form["isrecommend"] != null)
                    {
                        if (Request.Form["isrecommend"].ToLower() == "on")
                        {
                            movie.IsRecommend = "true";
                        }
                    }
                    else
                    {
                        movie.IsRecommend = "false";
                    }
                    movie.BoxOffice = Convert.ToDouble(Request.Form["boxoffice"]);
                    movie.Grade = Convert.ToDouble(Request.Form["grade"]);
                    movie.Url = Request.Form["url"];
                    movie.Password = Request.Form["password"];
                    movie.Type = Request.Form["type"];
                    movie.Duration = Convert.ToInt32(Request.Form["duration"]);
                    movie.Director = Request.Form["director"];
                    movie.Scriptwriter = Request.Form["scriptwriter"];
                    movie.Actor = Request.Form["actor"];
                    movie.DateRelease = Convert.ToDateTime(Request.Form["daterelease"]);
                    movie.Language = Request.Form["language"];
                    movie.CategoryId = Convert.ToInt32(Request.Form["categoryid"]);
                    string sql1 = string.Format("update movie set name=@para1,summary=@para2,is_recommend=@para3,box_office=@para4,grade=@para5,url=@para6,password=@para7,type=@para8,duration=@para9,director=@para10,scriptwriter=@para11,actor=@para12,date_release=@para13,language=@para14,category_id=@para15,image=@para16 where id=@para17");
                    SQLiteParameter[] sps1 = new SQLiteParameter[]
                    {
                        new SQLiteParameter("@para1",movie.Name),
                        new SQLiteParameter("@para2",movie.Summary),
                        new SQLiteParameter("@para3",movie.IsRecommend),
                        new SQLiteParameter("@para4",movie.BoxOffice),
                        new SQLiteParameter("@para5",movie.Grade),
                        new SQLiteParameter("@para6",movie.Url),
                        new SQLiteParameter("@para7",movie.Password),
                        new SQLiteParameter("@para8",movie.Type),
                        new SQLiteParameter("@para9",movie.Duration),
                        new SQLiteParameter("@para10",movie.Director),
                        new SQLiteParameter("@para11",movie.Scriptwriter),
                        new SQLiteParameter("@para12",movie.Actor),
                        new SQLiteParameter("@para13",movie.DateRelease),
                        new SQLiteParameter("@para14",movie.Language),
                        new SQLiteParameter("@para15",movie.CategoryId),
                        new SQLiteParameter("@para16",movie.Image),
                        new SQLiteParameter("@para17",movie.MovieId)
                    };
                    if (SQLiteHelper.ExecuteSql(sql1, sps1) > 0)
                    {
                        Response.Write("<script>alert('更改成功');window.location.href='admin.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('更改失败');</script>");
                    }
                }
            }

            if(Request.QueryString["change"] == null&& Request.QueryString["add"] == null&& Request.QueryString["logout"] == null)
            {
                Response.Redirect("admin.aspx");
            }
        }
        public string SaveFile(HttpPostedFile f)
        {
            string year = DateTime.Now.Year.ToString();
            string month = DateTime.Now.Month.ToString();
            string day = DateTime.Now.ToString("dd");
            string path = string.Format("media\\upload\\movies\\");
            string filename = string.Format("{0}{1}{2}{3}{4}", year, month, day, DateTime.Now.ToString("mmssffff"), Path.GetExtension(f.FileName));
            string fullpath = Path.Combine(path, filename);
            f.SaveAs(Server.MapPath(fullpath));
            return path + filename;
        }
        public Movie mymovie = new Movie();
    }
}