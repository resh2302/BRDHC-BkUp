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
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        clsPrescriptions objPres = new clsPrescriptions();
        IQueryable<brdhc_PatientPrescription> o = objPres.getPrescription("1");
        IQueryable<brdhc_PrescriptionDetail> details = objPres.getPrescriptionDetails(1);
    }
}