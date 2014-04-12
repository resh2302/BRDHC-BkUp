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
       // pnlTable.Visible = true;
       // pnlDetails.Visible = false;
        loadRecords();
    }
}