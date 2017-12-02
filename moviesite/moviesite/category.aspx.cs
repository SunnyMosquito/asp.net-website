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
            if (Request.QueryString["logout"] == "true")
            {
                Session["username"] = null;
                Session["is_superuser"] = null;
                Session["userid"] = null;
                Response.Redirect("login.aspx");
            }
            if (Request.QueryString["id"] != null)
            {
                string id = Request.QueryString["id"];
                string sql =string.Format("select * from movie where category_id={0}",id);
                int size =10;
                string sql1 = string.Format("select count(*) from movie where category_id={0}", id);
                int page = moviesite.PublicService.GetRow(sql1)/size+1;
                pagecount = page;
                if (pagecount > 1)
                {
                    is_next = true;
                }
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
                if (Request.QueryString["page"] != null)
                {
                    next = Regex.Replace(Request.Url.ToString(), @"page=(.*)", "page=" + nextpage);
                    pre = Regex.Replace(Request.Url.ToString(), @"page=(.*)", "page=" + prepage);
                }
                else
                {
                    next = Request.Url.ToString()+"&page=" + nextpage;
                }
                sql += string.Format(" limit {0} offset {0}*{1}", size, index - 1);//size:每页显示条数，index页码
                MovieList = moviesite.PublicService.GetMovie_List(sql);
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
        public int pagecount;
        public string next;
        public string pre;
        public bool is_next = false;
    }
}