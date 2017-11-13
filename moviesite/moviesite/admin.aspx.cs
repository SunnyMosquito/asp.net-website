using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SQLite;
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
            if (Request.QueryString["delete"]!=null)
            {
                string sql = string.Format("delete from movie where id=@para1");
                SQLiteParameter[] sps = new SQLiteParameter[] {
                    new SQLiteParameter("@para1",Request.QueryString["delete"])
                };
                if (SQLiteHelper.ExecuteSql(sql,sps) > 0)
                {
                    Response.Redirect("admin.aspx");
                }
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

    }
}