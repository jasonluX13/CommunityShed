using CommunityShed.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Principal;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace CommunityShed
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
        }

        protected void Application_PostAuthenticateRequest(object sender, EventArgs e)
        {
            IPrincipal user = HttpContext.Current.User;

            if (user.Identity.IsAuthenticated && user.Identity.AuthenticationType == "Forms")
            {
                FormsIdentity formsIdentity = (FormsIdentity)user.Identity;
                FormsAuthenticationTicket ticket = formsIdentity.Ticket;

                CustomIdentity customIdentity = new CustomIdentity(ticket);

                // TODO Get from the database
                string email = User.Identity.Name;

                DataTable dt = DatabaseHelper.Retrieve(@"
                   Select RoleName, Community.Id From Person join PersonRole on Person.Id = PersonRole.PersonId
                   join Community on Community.Id = PersonRole.CommunityId
                   where Person.Email = @Email     
                 ", new SqlParameter("@Email", email));

                //Each user can only have one role
                Role[] roles = new Role[30];
                int count = 0;

                foreach (DataRow row in dt.Rows)
                {
                    Role personRole = new Role();
                    personRole.RoleName = row.Field<string>("RoleName");
                    personRole.CommunityId = row.Field<int>("Id");
                    roles[count] = personRole;
                    count++;
                }
              


                CustomPrincipal principal = new CustomPrincipal(customIdentity, roles);

                HttpContext.Current.User = principal;
                Thread.CurrentPrincipal = principal;
            }
        }
    }
}