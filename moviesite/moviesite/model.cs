using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SQLite;
namespace moviesite
{
    public class User
    {
        private int userid;
        public int UserId
        {
            get { return userid; }
            set { userid = value; }
        }

        private string username;
        public string UserName
        {
            get { return username; }
            set { username = value; }
        }

        private string password;
        public string PassWord
        {
            get { return password; }
            set { password = value; }
        }

        private string avatar;
        public string Avatar
        {
            get { return avatar; }
            set { avatar = value; }
        }

        private string description;
        public string Description
        {
            get { return description; }
            set { description = value; }
        }

        private bool is_superuser;
        public bool Is_Superuser
        {
            get { return is_superuser; }
            set { is_superuser = value; }
        }

        private DateTime date_joined;
        public DateTime Date_Joined
        {
            get { return date_joined; }
            set { date_joined = value; }
        }

        private DateTime last_lgin;
        public DateTime Last_Login
        {
            get { return last_lgin; }
            set { last_lgin = value; }
        }

        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }

        private string email;
        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        private string qq;
        public string Qq
        {
            get { return qq; }
            set { qq = value; }
        }
        private string phone;
        public string Phone
        {
            get { return phone; }
            set { phone = value; }
        }
        private string url;
        public string Url
        {
            get { return url; }
            set { url = value; }
        }

        private string address;
        public string Address
        {
            get { return address; }
            set { address = value; }
        }
    }

    public class Movie
    {
        private int movieid;
        public int MovieId
        {
            get { return movieid; }
            set { movieid = value; }
        }
        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        private string image;
        public string Image
        {
            get { return image; }
            set { image = value; }
        }
        private string summary;
        public string Summary
        {
            get { return summary; }
            set { summary = value; }
        }
        private string isrecommend;
        public string IsRecommend
        {
            get { return isrecommend; }
            set { isrecommend = value; }
        }
        private int clickcount;
        public int Clickount
        {
            get { return clickcount; }
            set { clickcount = value; }
        }
        private double boxoffice;
        public double BoxOffice
        {
            get { return boxoffice; }
            set { boxoffice = value; }
        }
        private double grade;
        public double Grade
        {
            get { return grade; }
            set { grade = value; }
        }
        private string url;
        public string Url
        {
            get { return url; }
            set { url = value; }
        }
        private string password;
        public string Password
        {
            get { return password; }
            set { password = value; }
        }
        private DateTime dateupload;
        public DateTime DateUpload
        {
            get { return dateupload; }
            set { dateupload = value; }
        }
        private string type;
        public string Type
        {
            get { return type; }
            set { type = value; }
        }
        private int duration;
        public int Duration
        {
            get { return duration; }
            set { duration = value; }
        }
        private string director;
        public string Director
        {
            get { return director; }
            set { director = value; }
        }
        private string scriptwriter;
        public string Scriptwriter
        {
            get { return scriptwriter; }
            set { scriptwriter = value; }
        }
        private string actor;
        public string Actor
        {
            get { return actor; }
            set { actor = value; }
        }
        private DateTime date_release;
        public DateTime DateRelease
        {
            get { return date_release; }
            set { date_release = value; }


        }
        private string language;
        public string Language
        {
            get { return language; }
            set { language = value; }
        }
        private int category_id;
        public int CategoryId
        {
            get { return category_id; }
            set { category_id = value; }
        }
        private int comment_count;
        public int CommentCount
        {
            get { return comment_count; }
            set { comment_count = value; }
        }
    }

    public class Category
    {
        private int categoryid;
        public int Categoryid
        {
            get { return categoryid; }
            set { categoryid = value; }
        }

        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
    }

    public class Tag
    {
        private int tagid;
        public int Tagid
        {
            get { return tagid; }
            set { tagid = value; }
        }

        private string name;
        public string Name
        {
            get { return name; }
            set { name = value; }
        }
    }

    public class MovieControl
    {
        public static List<Movie> GetAllMovieList
        {
            get
            {
                string sql = "select * from movie";
                return GetMovie_list(sql);
            }
        }
        public static List<Movie> GetMovie_list(string sql)
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

    public class CategoryControl
    {
        public static List<Category> GetCategory()
        {
            string sql = "select * from category";
            List<Category> list = new List<Category>();
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
    }
}