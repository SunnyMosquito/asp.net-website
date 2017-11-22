using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SQLite;
namespace moviesite
{
    public class PublicService
    {
        public static List<Tag> GetTag_List()
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
        public static List<Movie> GetMovie_BoxOffice_List()
        {

            string sql = string.Format("select * from Movie order by box_office desc limit 0,10");
            return moviesite.PublicService.GetMovie_List(sql);
        }
        public static List<Movie> GetMovie_Comment_List()
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
        public static List<Movie> GetMovie_List(string sql)
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
        public static List<Category> GetCategory_List()
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
        public static List<Movie> GetMovie_List(string sql, SQLiteParameter[] sps)
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
        public static Movie GetMovie(string sql)
        {
            DataSet ds = SQLiteHelper.Query(sql);
            Movie li = new Movie();
            DataRow dr = ds.Tables[0].Rows[0];
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
            return li;
        }
    }
}