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
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SignUpButton_Click(object sender, EventArgs e)
        {
            string firstName = FirstName.Text;
            string lastName = LastName.Text;
            string email = Email.Text;
            string password = Password.Text;

            DataTable dt = DatabaseHelper.Retrieve(@"
                Select Email From
                Person
                Where Email = @Email
            ", new SqlParameter("@Email", email));
            if (dt.Rows.Count != 0)
            {
                ErrorMessage.Visible = true;
                return;
            }
            string hashedPassword = Hashing.HashPassword(password);

            DatabaseHelper.Insert(@"
                Insert into Person (FirstName, LastName, Email, Password)
                values (@FirstName, @LastName, @Email, @Password)
            ", new SqlParameter("@FirstName",firstName),
            new SqlParameter("@LastName", lastName),
            new SqlParameter("@Email", email),
            new SqlParameter("@Password", hashedPassword));
            Response.Redirect("~/Login.aspx");
        }
    }
}