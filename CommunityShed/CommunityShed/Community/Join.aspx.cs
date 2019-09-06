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
    public partial class Join : System.Web.UI.Page
    {
        public int CommunityId;
        public string redirectUrl = "~/Default.aspx";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["ID"], out CommunityId))
            {
                Response.Redirect(redirectUrl);
            }
            string email = User.Identity.Name;
            DataTable person = DatabaseHelper.Retrieve(@"
                    select Id
                    from Person
                    where Email = @Email
                ", new SqlParameter("@Email", email));
            int personId = person.Rows[0].Field<int>("Id");

            DataTable dt = DatabaseHelper.Retrieve(@"
                    select Id, [Open]
                    from Community 
                    where Id = @Id
                ", new SqlParameter("@Id", CommunityId));
            
            DataTable ExistingCommunities = DatabaseHelper.Retrieve(@"
                    select CommunityId
                    from Person join PersonCommunity on Person.Id = PersonCommunity.PersonId 
                    where Person.Email = @Email
                ", new SqlParameter("@Email", email));
            foreach (DataRow row in ExistingCommunities.Rows)
            {
                if (row.Field<int>("CommunityId") == CommunityId)
                {
                    Message.Text = "You have already joined this community";
                    return;
                }
            }

            if (dt.Rows[0].Field<bool>("Open"))
            {
                //Join
                DatabaseHelper.Insert(@"
                Insert into PersonCommunity (CommunityId, PersonId)
                values (@CommunityId, @PersonId)
            ", new SqlParameter("@PersonId", personId),
               new SqlParameter("@CommunityId", CommunityId));

                DatabaseHelper.Insert(@"
                Insert into PersonRole (CommunityId, PersonId, RoleId)
                values (@CommunityId, @PersonId, 1)
            ", new SqlParameter("@PersonId", personId),
               new SqlParameter("@CommunityId", CommunityId));

                Response.Redirect("~/Default.aspx");
            }
            else
            {
                //Can't Join
                Message.Text = "This community is private, waiting for approval by community approver.";
            }
        }
    }
}