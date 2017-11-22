using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
namespace moviesite
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["logout"] == "true")
            {
                Session["username"] = null;
                Session["is_superuser"] = null;
                Session["userid"] = null;
                Response.Redirect("login.aspx");
            }
            //select movie.*,count(movie__tag.movie_id) from movie,movie__tag,tag where movie.id=movie__tag.movie_id and tag.id=movie__tag.tag_id group by movie__tag.movie_id;
        }
        public List<Movie> Recommend_list
        {
            get
            {
                string sql = string.Format("select * from Movie where is_recommend='true' order by date_upload limit 0,5");
                return moviesite.PublicService.GetMovie_List(sql);
            }
        }
        public List<Movie> Click_count_list
        {
            get
            {
                string sql = string.Format("select * from Movie order by click_count desc limit 0,5");
                return moviesite.PublicService.GetMovie_List(sql);
            }
        }
    }
}