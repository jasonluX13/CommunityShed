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
    public partial class CommunityAdd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string communityname = CommunityName.Text;
            bool privacy = true;
            string email = User.Identity.Name;

            if (OpenList.SelectedValue == "Closed")
            {
                privacy = false;
            }

            DataTable dt = DatabaseHelper.Retrieve(@"
                Select Id
                From Person
                Where Email = @Email
            ", new SqlParameter("@Email", email));

            int ownerId = dt.Rows[0].Field<int>("Id");

            DatabaseHelper.Insert(@"
                insert into Community (CommunityName, [Open], OwnerId)
                values (@CommunityName, @Open, @OwnerId);
            ",
                new SqlParameter("@CommunityName", communityname),
                new SqlParameter("@Open", privacy),
                new SqlParameter("@OwnerId", ownerId));

            Response.Redirect("~/Default.aspx");
        }
    }
}