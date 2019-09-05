using CommunityShed.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommunityShed.Community
{
    public partial class CommunityJoin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string email = User.Identity.Name;
                DataTable dt = DatabaseHelper.Retrieve(@"
                    select c.Id, CommunityName, p.FirstName + ' '+ p.LastName as OwnerName
                    from Community c join Person p on 
                    c.OwnerId = p.Id
                ");

                Communities.DataSource = dt.Rows;
                Communities.DataBind();

            }
        }
    }
}