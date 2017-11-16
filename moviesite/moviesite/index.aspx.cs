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
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                Category li = new Category();
                li.Categoryid = Convert.ToInt32(dr["id"]);
                li.Name = dr["name"].ToString();
                list.Add(li);
            }
            return list;
        }
        public List<Tag> taglist
        {
            get
            {
                return GetTaglist();
            }
        }
        private List<Tag> GetTaglist()
        {
            List<Tag> list = new List<Tag>();
            string sql = string.Format("select * from Tag");
            DataSet ds = SQLiteHelper.Query(sql);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                Tag li = new Tag();
                li.Tagid = Convert.ToInt32(dr["id"]);
                li.Name = dr["name"].ToString();
                list.Add(li);
            }
            return list;
        }
        public List<Movie> recommend_list
        {
            get
            {
                string sql = string.Format("select * from Movie where is_recommend='true' order by date_upload limit 0,5");
                return GetMovie_list(sql);
            }
        }
        public List<Movie> click_count_list
        {
            get
            {
                string sql = string.Format("select * from Movie order by click_count desc limit 0,5");
                return GetMovie_list(sql);
            }
        }
        public List<Movie> box_office_list
        {
            get
            {
                string sql = string.Format("select * from Movie order by box_office desc limit 0,10");
                return GetMovie_list(sql);
            }
        }

        public List<Movie> comment_list
        {
            get
            {
                return GetCommentCount_list();
            }
        }
        private List<Movie> GetCommentCount_list()
        {
            List<Movie> list = new List<Movie>();
            string sql = string.Format("select movie.*,count(comment.id) as haha from movie, comment where movie.id = comment.movie_id group by movie.id limit 0, 10; ");
            DataSet ds = SQLiteHelper.Query(sql);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                Movie li = new Movie();
                li.Name = dr["name"].ToString();
                li.Image = dr["image"].ToString();
                li.Summary = dr["summary"].ToString();
                li.IsRecommend = dr["is_recommend"].ToString().ToLower();
                li.BoxOffice = Convert.ToDouble(dr["box_office"]);
                li.Grade = Convert.ToDouble(dr["grade"]);
                li.Url = dr["url"].ToString();
                li.Password = dr["password"].ToString();
                li.Type = dr["type"].ToString();
                li.Duration = Convert.ToInt32(dr["duration"]);
                li.Director = dr["director"].ToString();
                li.Scriptwriter = dr["scriptwriter"].ToString();
                li.Actor = dr["actor"].ToString();
                li.DateRelease = Convert.ToDateTime(dr["date_release"]);
                li.Language = dr["language"].ToString();
                li.CategoryId = Convert.ToInt32(dr["category_id"]);
                li.CommentCount = Convert.ToInt32(dr["haha"]);
                list.Add(li);
            }
            return list;
        }
        private List<Movie> GetMovie_list(string sql)
        {
            List<Movie> list = new List<Movie>();
            DataSet ds = SQLiteHelper.Query(sql);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                Movie li = new Movie();
                li.Name = dr["name"].ToString();
                li.Image = dr["image"].ToString();
                li.Summary = dr["summary"].ToString();
                li.IsRecommend = dr["is_recommend"].ToString().ToLower();
                li.BoxOffice = Convert.ToDouble(dr["box_office"]);
                li.Grade = Convert.ToDouble(dr["grade"]);
                li.Url = dr["url"].ToString();
                li.Password = dr["password"].ToString();
                li.Type = dr["type"].ToString();
                li.Duration = Convert.ToInt32(dr["duration"]);
                li.Director = dr["director"].ToString();
                li.Scriptwriter = dr["scriptwriter"].ToString();
                li.Actor = dr["actor"].ToString();
                li.DateRelease = Convert.ToDateTime(dr["date_release"]);
                li.Language = dr["language"].ToString();
                li.CategoryId = Convert.ToInt32(dr["category_id"]);
                list.Add(li);
            }
            return list;
        }
    }
}