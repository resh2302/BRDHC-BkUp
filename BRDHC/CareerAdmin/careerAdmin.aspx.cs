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
        if (!Page.IsPostBack)
        {
            subLoadAll();
            _panelControl(pnlAdd);
            ddl_job.DataSource = objCareer.getJobs();
            ddl_job.DataTextField = "JobTitle";
            ddl_job.DataValueField = "JobPostId";
            ddl_job.DataBind();
            ddl_job.Items.Insert(0, new ListItem("--- Select Career---"));
            ddl_job.SelectedIndex = 0;
        }
    }

    private void _panelControl(Panel pnl)
    {
        pnlAdd.Visible = false;
        pnlViewAll.Visible = false;
        pnlUpdate.Visible = false;
        pnl.Visible = true;
    }

    public void viewAll(object sender, CommandEventArgs e)
    {
        subLoadAll();
        _subRebind();
        _panelControl(pnlViewAll);
    }

    private void subLoadAll()
    {
        IQueryable<brdhc_JobPost> objData = objCareer.getJobs();
        lv_allJobs.Items.Clear();
        lv_allJobs.DataSource = objData;
        lv_allJobs.EditIndex = -1;
        lv_allJobs.DataBind();
    }

    private void loadApps(Guid id)
    {
        IQueryable<brdhc_JobApplication> objAppData = objApplication.getAppByJobID(id);
        lv_apps.Items.Clear();
        lv_allJobs.DataSource = objAppData;
        lv_allJobs.EditIndex = -1;
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
        _strMessage(objCareer.insertJob(Guid.NewGuid(), //Guid.NewGuid(), 
            txt_pos.Text, txt_des.Text, DateTime.Parse(DateTime.Now.ToString()), DateTime.Parse(txt_exp.Text), txt_email.Text, true), txt_pos.Text.ToString());
        _subRebind();
        break;
        case "Cancel":
        _subRebind();
        break;
        }
    }

    protected void subCommands(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                _showUpdate(Guid.Parse(e.CommandArgument.ToString()));
                break;
            case "Delete":
                deleteCareer(e);
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
        Guid id = Guid.Parse(((HiddenField)e.Item.FindControl("hdf_id")).Value);
        objCareer.deleteJob(id);
    }

    protected void updateCareer(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idU");
                TextBox txtPos = (TextBox)e.Item.FindControl("txt_posU");
                TextBox txtDesc = (TextBox)e.Item.FindControl("txt_descU");
                TextBox txtEmail = (TextBox)e.Item.FindControl("txt_emailU");
                TextBox txtExp = (TextBox)e.Item.FindControl("txt_expU");

                Guid jobIDU = Guid.Parse(hdfID.Value.ToString());
                objCareer.updateJob(jobIDU.ToString(), txtPos.Text, txtDesc.Text, DateTime.Parse(txtExp.Text), txtEmail.Text);
                break;
            case "Delete":
                deleteCareer(e);
                break;
        }
        
    }

    private void _strMessage(bool flag, string str)
    {
        if (flag)
            lbl_message.Text = "The Position of: " + str + " has been added.";
        else
            lbl_message.Text = "Sorry, unable add " + str + " as a new career.";
    }
}