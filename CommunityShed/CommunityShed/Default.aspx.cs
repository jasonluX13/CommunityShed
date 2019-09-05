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
                DataTable dt = DatabaseHelper.Retrieve(@"
                    select pC.CommunityId, c.CommunityName,
                    c.[Open]
                    from PersonCommunity pC
                        join Community c
                        on c.Id = pC.CommunityId
                        where pC.PersonId = @PersonId
                ", new SqlParameter("@PersonId", 1));

                Communities.DataSource = dt.Rows;
                Communities.DataBind();

            }
        }
    }
}