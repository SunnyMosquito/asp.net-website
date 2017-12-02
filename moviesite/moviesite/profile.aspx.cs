using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SQLite;
using System.Collections;
using System.IO;
namespace moviesite
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["username"] == null)
            //{
            //    Response.Redirect("~/login.aspx?next=" + HttpContext.Current.Request.Path);
            //}
            //if (Request.QueryString["logout"] == "true")
            //{
            //    Session["username"] = null;
            //    Session["userid"] = null;
            //    Session["is_superuser"] = null;
            //    Response.Redirect("login.aspx");
            //}
            if (Request.RequestType.ToLower() == "post")
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
                    if (Request.Form["tag"] != null)
                    {
                        string[] tagid = Request.Form["tag"].Split(',');
                        ArrayList sqllist = new ArrayList();
                        foreach (string id in tagid)
                        {
                            string sql2 = string.Format("insert into movie__tag values({0},{1});", movie.MovieId, id);
                            sqllist.Add(sql2);
                        }
                        SQLiteHelper.ExecuteSqlTran(sqllist);
                    }
                    Response.Write("<script>alert('发布成功');window.location.href='profile.aspx';</script>");
                }
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
    }
}