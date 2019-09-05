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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ErrorMessage.Visible = true;
            //ErrorMessage.Text = Hashing.HashPassword("password");
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string email = Email.Text;
            string password = Password.Text;
            
            DataTable dt = DatabaseHelper.Retrieve(@"
                Select Password From
                Person
                Where Email = @Email
            ", new SqlParameter("@Email", email));
            if (dt.Rows.Count == 0)
            {
                ErrorMessage.Visible = true;
                return;
            }
            string correctHash = dt.Rows[0].Field<string>("Password");
            if (Hashing.ValidatePassword(password, correctHash))
            {
                FormsAuthentication.RedirectFromLoginPage(email, true);
            }
            else
            {
                ErrorMessage.Visible = true;
                return;
            }
        }
    }
}