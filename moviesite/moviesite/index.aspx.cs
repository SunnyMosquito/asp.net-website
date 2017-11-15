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
    }
}