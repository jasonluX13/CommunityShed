using CommunityShed.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommunityShed
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                string email = User.Identity.Name;
                DataTable dt = DatabaseHelper.Retrieve(@"
                    select pC.CommunityId, c.CommunityName, pC.Id
                    from PersonCommunity pC
                        join Community c
                        on c.Id = pC.CommunityId
                        join Person 
                        on pC.PersonId = Person.Id
                        where Person.Email = @Email
                ", new SqlParameter("@Email", email));

                Communities.DataSource = dt.Rows;
                Communities.DataBind();

            }
        }
    }
}