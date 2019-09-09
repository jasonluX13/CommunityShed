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
    public partial class MemberEdit : BasePage
    {
        int memberId;
        int communityId;
        string redirect = "~/Default.aspx";
        public string approverKey = "Approver";
        public bool isApprover
        {
            get
            {
                if (ViewState[approverKey] == null)
                {
                    return false;
                }
                return (bool)ViewState[approverKey];
            }
            set
            {
                ViewState[approverKey] = value;
            }
        }
        public string reviewerKey = "Reviewer";
        public bool isReviewer
        {
            get
            {
                if (ViewState[reviewerKey] == null)
                {
                    return false;
                }
                return (bool)ViewState[reviewerKey];
            }
            set
            {
                ViewState[reviewerKey] = value;
            }
        }

        public string enforcerKey = "Enforcer";
        public bool isEnforcer
        {
            get
            {
                if (ViewState[enforcerKey] == null)
                {
                    return false;
                }
                return (bool)ViewState[enforcerKey];
            }
            set
            {
                ViewState[enforcerKey] = value;
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["ID"], out memberId))
            {
                Response.Redirect(redirect);
            }
            if (!int.TryParse(Request.QueryString["CID"], out communityId))
            {
                Response.Redirect(redirect);
            }
            if (!CustomUser.IsInRole("Enforcer", communityId))
            {
                Response.Redirect("~/RequestDenied.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                DataTable reviewer = DatabaseHelper.Retrieve(@"
                select CommunityId
                from PersonRole 
                join Community on Community.Id = PersonRole.CommunityId   
                where Community.Id = @CommunityId and PersonId = @MemberId and RoleId = 3 
                ",
                new SqlParameter("@MemberId", memberId),
                new SqlParameter("@CommunityId", communityId));
                Reviewer.Checked = reviewer.Rows.Count == 1;

                DataTable approver = DatabaseHelper.Retrieve(@"
                select CommunityId
                from PersonRole 
                join Community on Community.Id = PersonRole.CommunityId   
                where Community.Id = @CommunityId and PersonId = @MemberId and RoleId = 2 
                ",
                new SqlParameter("@MemberId", memberId),
                new SqlParameter("@CommunityId", communityId));
                Approver.Checked = approver.Rows.Count == 1;

                DataTable enforcer = DatabaseHelper.Retrieve(@"
                select CommunityId
                from PersonRole 
                join Community on Community.Id = PersonRole.CommunityId   
                where Community.Id = @CommunityId and PersonId = @MemberId and RoleId = 4 
                ",
                new SqlParameter("@MemberId", memberId),
                new SqlParameter("@CommunityId", communityId));
                Enforcer.Checked = enforcer.Rows.Count == 1;

                if (Enforcer.Checked)
                {
                    Enforcer.Enabled = false;
                    isEnforcer = true;
                }
                if (Approver.Checked)
                {
                    isApprover = true;
                }
                if (Reviewer.Checked)
                {
                    isReviewer = true;
                }

            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (Enforcer.Checked && !isEnforcer)
            {
                DatabaseHelper.Insert(@"
                Insert into PersonRole (PersonId, RoleId, CommunityId)
                values (@PersonId, 4, @CommunityId)
                ", new SqlParameter("@PersonId", memberId),
                new SqlParameter("@CommunityId", communityId));
            }
            if (Approver.Checked && !isApprover)
            {
                DatabaseHelper.Insert(@"
                Insert into PersonRole (PersonId, RoleId, CommunityId)
                values (@PersonId, 2, @CommunityId)
                ", new SqlParameter("@PersonId", memberId),
                new SqlParameter("@CommunityId", communityId));
            }
            if (Reviewer.Checked && !isReviewer)
            {
                DatabaseHelper.Insert(@"
                Insert into PersonRole (PersonId, RoleId, CommunityId)
                values (@PersonId, 3, @CommunityId)
                ", new SqlParameter("@PersonId", memberId),
                new SqlParameter("@CommunityId", communityId));
            }


            if (!Enforcer.Checked && isEnforcer)
            {
                DatabaseHelper.Update(@"
                    Delete from PersonRole 
                    where PersonId = @MemberId and CommunityId = @CommunityId
                    and RoleId = 4
                ",
                new SqlParameter("@CommunityId", communityId),
                new SqlParameter("@MemberId", memberId));
            }
            if (!Approver.Checked && isApprover)
            {
                DatabaseHelper.Update(@"
                    Delete from PersonRole 
                    where PersonId = @MemberId and CommunityId = @CommunityId
                    and RoleId = 2
                ",
                new SqlParameter("@CommunityId", communityId),
                new SqlParameter("@MemberId", memberId));
            }
            if (!Reviewer.Checked && isReviewer)
            {
                DatabaseHelper.Update(@"
                    Delete from PersonRole 
                    where PersonId = @MemberId and CommunityId = @CommunityId
                    and RoleId = 3
                ",
                new SqlParameter("@CommunityId", communityId),
                new SqlParameter("@MemberId", memberId));
            }

            Response.Redirect(redirect);
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(redirect);
        }
    }
}