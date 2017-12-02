using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SQLite;
using System.Data;
namespace moviesite
{
    public partial class message : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("~/login.aspx?next=" + HttpContext.Current.Request.Path);
            }
            if (Request.QueryString["logout"] == "true")
            {
                Session["username"] = null;
                Session["userid"] = null;
                Session["is_superuser"] = null;
                Response.Redirect("login.aspx");
            }
            if (Request.RequestType.ToLower() == "post")
            {
                if (Request.Form["content"] != null)
                {
                    Message msg = new Message();
                    msg.Content = Request.Form["content"];
                    msg.UserId = Session["userid"].ToString();
                    msg.DateRelease = DateTime.Now;
                    string sql = string.Format("insert into message(content,date_release,user_id) values (@para1,@para2,@para3)");
                    SQLiteParameter[] sps = new SQLiteParameter[]
                    {
                        new SQLiteParameter("@para1",msg.Content),
                        new SQLiteParameter("@para2",msg.DateRelease),
                        new SQLiteParameter("@para3",msg.UserId)
                    };
                    if (SQLiteHelper.ExecuteSql(sql, sps) > 0)
                    {
                        Response.Write("<script>alert('留言成功！');window.location.href='index.aspx';</script>");
                        Response.Redirect("message.aspx");
                    }
                    else
                    {
                        Response.Write("留言失败");
                    }
                }
            }
        }
        public List<Message> MessageList()
        {
            List<Message> list = new List<Message>();
            string sql = string.Format("select message.user_id,message.id,message.content,date_release,user.username from message,user where user_id=user.id");
            DataSet ds = SQLiteHelper.Query(sql);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                Message li = new Message();
                li.UserId = dr["user_id"].ToString();
                li.Content = dr["content"].ToString();
                li.UserName = dr["username"].ToString();
                li.DateRelease =Convert.ToDateTime(dr["date_release"]);
                list.Add(li);
            }
            return list;
        }
    }
}