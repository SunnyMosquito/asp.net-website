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
    public partial class movie : System.Web.UI.Page
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
            if (Request.QueryString["id"] != null)
            {
                string sql = string.Format("select * from movie where id={0}", Request.QueryString["id"]);
                mymovie = moviesite.PublicService.GetMovie(sql);
                string sql1 = string.Format("select comment.id,user_id,username,content,date_publish,pid_id from comment,user where comment.user_id=user.id and movie_id=@para1");
                SQLiteParameter[] sps = new SQLiteParameter[]
                    {
                        new SQLiteParameter("@para1",Request.QueryString["id"])
                    };
                DataSet ds = SQLiteHelper.Query(sql1,sps);
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    Comment li = new Comment();
                    li.UserId = dr["user_id"].ToString();
                    li.Content = dr["content"].ToString();
                    li.UserName = dr["username"].ToString();
                    li.CommentId = dr["id"].ToString();
                    li.PId = dr["pid_id"].ToString();
                    li.DatePublish = Convert.ToDateTime(dr["date_publish"]);
                    CommentList.Add(li);
                }
            }
            else
            {
                Response.Redirect("/");
            }

            if (Request.RequestType.ToLower() == "post")
            {
                if (Request.Form["content"] != null)
                {
                    Comment com = new Comment();
                    com.UserId = Session["userid"].ToString();
                    com.Movieid = Request.QueryString["id"];
                    com.Content = Request.Form["content"];
                    com.DatePublish = DateTime.Now;
                    if (Request.Form["pid"] != null)
                    {
                        com.PId = Request.Form["pid"];
                    }
                    else
                    {
                        com.PId = "0";
                    }
                    string sql = string.Format("insert into comment(content,date_publish,user_id,movie_id,pid_id) values (@para1,@para2,@para3,@para4,@para5)");
                    SQLiteParameter[] sps = new SQLiteParameter[]
                    {
                        new SQLiteParameter("@para1",com.Content),
                        new SQLiteParameter("@para2",com.DatePublish),
                        new SQLiteParameter("@para3",com.UserId),
                        new SQLiteParameter("@para4",com.Movieid),
                        new SQLiteParameter("@para5",com.PId)
                    };
                    if (SQLiteHelper.ExecuteSql(sql, sps) > 0)
                    {
                        Response.Write("<script>alert('评论成功！');window.location.href='index.aspx';</script>");
                        Response.Redirect(Request.Url.ToString());
                    }
                    else
                    {
                        Response.Write("留言失败");
                    }

                }
            }
        }
        public Movie mymovie;
        public List<Comment> CommentList=new List<Comment>();
        public Comment PComment(string pid)
        {
            string sql= string.Format("select * from comment,user where user.id=comment.user_id and comment.id={0}",pid);
            DataSet ds = SQLiteHelper.Query(sql);
            Comment li = new Comment();
            DataRow dr = ds.Tables[0].Rows[0];
            li.Movieid = dr["movie_id"].ToString();
            li.UserName = dr["username"].ToString();
            li.UserId = dr["user_id"].ToString();
            return li;
        }
    }
}