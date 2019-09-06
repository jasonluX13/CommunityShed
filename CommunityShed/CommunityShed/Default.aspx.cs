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
                
                DataTable person = DatabaseHelper.Retrieve(@"
                    select Person.Id
                    from Person
                    where Email = @Email
                ", new SqlParameter("@Email", email));

                DataTable communityList = DatabaseHelper.Retrieve(@"
                    select pC.CommunityId, c.CommunityName, pC.Id, Person.Id
                    from PersonCommunity pC
                        join Community c
                        on c.Id = pC.CommunityId
                        join Person 
                        on pC.PersonId = Person.Id
                        where Person.Email = @Email
                ", new SqlParameter("@Email", email));

                Communities.DataSource = communityList.Rows;
                Communities.DataBind();

                if(communityList.Rows.Count == 1)
                {
                    int loggedinId = person.Rows[0].Field<int>("Id");

                    DataTable itemspostedDt = DatabaseHelper.Retrieve(@"
                        select ItemName, Usage, Warning, Age
                        from Item
                        where OwnerId = @Id
                    ", new SqlParameter("@Id", loggedinId));

                    ItemsPosted.DataSource = itemspostedDt.Rows;
                    ItemsPosted.DataBind();
                }
     
            }
        }
    }
}