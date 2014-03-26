using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Doctors_patients : System.Web.UI.Page
{
    clsUserDetails objUDet = new clsUserDetails();
    clsCommon objCommon = new clsCommon();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            pnlForm.Visible = false;
            calRegDate.SelectedDate = DateTime.Now;
            Guid countryId = new Guid("6d3ec4aa-dc75-497b-ac89-9499530c27f1");
            ddlStateAjax.DataSource = objCommon.getStatesByCountryId(countryId);
            ddlStateAjax.DataTextField = "State";
            ddlStateAjax.DataValueField = "StateId";
            ddlStateAjax.DataBind();
            ddlStateAjax.SelectedIndex = 0;
            loadCities();

            loadUserInformation();
        }
    }

    private void loadUserInformation()
    {
        resetControls();
        string appName = "/brdhc";
        rptUserDetails.DataSource = objUDet.getUserDetails(appName, "patients");
        rptUserDetails.DataBind();
    }

    # region "Load DropDowns"
    protected void loadCities()
    {
        ddlCity.DataSource = objCommon.getCitiesByStateId(new Guid(ddlStateAjax.SelectedValue.ToString()));
        ddlCity.DataTextField = "City";
        ddlCity.DataValueField = "CityId";
        ddlCity.DataBind();
        ddlCity.SelectedIndex = 0;
    }
    # endregion

    # region "Dropdowns Selected Index Changed"
    protected void subChangeCities(object sender, EventArgs e)
    {
        loadCities();
    }
    # endregion
    
    # region "Registration"
    protected void subRegister(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (InsertUser())
            {
                lblErr.Text = "Patient has been registered successfully!";
                pnlForm.Visible = false;
                pnlDetails.Visible = true;
                loadUserInformation();
            }
        }
    }

    private bool InsertUser()
    {
        string username = null;
        string password = Membership.GeneratePassword(8, 1);
        string email = null;
        string secquestion = "Give default question as empty";
        string secanswer = "default";
        bool result = false;

        username = txtIdentity.Text;
        email = txtEmail.Text;
        MembershipCreateStatus status = new MembershipCreateStatus();
        MembershipUser newUser = Membership.CreateUser(username, password, email, secquestion, secanswer, true, out status);
        if (newUser == null)
        {
            lblErr.Text = GetlblErr(status);
        }
        else
        {
            try
            {
                if (Membership.ValidateUser(newUser.ToString(), password))
                {
                    Roles.AddUserToRole(newUser.UserName, "patients");
                    saveBasicInfo(newUser.ProviderUserKey.ToString());
                    string strFullName = txtFName.Text + " " + txtLName.Text;
                    StringBuilder strBody = new StringBuilder();
                    strBody.Append("<div><a href='www.brdhchumber.com'><img src='www.brdhchumber.com/images/mailHeader.jpg' /></a>");
                    strBody.Append("<br />");
                    strBody.Append("<br />");
                    strBody.Append("<h3>Hi! " + strFullName + "</h3>");
                    strBody.Append("<br />");
                    strBody.Append("<br />");
                    strBody.Append("You have been registered to our system. Now you can login to your account on <a href='www.brdhchumber.com'>www.brdhchumber.com</a>.");
                    strBody.Append("<br />");
                    strBody.Append("Please use your health card number as your user name.");
                    strBody.Append("<br />");
                    strBody.Append("<br />");
                    strBody.Append("Password:   " + password);
                    strBody.Append("<br />");
                    strBody.Append("<b>Note: </b> Please change your password when you first login");
                    strBody.Append("<br />");
                    strBody.Append("Wishing you very healthy life.");
                    strBody.Append("<br />");
                    strBody.Append("Team Humber");
                    strBody.Append("<br /></div>");

                    string emailResult = objCommon.sendEMail(email, strBody.ToString(), "BRDHC Humber Registration", true);
                    if (!string.IsNullOrEmpty(emailResult))
                    {
                        lblErr.Text = emailResult;
                    }
                    result = true;
                }
            }
            catch (Exception ex)
            {
                Membership.DeleteUser(newUser.UserName);
                lblErr.Text = ex.Message.ToString();
            }
        }
        return result;
    }

    private void saveBasicInfo(string userId)
    {
        string strDepartment = string.Empty;
        string strSpeciality = string.Empty;
        string txtCommunity = string.Empty;

        objUDet.saveUserBasicInfo(userId, txtFName.Text, txtLName.Text, txtDOB.Text, rdblGender.SelectedItem.Value.ToString(), txtIdentity.Text, txtAddress.Text, ddlCity.SelectedValue.ToString(), ddlStateAjax.SelectedValue.ToString(), txtPostalCode.Text, txtPhone.Text, txtFax.Text, txtFDoctor.Text, strDepartment, txtRegDate.Text, strSpeciality, txtCommunity);
    }

    private string GetlblErr(MembershipCreateStatus status)
    {
        switch (status)
        {
            case MembershipCreateStatus.DuplicateUserName:
                return "Username already exists. Please enter a different user name.";
            case MembershipCreateStatus.DuplicateEmail:
                return "A username for that e-mail address already exists. Please enter a different e-mail address.";
            case MembershipCreateStatus.InvalidPassword:
                return "The password provided is invalid. Please enter a valid password value.";
            case MembershipCreateStatus.InvalidEmail:
                return "The e-mail address provided is invalid. Please check the value and try again.";
            //case MembershipCreateStatus.InvalidAnswer:
            //    return "The password retrieval answer provided is invalid. Please check the value and try again.";
            //case MembershipCreateStatus.InvalidQuestion:
            //    return "The password retrieval question provided is invalid. Please check the value and try again.";
            case MembershipCreateStatus.InvalidUserName:
                return "The user name provided is invalid. Please check the value and try again.";
            case MembershipCreateStatus.ProviderError:
                return "The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact Support.";
            case MembershipCreateStatus.UserRejected:
                return "The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact Support.";
            default:
                return "An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact Support.";
        }
    }
    #endregion

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        lblErr.Text = string.Empty;
        pnlDetails.Visible = false;
        pnlForm.Visible = true;
        txtFName.Focus();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        lblErr.Text = string.Empty;
        pnlDetails.Visible = true;
        pnlForm.Visible = false;
        loadUserInformation();
    }

    private void resetControls()
    {
        txtFName.Text = string.Empty;
        txtLName.Text = string.Empty;
        txtDOB.Text = string.Empty;
        txtFDoctor.Text = string.Empty;
        calRegDate.SelectedDate = DateTime.Now;
        txtEmail.Text = string.Empty;
        txtIdentity.Text = string.Empty;
        txtAddress.Text = string.Empty;
        txtPostalCode.Text = string.Empty;
        txtPhone.Text = string.Empty;
        txtFax.Text = string.Empty;
    }

}