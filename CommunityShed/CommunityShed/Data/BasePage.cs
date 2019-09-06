using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CommunityShed.Data
{
    public class BasePage : System.Web.UI.Page
    {
        protected CustomPrincipal CustomUser
        {
            get
            {
                return (CustomPrincipal)User;
            }
        }
    }
}