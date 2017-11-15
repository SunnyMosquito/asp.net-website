using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SQLite;
using System.IO;
using System.Configuration;
namespace moviesite
{
    public partial class admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["username"] == null)
            //{
            //    Response.Redirect("~/login.aspx?next=" + HttpContext.Current.Request.Path);
            //}
            //if (!(Session["is_superuser"].ToString()=="true"))
            //{
            //    Response.Redirect("~/index.aspx");
            //}
            //if (Request.QueryString["logout"] == "true")
            //{
            //    Session["username"] = null;
            //    Session["is_superuser"] = null;
            //    Response.Redirect("login.aspx");
            //}
            if (Request.QueryString["delete"]!=null)
            {
                string sql="";
                if (Request.QueryString["delete"].ToLower() == "user")
                {
                    sql = string.Format("delete from user where id=@para1");
                }
                if (Request.QueryString["delete"].ToLower() == "movie")
                {
                    sql = string.Format("delete from movie where id=@para1");
                }
                SQLiteParameter[] sps = new SQLiteParameter[] {
                    new SQLiteParameter("@para1",Request.QueryString["id"])
                };
                if (SQLiteHelper.ExecuteSql(sql,sps) > 0)
                {
                    Response.Write("<script>alert('删除成功');window.location.href='admin.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('删除成功');</script>");
                }
            }
            if (Request.QueryString["adduser"] != null)
            {
                User user = new User();
                user.UserName = Request.Form["username"];
                user.PassWord = Request.Form["password"];
                if (Request.Files.Count > 0)
                {
                    user.Avatar =SaveFile(Request.Files["avatar"]);
                }
                user.Name = Request.Form["name"];
                string sql = string.Format("insert into user(username,password,avatar,name) values (@para1,@para2,@para3,@para4)");
                SQLiteParameter[] sps = new SQLiteParameter[]
                {
                        new SQLiteParameter("@para1",user.UserName),
                        new SQLiteParameter("@para2",user.PassWord),
                        new SQLiteParameter("@para3",user.Avatar),
                        new SQLiteParameter("@para4",user.Name)
                };
                if (SQLiteHelper.ExecuteSql(sql, sps) > 0)
                {
                    Response.Write("<script>alert('新增用户成功！');</script>");
                    Response.Redirect("admin.aspx");
                }
                else
                {
                    Response.Write(Request.Url + user.UserName + user.PassWord + user.Avatar + user.Name);
                }
            }
            if (Request.QueryString["advertising"] != null)
            {
                
            }
        }
        public List<Movie> movies
        {
            get
            {
                return GetMovies();
            }
        }
        public List<Movie> GetMovies()
        {
            List<Movie> movieslist = new List<Movie>();
            string sql = "select * from movie";
            DataSet ds = SQLiteHelper.Query(sql);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                Movie movie = new Movie();
                movie.MovieId = Convert.ToInt32(dr["id"]);
                movie.Name = dr["name"].ToString();
                movie.DateRelease = Convert.ToDateTime(dr["date_release"]);
                movie.BoxOffice = dr["box_office"].ToString();
                movie.Grade = Convert.ToDouble(dr["grade"]);
                movieslist.Add(movie);
            }
            return movieslist;
        }
        public List<User> Useres
        {
            get
            {
                return GetUseres();
            }
        }
        public List<User> GetUseres()
        {
            List<User> userlist = new List<User>();
            string sql = "select * from user";
            DataSet ds = SQLiteHelper.Query(sql);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                User user = new User();
                user.UserId =Convert.ToInt32(dr["id"]);
                user.UserName = dr["username"].ToString();
                user.PassWord = dr["password"].ToString();
                user.Avatar = dr["avatar"].ToString();
                user.Description = dr["description"].ToString();
                user.Name = dr["name"].ToString();
                user.Email = dr["email"].ToString();
                user.Qq = dr["qq"].ToString();
                user.Phone = dr["phone"].ToString();
                user.Url = dr["url"].ToString();
                userlist.Add(user);
            }
            return userlist;
        }
        public string SaveFile(HttpPostedFile f)
        {
            string year = DateTime.Now.Year.ToString();
            string month = DateTime.Now.Month.ToString();
            string day = DateTime.Now.ToString("dd");
            string path = string.Format("media\\avatar\\");
            string filename = string.Format("{0}{1}{2}{3}{4}", year, month, day, DateTime.Now.ToString("mmssffff"), Path.GetExtension(f.FileName));
            string fullpath = Path.Combine(path, filename);
            f.SaveAs(Server.MapPath(fullpath));
            return path + filename;
        }

    }
}