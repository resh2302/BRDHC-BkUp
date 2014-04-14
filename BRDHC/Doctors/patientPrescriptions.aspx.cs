using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Doctors_patientPrescriptions : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Label lblDashboard = Master.dashboardHeading;
            lblDashboard.Text = "DOCTORS DASHBOARD : PRESCRIPTIONS";
            loadRecords();
        }

    }

    protected void loadRecords() { 
        clsPrescriptions objPres = new clsPrescriptions();
        List<sp_SearchPrescriptionsByPatientNameResult> objRes = objPres.getPrescriptionsByPatientName(txtSearchPres.Text);
        if (objRes.Count > 0)
        {
            grvRecords.DataSource = objRes;
            grvRecords.DataBind();
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

            //if (lbl_PrescId.Text == "0")
            //{
            //    lbtnEdit.Visible = false;
            //}
            //else
            //{
            //   // lbtnDelete.Attributes.Add("onClientClick", "javascript:alert('hello');");
            //    lbtnPresc.Visible = false;
            //}
        }
    }
}