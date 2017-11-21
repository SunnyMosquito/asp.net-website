using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SQLite;
namespace moviesite
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.RequestType.ToLower()== "post")
            {
                User user = new User();
                user.UserName = Request.Form["username"];
                user.PassWord = Request.Form["password"];
                if (Request.Files.Count > 0)
                {
                    user.Avatar = SaveFile(Request.Files["avatar"]);
                }
                user.Email = Request.Form["email"];
                string sql = string.Format("insert into user(username,password,avatar,email) values (@para1,@para2,@para3,@para4)");
                SQLiteParameter[] sps = new SQLiteParameter[]
                {
                        new SQLiteParameter("@para1",user.UserName),
                        new SQLiteParameter("@para2",user.PassWord),
                        new SQLiteParameter("@para3",user.Avatar),
                        new SQLiteParameter("@para4",user.Email)
                };
                if (SQLiteHelper.ExecuteSql(sql, sps) > 0)
                {
                    Response.Write("<script>alert('用户注册成功！');window.location.href='index.aspx';</script>");
                    Response.Redirect("index.aspx");
                }
                else
                {
                    Response.Write(Request.Url + user.UserName + user.PassWord + user.Avatar + user.Name);
                }
            }
        }
        public string SaveFile(HttpPostedFile f)
        {
            string year = DateTime.Now.Year.ToString();
            string month = DateTime.Now.Month.ToString();
            string day = DateTime.Now.ToString("dd");
            string path = string.Format("media\\avatar\\");
            string filename = string.Format("{0}{1}{2}{3}{4}", year, month, day, DateTime.Now.ToString("mmssffff"), Path.GetExtension(f.FileName));
            string fullpath = Path.Combine(path, filename);
            f.SaveAs(Server.MapPath(fullpath));
            return path + filename;
        }
    }
}