/////////////////////////////////////////////////////
// AUTHOR:           JAGSIR
// DATE MODIFIED: -  17 FEB 2014
// DESCRIPTION:      REEGISTRATION AND DISPLAY PAGE
// MODIFICATIONS:    merge two pages
/////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class brdhcAdmin_registration : System.Web.UI.Page
{
    clsUserDetails objUDet = new clsUserDetails();
    clsCommon objCommon = new clsCommon();
    string roles = "";
    private static string _userId;
    private static string _userBasicInfoId;
    private static string _roleName = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            MembershipUser user = Membership.GetUser();

            if (Roles.IsUserInRole(user.UserName, "Doctors"))
            {
                pnlSearch.Visible = false;
            }
            Label lblDashboard = Master.dashboardHeading;
            lblDashboard.Text = "ADMIN DASHBOARD : USERS";

            pnlDetails.Visible = false;
            ddlRolesDes.DataSource = Roles.GetAllRoles();
            ddlRolesDes.DataBind();

            ddlRolesDes.Items.Insert(0, new ListItem("--- Please Select ---"));



            ddlRoles.DataSource = Roles.GetAllRoles();
            ddlRoles.DataBind();
            subCheckRoles();

            calJoingDate.SelectedDate = DateTime.Now;
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
    protected void subRoleChange(object sender, EventArgs e)
    {
        subCheckRoles();
    }
    private void subCheckRoles()
    {
        switch (ddlRoles.SelectedItem.Text.ToLower())
        {
            case "patients":
                lblIdentity.Text = "Health Card Number";
                pnlPatients.Visible = true;
                pnlDoctors.Visible = false;
                lblJoinDate.Text = "Registration Date";
                pnlDepartment.Visible = false;
                break;
            case "doctors":
                pnlPatients.Visible = false;
                pnlDoctors.Visible = true;
                lblJoinDate.Text = "Joinging Date";
                pnlDepartment.Visible = true;
                lblIdentity.Text = "Licence Number";
                break;
            default:
                pnlPatients.Visible = false;
                pnlDoctors.Visible = false;
                pnlDepartment.Visible = true;
                lblJoinDate.Text = "Joinging Date";
                lblIdentity.Text = "Identity";
                break;
        }
    }
    # endregion

    # region "Registration"
    protected void subRegister(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            if (!string.IsNullOrEmpty(_userBasicInfoId))
            {
                updateUser();
            }
            else
            {
                InsertUser();
            }
            //if (InsertUser())
            //{
            //    lblErr.Text = ddlRoles.SelectedItem.Text + " has been registered successfully!";
            //    pnlTable.Visible = true;
            //    pnlDetails.Visible = false;
            //    loadUserInformation();
            //}
        }
    }

    private void InsertUser()
    {
        lblErr.Visible = true;
        string username = null;
        string password = Membership.GeneratePassword(8, 1);
        string email = null;
        string secquestion = "Give default question as empty";
        string secanswer = "default";
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
                    Roles.AddUserToRole(newUser.UserName, ddlRoles.SelectedItem.Text);
                    Guid newUId = new Guid(newUser.ProviderUserKey.ToString());
                    int res=saveBasicInfo(newUId);
                    if (res == 1)
                    {
                        string strFullName = txtFName.Text + " " + txtLName.Text;
                        StringBuilder strBody = new StringBuilder();
                        // strBody.Append("<div><a href='www.brdhchumber.com'><img src='www.brdhchumber.com/images/mailHeader.jpg' /></a>");
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
                        //strBody.Append("<br /></div>");

                        string emailResult = objCommon.sendEMail(email, strBody.ToString(), "BRDHC Humber Registration", true);
                        if (!string.IsNullOrEmpty(emailResult))
                        {
                            lblErr.Text = emailResult;
                        }
                        lblErr.Text = ddlRoles.SelectedItem.Text + " registered successfully!";
                    }
                    else
                    {
                        Membership.DeleteUser(newUser.UserName);
                        lblErr.Text = "Operation failed.";
                        
                    }
                }
            }
            catch (Exception ex)
            {
                Membership.DeleteUser(newUser.UserName);
                lblErr.Text = ex.Message.ToString();
            }
        }
    }
    private void updateUser()
    {
        lblErr.Visible = true;
        try
        {
            updateBasicInfo();
            MembershipUser user = Membership.GetUser(Guid.Parse(_userId));
            user.Email = txtEmail.Text;
            Membership.UpdateUser(user);
            lblErr.Text = "User information updated successfully!";
        }
        catch (Exception ex)
        {
            lblErr.Text = ex.Message.ToString();
        }
    }
    private int saveBasicInfo(Guid userId)
    {
       return objUDet.saveUserBasicInfo(userId, txtFName.Text, txtLName.Text, txtDOB.Text, rdblGender.SelectedItem.Value.ToString(), txtIdentity.Text, txtAddress.Text, ddlCity.SelectedValue.ToString(), ddlStateAjax.SelectedValue.ToString(), txtPostalCode.Text, txtPhone.Text, txtFax.Text, txtFDoctor.Text, txtDepartment.Text, txtJoiningDate.Text, ddlSpecialities.SelectedValue.ToString(), txtCommunityName.Text);
    }
    private void updateBasicInfo()
    {
        objUDet.updateUserBasicInfo(_userBasicInfoId, txtFName.Text, txtLName.Text, txtDOB.Text, rdblGender.SelectedItem.Value.ToString(), txtIdentity.Text, txtAddress.Text, ddlCity.SelectedValue.ToString(), ddlStateAjax.SelectedValue.ToString(), txtPostalCode.Text, txtPhone.Text, txtFax.Text, txtFDoctor.Text, txtDepartment.Text, txtJoiningDate.Text, ddlSpecialities.SelectedValue.ToString(), txtCommunityName.Text);
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

    #region "Repeater Events and Bind"
    private void loadUserInformation()
    {
        resetControls();
        if (string.IsNullOrEmpty(_roleName)) 
        {
            lblErr.Visible = true;
            lblErr.Text = "Please select any role.";
            rptUserDetails.Visible = false;
        }
        else
        {

            string appName = WebConfigurationManager.AppSettings["appName"].ToString();
            //string roleName;
            //roleName = "";
            //roleName = ddlRolesDes.SelectedItem.Text.ToLower();
            List<sp_SearchUsersResult> objUsers = objUDet.getUserDetails(appName, _roleName);
            if (objUsers.Count > 0)
            {
                rptUserDetails.Visible = true;
                rptUserDetails.DataSource = objUsers;
                rptUserDetails.DataBind();
            }
            else
            {
                lblErr.Visible = true;
                lblErr.Text = "No records found.";
            }
        }
    }
    protected void rptUserDetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {

        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {

            // --------------------------- FOR JOIN DATE ---------------------
            Label lblJoinDate = (Label)(e.Item as RepeaterItem).FindControl("lblJoinDate");
            if (((Object)(DataBinder.Eval(e.Item.DataItem, "JoinDate"))) == null)
            {
                lblJoinDate.Text = "N/A";
            }
            else if ((DataBinder.Eval(e.Item.DataItem, "JoinDate")).ToString() == string.Empty)
            {
                lblJoinDate.Text = "N/A";
            }

            // --------------------------- FOR SPECIALITY ---------------------
            Label lblSpec = (Label)(e.Item as RepeaterItem).FindControl("lblSpec");
            if (((Object)(DataBinder.Eval(e.Item.DataItem, "Speciality"))) == null)
            {
                lblSpec.Text = "N/A";
            }
            else if ((DataBinder.Eval(e.Item.DataItem, "Speciality")).ToString() == string.Empty)
            {
                lblSpec.Text = "N/A";
            }

            // --------------------------- FOR DEPARTMENTS ---------------------

            Label lblDep = (Label)(e.Item as RepeaterItem).FindControl("lblDep");
            if (((Object)(DataBinder.Eval(e.Item.DataItem, "Department"))) == null)
            {
                lblDep.Text = "N/A";
            }
            else if ((DataBinder.Eval(e.Item.DataItem, "Department")).ToString() == string.Empty)
            {
                lblDep.Text = "N/A";
            }


            // --------------------------- FOR COMUMNITY GROUP NAMES ---------------------

            Label lblCName = (Label)(e.Item as RepeaterItem).FindControl("lblCName");
            if (((Object)(DataBinder.Eval(e.Item.DataItem, "CommunityGroupName"))) == null)
            {
                lblCName.Text = "N/A";
            }
            else if ((DataBinder.Eval(e.Item.DataItem, "CommunityGroupName")).ToString() == string.Empty)
            {
                lblCName.Text = "N/A";
            }


            if (DataBinder.Eval(e.Item.DataItem, "RoleName").ToString() != roles)
            {
                //Panel pnl = (Panel)(e.Item as RepeaterItem).FindControl("pnlRPT");
                //roles = DataBinder.Eval(e.Item.DataItem, "RoleName").ToString();

                //Label lblRow1 = new Label();
                //lblRow1.ID = "lblRow1";

                //Label lblRow2 = new Label();
                //lblRow2.ID = "lblRow2";

                //Label lblRow3 = new Label();
                //lblRow3.ID = "lblRow3";

                //lblRow1.Text = "<tr><td colspan='10' style='border: none; height: 30px'></td></tr>";
                //lblRow2.Text = "<tr style='background-color:gray; font-size: 24px; color: white;'><td colspan='10' style='text-align:center;'>" + roles + "</td></tr>";


                //if (roles.ToLower() == "patients")
                //{
                //    lblRow3.Text = "<tr style='background-color:#151B54; font-size: 16px; color: white; height:20px'><td style='text-align:center;'>Name</td><td style='text-align:center;'>User Name</td><td style='text-align:center;'>Date of Birth</td><td style='text-align:center;'>Health Card Number</td><td style='text-align:center;'>Department</td><td style='text-align:center;'>Registration Date</td><td style='text-align:center;'>Speciality</td><td style='text-align:center;'>Community Group Name</td><td style='text-align:center;'>Is Locked</td><td style='text-align:center;'>Action</td></tr>";
                //}
                //else {
                //lblRow3.Text = "<tr style='background-color:#151B54; font-size: 16px; color: white; height:20px'><td style='text-align:center;'>Name</td><td style='text-align:center;'>User Name</td><td style='text-align:center;'>Date of Birth</td><td style='text-align:center;'>Identification</td><td style='text-align:center;'>Department</td><td style='text-align:center;'>Join Date</td><td style='text-align:center;'>Speciality</td><td style='text-align:center;'>Community Group Name</td><td style='text-align:center;'>Is Locked</td><td style='text-align:center;'>Action</td></tr>";
                //}
                //pnl.Controls.AddAt(0, lblRow1);
                //pnl.Controls.AddAt(1, lblRow2);
                //pnl.Controls.AddAt(2, lblRow3);

            }
            Button btn = (Button)(e.Item as RepeaterItem).FindControl("btnLock");


            if (DataBinder.Eval(e.Item.DataItem, "IsLocked").ToString() == "Yes")
            {
                btn.Text = "Unlock";
            }
            else
            {
                btn.Text = "Lock";
            }
        }
    }
    protected void rptUserDetails_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        lblErr.Visible = false;
        switch (e.CommandName)
        {
            case "lock":
                lockUser(e);
                break;
            case "editUser":
                editUser(e);
                break;
            case "deleteUser":
                deleteUser(e);
                break;

        }
    }
    protected void lockUser(RepeaterCommandEventArgs e)
    {
        HiddenField hdfUserId = (HiddenField)e.Item.FindControl("hdfUserId");
        HiddenField hdfLock = (HiddenField)e.Item.FindControl("hdfLock");
        if (hdfUserId != null)
        {
            MembershipUser user = Membership.GetUser(new Guid(hdfUserId.Value.ToString()));
            if (user != null)
            {
                if (hdfLock != null)
                {
                    if (hdfLock.Value == "Yes")
                    {
                        user.UnlockUser();
                        Membership.UpdateUser(user);
                    }
                    else
                    {
                        clsUserDetails objUDet = new clsUserDetails();
                        int result = objUDet.lockUser(hdfUserId.Value.ToString());
                        if (result > 0)
                        {
                            lblErr.Visible = true;
                            lblErr.Text = "Error Code: " + result.ToString();
                        }
                    }
                }
            }
        }
        loadUserInformation();
    }
    protected void editUser(RepeaterCommandEventArgs e)
    {
        HiddenField hdfUserId = (HiddenField)e.Item.FindControl("hdfUserId");
        pnlTable.Visible = false;
        pnlDetails.Visible = true;
        txtFName.Focus();
        ddlRoles.SelectedValue = ddlRolesDes.SelectedValue;
        subCheckRoles();
        List<sp_SearchUsersByIdResult> objUser = objUDet.getUserDetailsById(hdfUserId.Value);
        if (objUser.Count == 1)
        {
            _userId = objUser[0].UserId.ToString();
            _userBasicInfoId = objUser[0].UserBasicInfoId.ToString();
            rdblGender.Items.FindByValue(objUser[0].Gender.ToString()).Selected=true;
            txtFName.Text = objUser[0].FirstName;
            txtLName.Text = objUser[0].LastName;
            txtDOB.Text = objUser[0].DOB.ToString(); ;
            ddlSpecialities.SelectedValue = objUser[0].Speciality.ToString();
            txtFDoctor.Text = objUser[0].FamilyDoctor;
            txtDepartment.Text = objUser[0].Department.ToString();
            txtJoiningDate.Text = objUser[0].JoinDate.ToString();
            txtEmail.Text = objUser[0].Email;
            txtIdentity.Text = objUser[0].Identification;
            txtAddress.Text = objUser[0].Address;
            ddlStateAjax.SelectedValue = objUser[0].StateId.ToString();
            loadCities();
            ddlCity.SelectedValue = objUser[0].CityId.ToString();
            txtPostalCode.Text = objUser[0].PostalCode;
            txtPhone.Text = objUser[0].Phone;
            txtFax.Text = objUser[0].Fax;
            txtCommunityName.Text = objUser[0].CommunityGroupName;
            btnRegister.Text = "Update";
        }

       
    }
    protected void deleteUser(RepeaterCommandEventArgs e)
    {
        try
        {
            HiddenField hdfUserId = (HiddenField)e.Item.FindControl("hdfUserId");
            MembershipUser user = Membership.GetUser(Guid.Parse(hdfUserId.Value.ToString()));
            Membership.DeleteUser(user.UserName);
            loadUserInformation();
            lblErr.Visible = true;
            lblErr.Text = "User deleted successfully.";
        }
        catch (Exception ex)
        {
            lblErr.Visible = true;
            lblErr.Text = ex.Message.ToString();
        }

    }
    # endregion

    # region ADD , CANCEL , RESET CONTROL SUB ROUTINES"
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        lblErr.Visible = false;
        lblErr.Text = string.Empty;
        pnlTable.Visible = false;
        pnlDetails.Visible = true;
        txtFName.Focus();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        lblErr.Visible = false;
        pnlTable.Visible = true;
        pnlDetails.Visible = false;
        loadUserInformation();
    }
    private void resetControls()
    {
        lblErr.Visible = false;
        _userId = string.Empty;
        _userBasicInfoId = string.Empty;
        txtFName.Text = string.Empty;
        txtLName.Text = string.Empty;
        txtDOB.Text = string.Empty;
        txtFDoctor.Text = string.Empty;
        calJoingDate.SelectedDate = DateTime.Now;
        txtEmail.Text = string.Empty;
        txtIdentity.Text = string.Empty;
        txtAddress.Text = string.Empty;
        txtPostalCode.Text = string.Empty;
        txtPhone.Text = string.Empty;
        txtFax.Text = string.Empty;
        txtCommunityName.Text = string.Empty;
        txtDepartment.Text = string.Empty;
        if (ddlRoles.Items.Count > 0)
            ddlRoles.SelectedIndex = 0;        
        if (ddlSpecialities.Items.Count > 0)
            ddlSpecialities.SelectedIndex = 0;
        if (ddlStateAjax.Items.Count > 0)
            ddlStateAjax.SelectedIndex = 0;
        loadCities();

    }
    # endregion

    protected void subSearchUsers(object sender, EventArgs e)
    {
        _roleName = ddlRolesDes.SelectedItem.Text.ToLower();
        loadUserInformation();
    }
}