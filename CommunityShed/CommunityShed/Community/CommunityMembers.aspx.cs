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
    public partial class CommunityMembers : System.Web.UI.Page
    {
        int communityId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["Id"], out communityId))
            {
                Response.Redirect("~/Default.aspx");
            }
            if (!IsPostBack)
            {
                DataTable communityDt = DatabaseHelper.Retrieve(@"
                    select CommunityName
                    from Community
                    where Id = @Id  
                ", new SqlParameter("@Id", communityId));
                CommunityLabel.Text = communityDt.Rows[0].Field<string>("CommunityName");
            }
            LoadMembers();

        }

        protected void LoadMembers()
        {
            DataTable members = DatabaseHelper.Retrieve(@"
                select FirstName+' '+LastName as MemberName,RoleName, Person.Id, Community.Id CommunityId
                from PersonRole join Role on PersonRole.RoleId = Role.Id 
                join Person on PersonRole.PersonId = Person.Id
                join Community on Community.Id = PersonRole.CommunityId
                
                where Community.Id = @CommunityId
            ", new SqlParameter("@CommunityId", communityId));

            Members.DataSource = members.Rows;
            Members.DataBind();
        }
    }
}