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
    public partial class changeuser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("~/login.aspx?next=" + HttpContext.Current.Request.Path);
            }
            if (!(Session["is_superuser"].ToString() == "true"))
            {
                Response.Redirect("~/index.aspx");
            }
            if (Request.QueryString["logout"] == "true")
            {
                Session["username"] = null;
                Session["userid"] = null;
                Session["is_superuser"] = null;
                Response.Redirect("login.aspx");
            }
            if (Request.QueryString["changeuser"] != null)
            {
                if (Request.QueryString["changeuser"].ToLower() != "true")
                {
                    Response.Redirect("admin.aspx");
                }
                string sql = string.Format("select * from user where id=@para1");
                myuser.UserId = Convert.ToInt32(Request.QueryString["id"]);
                SQLiteParameter[] sps = new SQLiteParameter[]
                {
                        new SQLiteParameter("@para1",myuser.UserId)
                };
                DataRow dr = SQLiteHelper.Query(sql, sps).Tables[0].Rows[0];
                myuser.UserId = Convert.ToInt32(dr["id"]);
                myuser.UserName = dr["username"].ToString();
                myuser.PassWord = dr["password"].ToString();
                myuser.Avatar = dr["avatar"].ToString();
                myuser.Description = dr["description"].ToString();
                myuser.Name = dr["name"].ToString();
                myuser.Email = dr["email"].ToString();
                myuser.Qq = dr["qq"].ToString();
                myuser.Phone = dr["phone"].ToString();
                myuser.Url = dr["url"].ToString();
                myuser.Address = dr["address"].ToString();

                if (Request.RequestType.ToLower() == "post")
                {
                    User user = new User();
                    user.UserId = myuser.UserId;
                    user.PassWord = Request.Form["password"];
                    user.Name = Request.Form["name"];
                    user.Description = Request.Form["description"];
                    user.Email = Request.Form["email"];
                    user.Qq = Request.Form["qq"];
                    user.Phone = Request.Form["phone"];
                    user.Url = Request.Form["url"];
                    user.Address = Request.Form["address"];
                    string sql1 = string.Format("update user set name=@para1,password=@para2,description=@para3,email=@para4,qq=@para5,url=@para6,phone=@para7,address=@para8 where id=@para9");
                    SQLiteParameter[] sps1 = new SQLiteParameter[]{
                        new SQLiteParameter("@para1",user.Name),
                        new SQLiteParameter("@para2",user.PassWord),
                        new SQLiteParameter("@para3",user.Description),
                        new SQLiteParameter("@para4",user.Email),
                        new SQLiteParameter("@para5",user.Qq),
                        new SQLiteParameter("@para6",user.Url),
                        new SQLiteParameter("@para7",user.Phone),
                        new SQLiteParameter("@para8",user.Address),
                        new SQLiteParameter("@para9",user.UserId),
                    };
                    if (SQLiteHelper.ExecuteSql(sql1, sps1) > 0)
                    {
                        Response.Write("<script>alert('更改成功');window.location.href='admin.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('更改失败');</script>");
                    }
                }
            }


        }
        public User myuser = new moviesite.User();
    }
}