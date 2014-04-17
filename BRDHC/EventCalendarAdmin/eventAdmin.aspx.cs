using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class eventAdmin : System.Web.UI.Page
{
    eventsClass objEvents = new eventsClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        Label lblDashboard = Master.dashboardHeading;
        lblDashboard.Text = "EVENT ADMIN DASHBOARD :";
        subLoadAll();
        _panelControl(pnl_add);
        lbl_message.Visible = false;
    }
    private void subLoadAll()
    {
        IQueryable<brdhc_Event> objData = objEvents.getEvents();
        lst_all.Items.Clear();
        lst_all.DataSource = objData;
        lst_all.EditIndex = -1;
        lst_all.DataBind();

    }
    private void _subRebind()
    {
        txt_date.Text = string.Empty;
        txt_des.Text = string.Empty;
        txt_host.Text = string.Empty;
        txt_loc.Text = string.Empty;
        txt_title.Text = string.Empty;
    }
    protected void cancel(object sender, EventArgs e)
    {
        _subRebind();
    }
    public void viewAll(object sender, CommandEventArgs e)
    {
        _panelControl(pnl_viewAll);
        subLoadAll();
    }
    public void viewAdd(object sender, CommandEventArgs e)
    {
        _panelControl(pnl_add);
        _subRebind();
    }

    protected void _showUpdate(Guid id)
    {
        _panelControl(pnlUpdate);
        lv_update.DataSource = objEvents.getEventByID(id);
        lv_update.DataBind();
    }
    private void _panelControl(Panel pnl)
    {
        pnl_add.Visible = false;
        pnl_viewAll.Visible = false;
        pnlUpdate.Visible = false;
        pnl.Visible = true;
    }

    //protected void addEventC(object sender, CommandEventArgs e)
    //{

    //    switch (e.CommandName)
    //    {
    //        case "Insert":
    //            _strMessage(objEvents.insertEvent(Guid.NewGuid(), txt_title.Text, txt_des.Text, Guid.NewGuid(), DateTime.Parse(txt_date.Text), tms_start.ToString(), tms_end.ToString(), txt_loc.Text, txt_host.Text), "Worked"); 
    //          break;
    //        case "Cancel":
    //          _subRebind();
    //            break;
    //    }
    //}
    protected void subCommandsEvents(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "View":
                _showUpdate(Guid.Parse(e.CommandArgument.ToString()));
                break;
            case "DeleteA":
                _deleteEvent(e);
                break;
        }
    }

    protected void deleteEvent(object sender, CommandEventArgs e)
    {
        objEvents.deleteEvent(Guid.Parse(e.CommandArgument.ToString()));
    }

    protected void updateEvent(object sender, ListViewCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "UpdateE":
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                TextBox txtTitle = (TextBox)e.Item.FindControl("txt_titleU");
                TextBox txtHost = (TextBox)e.Item.FindControl("txt_hostU");
                FreeTextBoxControls.FreeTextBox txtDesc = (FreeTextBoxControls.FreeTextBox)e.Item.FindControl("txt_descU");
                TextBox txtDate = (TextBox)e.Item.FindControl("txt_dateU");
                TextBox txtLoc = (TextBox)e.Item.FindControl("txt_locU");
                MKB.TimePicker.TimeSelector tmsStart = (MKB.TimePicker.TimeSelector)e.Item.FindControl("tms_startU");
                MKB.TimePicker.TimeSelector tmsEnd = (MKB.TimePicker.TimeSelector)e.Item.FindControl("tms_endU");

                Guid eventId = Guid.Parse(hdfID.Value.ToString());
                //objEvents.updateEvent(eventId.ToString(), txtTitle.Text, txtDesc.Text, txtDate.Text, DateTime.Parse(tmsStart.ToString()), DateTime.Parse(tmsEnd.ToString()), txtLoc.Text, txtHost.Text);
                break;
            case "DeleteE":
                _deleteEvent(e);
                break;
        }
    }

    protected void _deleteEvent(ListViewCommandEventArgs e)
    {
        Guid id = Guid.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
        objEvents.deleteEvent(id);
    }
    protected void insertEvent(object sender, EventArgs e)
    {

        DateTime startTime = DateTime.Parse(string.Format("{0}:{1}:{2} {3}", tms_start.Hour, tms_start.Minute, tms_start.Second, tms_start.AmPm));
        DateTime endTime = DateTime.Parse(string.Format("{0}:{1}:{2} {3}", tms_end.Hour, tms_end.Minute, tms_end.Second, tms_end.AmPm));

        _strMessage(objEvents.insertEvent(Guid.NewGuid(), txt_title.Text, txt_des.Text, Guid.NewGuid(), DateTime.Parse(txt_date.Text), txt_date.Text + " " + startTime.ToString("hh:mm:ss tt"), 
            txt_date.Text + " " + endTime.ToString("hh:mm:ss tt"), txt_loc.Text, txt_host.Text), txt_title.Text);
        _subRebind();
    }

    private void _strMessage(bool flag, string str)
    {   
        lbl_message.Visible = true;
        if (flag)
            
            lbl_message.Text = "The Event called: " + str + " has been added.";
        else
            lbl_message.Text = "Sorry, unable to add Event called" + str + ".";
    }

}