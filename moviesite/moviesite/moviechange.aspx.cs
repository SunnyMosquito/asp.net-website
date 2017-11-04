using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace moviesite
{
    public partial class moviechange : System.Web.UI.Page
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
                Session["is_superuser"] = null;
                Response.Redirect("login.aspx");
            }
        }
    }
}