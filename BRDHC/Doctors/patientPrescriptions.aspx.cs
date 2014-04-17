using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Doctors_patientPrescriptions : System.Web.UI.Page
{
    MembershipUser user = Membership.GetUser();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Label lblDashboard = Master.dashboardHeading;
            if (Roles.IsUserInRole(user.UserName, "Doctors"))
            {
                lblDashboard.Text = "DOCTOR ADMIN DASHBOARD : PRESCRIPTIONS";
            }
            else
            {
                lblDashboard.Text = "ADMIN DASHBOARD : PRESCRIPTIONS";
            }
            loadRecords();
        }

    }

    protected void loadRecords() { 
        clsPrescriptions objPres = new clsPrescriptions();
        if (Roles.IsUserInRole(user.UserName, "Doctors"))
        {
            List<sp_SearchPrescriptionsByDocIdResult> objRes = objPres.getPrescriptionsByDocId(txtSearchPres.Text, Guid.Parse(user.ProviderUserKey.ToString()));
            if (objRes.Count > 0)
            {
                grvRecords.DataSource = objRes;
                grvRecords.DataBind();
            }
        }
        else
        {
            List<sp_SearchPrescriptionsByPatientNameResult> objRes = objPres.getPrescriptionsByPatientName(txtSearchPres.Text);
            if (objRes.Count > 0)
            {
                grvRecords.DataSource = objRes;
                grvRecords.DataBind();
            }
        }
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        loadRecords();
    }
    protected void btnPresSearch_Click(object sender, EventArgs e)
    {
        loadRecords();
    }
    protected void grvRecords_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lbl_PrescId = (Label)e.Row.FindControl("lbl_PrescId");
            Button lbtnEdit = (Button)e.Row.FindControl("lbtnEdit");
            Button lbtnDelete = (Button)e.Row.FindControl("lbtnDelete");
            Button lbtnPresc = (Button)e.Row.FindControl("lbtnPresc");
            lbtnDelete.OnClientClick = "javascript:deletePresc('" + e.Row.RowIndex + "','" + lbl_PrescId.Text + "',this); return false;";

        }
    }
}