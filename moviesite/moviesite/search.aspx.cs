using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace moviesite
{
    public partial class search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.RequestType.ToLower() == "post")
            {
                string keyword = Request.Form["keyword"];
                string sql =string.Format("select * from movie where name like '%{0}%'",keyword);
                SearchMovie_List = moviesite.PublicService.GetMovie_List(sql);
            }
        }
        public List<Movie> SearchMovie_List;
    }
}