using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace GmitApp
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ((Button)this.Master.FindControl("ButtonBack")).Visible = false;

            //MembershipUser mu = Membership.GetUser();
            //string email = mu.Email;
        }
    }
}
