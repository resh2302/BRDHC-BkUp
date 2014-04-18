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
            Response.Redirect("Admin/errorLogs.aspx");
        }
        else if (Roles.IsUserInRole(user.UserName, "Patients"))
        {
            Response.Redirect("Patients/PatientAppointment.aspx");
        }
        else if (Roles.IsUserInRole(user.UserName, "Doctors"))
        {
            Response.Redirect("Doctors/registration.aspx");
        }
        else if (Roles.IsUserInRole(user.UserName, "ContactAdmin"))
        {
            Response.Redirect("CareerAdmin/CareerAdmin.aspx");
        }
        else if (Roles.IsUserInRole(user.UserName, "EducationAdmin"))
        {
            Response.Redirect("EducationAdmin/quiz.aspx");
        }
        else if (Roles.IsUserInRole(user.UserName, "EmergencyAdmin"))
        {
            Response.Redirect("EmergencyAdmin/EmergencyNewTime.aspx");
        }
        else if (Roles.IsUserInRole(user.UserName, "GiftShopAdmin"))
        {
            Response.Redirect("GiftShopAdmin/GiftShopAdmin.aspx");
        }
        else if (Roles.IsUserInRole(user.UserName, "HumanResources"))
        {
            Response.Redirect("VolunteerAdmin/VolApplicationAdmin.aspx");
        }
    }
}