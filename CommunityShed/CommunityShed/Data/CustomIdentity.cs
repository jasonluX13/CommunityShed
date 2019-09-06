using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Security;

namespace CommunityShed.Data
{
    public class CustomIdentity : IIdentity
    {
        private FormsAuthenticationTicket ticket;

        public CustomIdentity(FormsAuthenticationTicket ticket)
        {
            this.ticket = ticket;
        }

        public string AuthenticationType
        {
            get
            {
                return "Custom";
            }
        }

        public bool IsAuthenticated
        {
            get
            {
                return true;
            }
        }

        public string Name
        {
            get
            {
                return ticket.Name;
            }
        }

        public string FirstName { get; set; }
        public string LastName { get; set; }
    }
}