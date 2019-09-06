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
    public partial class ItemEdit : BasePage
    {
        int ItemId;
        int CommunityId;
        string redirect = "~/Default.aspx";

        protected void Page_Init(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["CID"], out CommunityId))
            {
                Response.Redirect(redirect);
            }

            if (!CustomUser.IsInRole("Reviewer", CommunityId) && !isOwner())
            {
                Response.Redirect("~/RequestDenied.aspx");
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["ID"], out ItemId))
            {
                Response.Redirect(redirect);
            }


            if (!IsPostBack)
            {
                DataTable dt = DatabaseHelper.Retrieve(@"
                    select Id, ItemName, Usage, Warning, Age
                    from Item
                    where Id = @ItemId
                ", new SqlParameter("@ItemId", ItemId));

                if (dt.Rows.Count == 1)
                {
                    ItemName.Text = dt.Rows[0].Field<string>("ItemName");
                    Usage.Text = dt.Rows[0].Field<string>("Usage");
                    Warning.Text = dt.Rows[0].Field<string>("Warning");
                    Age.Text = dt.Rows[0].Field<string>("Age");
                }
                else
                {
                    Response.Redirect(redirect);
                }
            }

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            string itemName = ItemName.Text;
            string usage = Usage.Text;
            string warning = Warning.Text;
            string age = Age.Text;

            DatabaseHelper.Update(@"
                update Item set
                    ItemName = @ItemName,
                    Usage = @Usage,
                    Warning = @Warning,
                    Age = @Age
                where Id = @ItemId
            ",
                new SqlParameter("@ItemId", ItemId),
                new SqlParameter("@ItemName", itemName),
                new SqlParameter("@Usage", usage),
                new SqlParameter("@Warning", warning),
                new SqlParameter("@Age", age));
            Response.Redirect(redirect);
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(redirect);
        }

        protected bool isOwner()
        {
            string email = User.Identity.Name;
            DataTable dt = DatabaseHelper.Retrieve(@"
                Select Item.Id from Item join Person on Item.OwnerId = Person.Id
                where Item.Id  = @ItemId and Email = @Email
            ",
            new SqlParameter("@Email", email),
            new SqlParameter("@ItemId",ItemId));

            return dt.Rows.Count == 1;
        }
    }
}