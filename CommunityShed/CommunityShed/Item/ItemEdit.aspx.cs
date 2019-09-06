using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommunityShed.Item
{
    public partial class ItemEdit : System.Web.UI.Page
    {
        int ItemId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["ID"], out ItemId))
            {
                Response.Redirect("~/Default.aspx");
            }

        }

        protected void Save_Click(object sender, EventArgs e)
        {

        }

        protected void Cancel_Click(object sender, EventArgs e)
        {

        }
    }
}