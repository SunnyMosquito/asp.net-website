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
            //if (Request.QueryString["logout"] == "true")
            //{
            //    Session["username"] = null;
            //    Session["is_superuser"] = null;
            //    Response.Redirect("login.aspx");
            //}
            if (Request.QueryString["add"] == "true" && Request.RequestType.ToLower() == "post")
            {
                Movie movie = new Movie();
                movie.Name = Request.Form["name"];
                if (Request.Files.Count > 0)
                {
                    movie.Image = SaveFile(Request.Files["image"]);//form必须要加multipart/form-data
                }
                movie.Summary = Request.Form["summary"];
                if (Request.Form["isrecommend"].ToLower() == "on")
                {
                    movie.IsRecommend = "true";
                }
                else
                {
                    movie.IsRecommend = "false";
                }
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
                Response.Write(movie.Image);
            }
        }
        public string SaveFile(HttpPostedFile f)
        {
            string year = DateTime.Now.Year.ToString();
            string month = DateTime.Now.Month.ToString();
            string day = DateTime.Now.ToString("dd");
            string path =string.Format("media\\upload\\movies");
            string filename=string.Format("{0}{1}{2}{3}{4}",year,month,day,DateTime.Now.ToString("mmssffff"),Path.GetExtension(f.FileName));
            string fullpath = Path.Combine(path, filename);
            f.SaveAs(Server.MapPath(fullpath));
            return fullpath;
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