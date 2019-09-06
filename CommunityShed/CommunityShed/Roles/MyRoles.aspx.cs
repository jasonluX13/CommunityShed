using CommunityShed.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommunityShed.Roles
{
    public partial class MyRoles : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListRoles()
        {
            string email = User.Identity.Name;
            DataTable dt = DatabaseHelper.Retrieve(@"
                Select RoleName, Community.Id, CommunityName From Person join PersonRole on Person.Id = PersonRole.PersonId
                   join Community on Community.Id = PersonRole.CommunityId
                   join Role on PersonRole.RoleId = Role.Id
                   where Person.Email = @Email     
            ", new SqlParameter("@Email", email));

            Roles.DataSource = dt;
            Roles.DataBind();
        }
    }
}