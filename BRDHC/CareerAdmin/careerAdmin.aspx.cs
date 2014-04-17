using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class careerAdmin : System.Web.UI.Page
{
    careersClass objCareer = new careersClass();
    careerAppClass objApplication = new careerAppClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Label lblDashboard = Master.dashboardHeading;
        lblDashboard.Text = "CAREER ADMIN DASHBOARD :";
        if (!Page.IsPostBack)
        {
            subLoadAll();
            _panelControl(pnlAdd);
            ddl_job.DataSource = objCareer.getJobs();
            ddl_job.DataTextField = "JobPostTitle";
            ddl_job.DataValueField = "JobPostId";
            ddl_job.DataBind();
            ddl_job.Items.Insert(0, new ListItem("--- Select Career---"));
            ddl_job.SelectedIndex = 0;
        }
    }

    protected void ddlCareer(object sender, EventArgs e)
    {
        if (ddl_job.SelectedIndex > 0)
        {
            loadAppIndex();
            subLoadAll();
            ddl_job.SelectedIndex = 0;
        }

        else
        {
            subLoadAll();
            loadAppIndex();
        }
    }

    private void _panelControl(Panel pnl)
    {
        pnlAdd.Visible = false;
        pnlApps.Visible = false;
        pnlViewAll.Visible = false;
        pnlUpdate.Visible = false;
        pnlSingleApp.Visible = false;
        pnl.Visible = true;
    }

    public void viewAddC(object sender, CommandEventArgs e)
    {
        _panelControl(pnlAdd);
    }

    public void viewAll(object sender, CommandEventArgs e)
    {
        subLoadAll();
        _subRebind();
        _panelControl(pnlViewAll);
    }
    public void viewApps(object sender, CommandEventArgs e)
    {
        subLoadAll();
        _subRebind();
        _panelControl(pnlApps);
    }

    private void subLoadAll()
    {
        IQueryable<brdhc_JobPost> objData = objCareer.getJobs();
        lv_allJobs.Items.Clear();
        lv_allJobs.DataSource = objData;
        lv_allJobs.EditIndex = -1;
        lv_allJobs.DataBind();
    }

    protected void loadAppIndex()
    {
        Guid id = Guid.Parse(ddl_job.SelectedValue.ToString());
        IQueryable<brdhc_JobApplication> objAppData = objApplication.getAppByJobID(id);
        lv_apps.Items.Clear();
        lv_apps.DataSource = objAppData;
        lv_apps.EditIndex = -1;
        lv_apps.DataBind();
    }

    private void subLoadApps()
    {
        IQueryable<brdhc_JobApplication> objData = objApplication.getApps();
        lv_apps.Items.Clear();
        lv_apps.DataSource = objData;
        lv_apps.EditIndex = -1;
        lv_apps.DataBind();
    }

    private void _subRebind()
    {
        txt_pos.Text = string.Empty;
        txt_des.Text = string.Empty;
        txt_email.Text = string.Empty;
    }

    protected void addCareer(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMessage(objCareer.insertJob(Guid.NewGuid(),
                    txt_pos.Text, txt_des.Text, DateTime.Parse(DateTime.Now.ToString()), DateTime.Parse(txt_exp.Text), txt_email.Text, true), txt_pos.Text.ToString());
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }

    protected void subCommandsCareers(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "UpdateV":
                _showUpdate(Guid.Parse(e.CommandArgument.ToString()));
                break;
            case "DeleteC":
                deleteCareer(e);
                break;
        }
    }
    protected void subCommandsApps(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "View":
                _showApp(Guid.Parse(e.CommandArgument.ToString()));
                _panelControl(pnlSingleApp);
                break;
            case "DeleteA":
               _deleteApp(e);
               subLoadAll();
               subLoadApps();
               _panelControl(pnlApps);
                break;
        }
    }

    protected void _showUpdate(Guid id)
    {
        _panelControl(pnlUpdate);
        lv_update.DataSource = objCareer.getJobByID(id);
        lv_update.DataBind();
    }

    protected void deleteCareer(ListViewCommandEventArgs e)
    {
        Guid id = Guid.Parse(((HiddenField)e.Item.FindControl("hdf_idC")).Value);
        objCareer.deleteJob(id);
    }

    protected void updateCareer(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "UpdateC":
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idC");
                TextBox txtPos = (TextBox)e.Item.FindControl("txt_posU");
                //TextBox txtDesc = (TextBox)e.Item.FindControl("txt_descU");
                FreeTextBoxControls.FreeTextBox txtDesc = (FreeTextBoxControls.FreeTextBox)e.Item.FindControl("txt_descU");
                TextBox txtEmail = (TextBox)e.Item.FindControl("txt_emailU");
                TextBox txtExp = (TextBox)e.Item.FindControl("txt_expU");

                Guid jobIDU = Guid.Parse(hdfID.Value.ToString());
                objCareer.updateJob(jobIDU.ToString(), txtPos.Text, txtDesc.Text, DateTime.Parse(txtExp.Text), txtEmail.Text);
                lbl_msgU.Text = "Career Updated";
                break;
            case "DeleteCC":
                deleteCareer(e);
                break;
        }

    }

    protected void _showApp(Guid id)
    {
        _panelControl(pnlSingleApp);
        lv_singleApp.DataSource = objApplication.getAppByID(id);
        lv_singleApp.DataBind();
    }

    protected void _deleteApp(ListViewCommandEventArgs e)
    {
        Guid id = Guid.Parse(((HiddenField)e.Item.FindControl("hdf_idA")).Value);
        objApplication.deleteApp(id);
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
            lbl_message.Text = "The Position of: " + str + " has been added.";
        else
            lbl_message.Text = "Sorry, unable add " + str + " as a new career.";
    }
}