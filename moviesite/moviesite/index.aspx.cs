using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace moviesite
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string sql = "select * from user";
            DataSet user = SQLiteHelper.Query(sql);
            Response.Write(user.Tables[0].Rows[0][0].ToString());
        }
    }
}