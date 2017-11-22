using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace moviesite
{
    public partial class movie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                string sql = string.Format("select * from movie where id={0}", Request.QueryString["id"]);
                mymovie = moviesite.PublicService.GetMovie(sql);
            }
            else
            {
                Response.Redirect("/");
            }
        }
        public Movie mymovie;
    }
}