using System;
using System.Collections.Generic;
using System.Linq;
using DayPilot.Web;
using DayPilot.Web.Ui.Events;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Default3 : System.Web.UI.Page
{
    eventsClass objEvents = new eventsClass();

    protected void _panelControl(Panel pnl)
    {
        pnl_calendar.Visible = false;
        pnl_singlE.Visible = false;
        pnl.Visible = true;
    }
        
    private void _upcoming()
    {
       //eventsCalendarDataContext db = new eventsCalendarDataContext();
       //var upcoming = (from u in db.brdhc_Events where u.EventDate >= DateTime.Today select u);
        rpt_up.DataSource = objEvents.upcomingEvents();
        rpt_up.DataBind();

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        _upcoming();
        _panelControl(pnl_calendar);
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "work", "<script type='text/javascript'>onloadUp();</script>", false);



        if (!Page.IsPostBack)
        {
            Calendar.DataSource = objEvents.getEvents();
            Calendar.DataStartField = "EventStartTime";
            Calendar.DataEndField = "EventEndTime";
            Calendar.DataTextField = "EventTitle";
            Calendar.DataValueField = "EventId";
            Calendar.BusinessBeginsHour = 7;
            Calendar.Days = 7;
            Calendar.StartDate = DayPilot.Utils.Week.FirstDayOfWeek();
            Calendar.DataBind();
        }
        if (Page.IsPostBack)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "please", "<script type='text/javascript'>postbackSlideDown();</script>", false);
        }
    }

    protected void DayPilotCalendar1_EventClick(object sender, EventClickEventArgs e)
    {
        if (Page.IsPostBack)
        {
            Guid eventID = Guid.Parse(e.Value);
            _showEvent(eventID);
        }
    }

    protected void _showEvent(Guid id)
    {
        _panelControl(pnl_singlE);
        lv_singleE.DataSource = objEvents.getEventByID(id);
        lv_singleE.DataBind();
    }

    protected void back(object sender, EventClickEventArgs e)
    {
        _panelControl(pnl_calendar);
        
    }
    protected void smallCalendar(object sender, System.Web.UI.WebControls.DayRenderEventArgs e)
    {
        if (Page.IsPostBack)
        {
            Calendar.StartDate = small_calendar.SelectedDate;
            Calendar.DataSource = objEvents.getEvents();
        }
        e.Day.IsSelectable = false;
       eventsCalendarDataContext db = new eventsCalendarDataContext();
       var events = (from p in db.brdhc_Events where p.EventDate == e.Day.Date select p);
       var upcoming = (from u in db.brdhc_Events where u.EventDate >= DateTime.Today select u);

       if (events.Count() > 0)
       {
           foreach (brdhc_Event x in events)
           {
               e.Cell.BackColor = System.Drawing.Color.DarkGreen;
               e.Cell.Font.Bold = true;
               e.Cell.ForeColor = System.Drawing.Color.White;
           }
       }

    }



    protected void btn_cws_Click(object sender, EventArgs e)
    {

    }
}