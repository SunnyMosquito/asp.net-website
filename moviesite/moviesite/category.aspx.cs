using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SQLite;
using System.Text.RegularExpressions;
namespace moviesite
{
    public partial class category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] != null)
            {
                string id = Request.QueryString["id"];
                string sql =string.Format("select * from movie where category_id={0}",id);
                int size =10;
                string sql1 = string.Format("select count(*) from movie where category_id={0}", id);
                int page = moviesite.PublicService.GetRow(sql1)/size+1;
                pagecount = page;
                int index = 1;
                if (Convert.ToInt32(Request.QueryString["page"]) > 0&& Convert.ToInt32(Request.QueryString["page"])<=page)
                {
                    index = Convert.ToInt32(Request.QueryString["page"]);
                }
                if (Convert.ToInt32(Request.QueryString["page"]) < 0 || Convert.ToInt32(Request.QueryString["page"]) > page)
                {
                    Response.Redirect("/");
                }
                int nextpage = index+1;
                int prepage = index-1;
                next = Regex.Replace(Request.Url.ToString(), @"page=(.*)", "page="+nextpage);
                pre = Regex.Replace(Request.Url.ToString(), @"page=(.*)", "page="+prepage);
                sql += string.Format(" limit {0} offset {0}*{1}", size, index - 1);//size:每页显示条数，index页码
                MovieList = GetMovie_list(sql);
            }
            else
            {
                Response.Redirect("index.aspx");
            }
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
                li.MovieId = Convert.ToInt32(dr["id"]);
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
                li.MovieId = Convert.ToInt32(dr["id"]);
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
        public List<Category> categorylist
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
        private List<Movie> GetMovie_list(string sql, SQLiteParameter[] sps)
        {
            List<Movie> list = new List<Movie>();
            DataSet ds = SQLiteHelper.Query(sql, sps);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                Movie li = new Movie();
                li.MovieId = Convert.ToInt32(dr["id"]);
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
        public int pagecount;
        public string next;
        public string pre;
    }
}