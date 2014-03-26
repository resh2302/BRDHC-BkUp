using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipUser user = Membership.GetUser();

        if (Roles.IsUserInRole(user.UserName, "Administration"))
        {
            Response.Redirect("Admin/appointments.aspx");
        }
        else if (Roles.IsUserInRole(user.UserName, "Patients"))
        {
            Response.Redirect("Patients/Patients.aspx");
        }
        else if (Roles.IsUserInRole(user.UserName, "Doctors"))
        {
            Response.Redirect("Doctors/patients.aspx");
        }
        else if (Roles.IsUserInRole(user.UserName, "CommunityAdmin"))
        {
            Response.Redirect("CommunityAdmin/CommunityAdmin.aspx");
        }
        else if (Roles.IsUserInRole(user.UserName, "CommunityMembers"))
        {
            Response.Redirect("CommunityMembers/CommunityMembers.aspx");
        }
        else if (Roles.IsUserInRole(user.UserName, "AlertAdmin"))
        {
            Response.Redirect("AlertAdmin/AlertAdmin.aspx");
        }
        else if (Roles.IsUserInRole(user.UserName, "ContactAdmin"))
        {
            Response.Redirect("ContactAdmin/ContactAdmin.aspx");
        }
        else if (Roles.IsUserInRole(user.UserName, "EducationAdmin"))
        {
            Response.Redirect("EducationAdmin/EducationAdmin.aspx");
        }
        else if (Roles.IsUserInRole(user.UserName, "EmergencyAdmin"))
        {
            Response.Redirect("EmergencyAdmin/EmergencyAdminDashboard.aspx");
        }
        else if (Roles.IsUserInRole(user.UserName, "FinanceAdmin"))
        {
            Response.Redirect("FinanceAdmin/FinanceAdmin.aspx");
        }
        else if (Roles.IsUserInRole(user.UserName, "GiftShopAdmin"))
        {
            Response.Redirect("GiftShopAdmin/GiftShopAdmin.aspx");
        }
        else if (Roles.IsUserInRole(user.UserName, "HumanResources"))
        {
            Response.Redirect("HumanResources/HumanResources.aspx");
        }
    }
}