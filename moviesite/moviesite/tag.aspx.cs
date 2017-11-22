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
    public partial class tag : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                string[] idlist = Request.QueryString["id"].Split(',');
                string sql = "SELECT m.*,GROUP_CONCAT(mt.tag_id) FROM movie as m JOIN movie__tag as mt ON m.id = mt.movie_id WHERE mt.tag_id IN(";
                for (int i = 0; i < idlist.Length; i++)
                {
                    if (i == idlist.Length - 1)
                    {
                        sql += idlist[i];
                    }
                    else
                    {
                        sql += idlist[i] + ",";
                    }
                }
                sql += ") GROUP BY m.id HAVING COUNT(DISTINCT mt.tag_id) ="+idlist.Length;
                MovieList =moviesite.PublicService.GetMovie_List(sql);
            }
            else
            {
                Response.Redirect("index.aspx");
            }
        }
      
        public List<Movie> MovieList;
        public bool IsContain(string id)
        {
            string[] flag = Request.QueryString["id"].Split(',');
            List<string> list = new List<string>(flag);
            if (list.Contains(id))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
     
    }
}














//if (Request.QueryString["id"] != null)
//{
//    string[] idlist = Request.QueryString["id"].Split(',');
//    string sql = "select movie.* from movie,movie__tag,tag where movie.id=movie__tag.movie_id and tag.id=movie__tag.tag_id";
//    for (int i = 0; i < idlist.Length; i++)
//    {
//        sql += " and movie__tag.tag_id=" + idlist[i];
//    }
//    sql += " group by movie__tag.movie_id";
//    MovieList = GetMovie_list(sql);
//    Response.Write(sql);
//}