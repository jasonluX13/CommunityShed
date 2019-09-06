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
    public partial class CommunityDetails : System.Web.UI.Page
    {
        int communityId = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["Id"], out communityId))
            {
                Response.Redirect("~/Default.aspx");
            }

            if (!IsPostBack)
            {
                DataTable communityDt = DatabaseHelper.Retrieve(@"
                    select CommunityName, [Open], OwnerId
                    from Community
                    where Id = @Id  
                ", new SqlParameter("@Id", communityId));


                if (communityDt.Rows.Count == 1)
                {
                    CommunityLabel.Text = communityDt.Rows[0].Field<string>("CommunityName");
                    int ownerId = communityDt.Rows[0].Field<int>("OwnerId");
                    bool privacy = communityDt.Rows[0].Field<bool>("Open");

                    DataTable OwnerDt = DatabaseHelper.Retrieve(@"
                        select FirstName + ' ' + LastName as OwnerName
                        from Person
                        where Id = @Id  
                    ", new SqlParameter("@Id", ownerId));

                    OwnerLabel.Text = OwnerDt.Rows[0].Field<string>("OwnerName");

                    if (privacy)
                    {
                        OpenLabel.Text = "Open";
                    } else
                    {
                        OpenLabel.Text = "Closed";
                    }
                }
                else
                {
                    Response.Redirect("~/Default.aspx");
                }

                DataTable itemDT = DatabaseHelper.Retrieve(@"
                    select i.ItemName, i.Usage, i.Warning, i.Age,
                    p.FirstName + ' ' + p.LastName as OwnerName 
                    from CommunityItems cI
                    inner join Item i
                        on i.Id = cI.ItemId
                    inner join Person p
                        on i.OwnerId = p.Id
                    where cI.CommunityId = @Id
                ", new SqlParameter("@Id", communityId));

                Items.DataSource = itemDT.Rows;
                Items.DataBind();
            }
        }
    }
}