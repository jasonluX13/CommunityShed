using CommunityShed.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommunityShed.Item
{
    public partial class ItemAdd : System.Web.UI.Page
    {
        int communityId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["ID"], out communityId))
            {
                Response.Redirect("~Default.aspx");
            }

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string email = User.Identity.Name;
            string itemName = ItemName.Text;
            string usage = Usage.Text;
            string warning = Warning.Text;
            string age = Age.Text;

            int ownerId = 0;

            DataTable person = DatabaseHelper.Retrieve(@"
                    select Person.Id
                    from Person
                    where Email = @Email
            ", new SqlParameter("@Email", email));

            ownerId = person.Rows[0].Field<int>("Id");

            int? itemId = DatabaseHelper.Insert(@"
                Insert into Item (ItemName, OwnerId, Usage, Warning, Age)
                values (@ItemName, @OwnerId, @Usage, @Warning, @Age)
            ", new SqlParameter("@ItemName", itemName),
               new SqlParameter("@OwnerId", ownerId),
               new SqlParameter("@Usage", usage),
               new SqlParameter("@Warning", warning),
               new SqlParameter("@Age", age));

            DatabaseHelper.Insert(@"
                Insert into CommunityItems (ItemId, CommunityId)
                values (@ItemId, @CommunityId)
            ", new SqlParameter("ItemId", itemId),
               new SqlParameter("CommunityId", communityId));

            Response.Redirect($"~/Community/CommunityDetails.aspx?ID={communityId}");



        }
    }
}