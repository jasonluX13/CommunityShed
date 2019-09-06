using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;

namespace CommunityShed.Data
{
    public class CustomPrincipal : IPrincipal
    {
        private CustomIdentity identity;
        private Role[] roles;

        public CustomPrincipal(CustomIdentity identity, Role[] roles)
        {
            this.identity = identity;
            this.roles = roles;
        }

        public IIdentity Identity
        {
            get
            {
                return identity;
            }
        }

        public CustomIdentity CustomIdentity
        {
            get
            {
                return identity;
            }
        }

        public bool IsMember
        {
            get
            {
                return IsInRole("Member");
            }
        }

        public bool IsApprover
        {
            get
            {
                return IsInRole("Approver");
            }
        }
        public bool IsEnforcer
        {
            get
            {
                return IsInRole("Enforcer");
            }
        }
        public bool IsReviewer
        {
            get
            {
                return IsInRole("Reviewer");
            }
        }

        public bool IsInRole(string role)
        {
            foreach (var r in roles)
            {
                if (r.RoleName == role)
                {
                    return true;
                }
            }
            return false;
        }

        public bool IsInRole(string role, int communityId)
        {
            foreach (var r in roles)
            {
                if (r.RoleName == role && r.CommunityId == communityId)
                {
                    return true;
                }
            }
            return false;
        }
    }
}