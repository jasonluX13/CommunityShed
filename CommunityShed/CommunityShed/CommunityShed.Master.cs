using CommunityShed.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CommunityShed
{
    public partial class CommunityShed : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            WelcomeUser();
        }

        protected void WelcomeUser()
        {
            if (Request.IsAuthenticated)
            {
                string welcomeMessage = "Welcome, ";
                string email = Context.User.Identity.Name;

                DataTable dt = DatabaseHelper.Retrieve(@"
                Select FirstName + ' ' + LastName as FullName From
                Person
                Where Email = @Email
            ", new SqlParameter("@Email", email));

                welcomeMessage += dt.Rows[0].Field<string>("FullName");
                WelcomeMessage.Text = welcomeMessage;
            }
        }

        protected void LogoutButton_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect("~/Login.aspx");
        }
    }
}