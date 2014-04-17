<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="eventsCalendar.aspx.cs" Inherits="Default3" %>
<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    <link rel="stylesheet" href="App_Themes/Theme/eventCalendar.css" />
    <script src="<%# Page.ResolveClientUrl("~/js/eventCalendar.js") %>" type="text/javascript"></script>
    <div class="eventsWrapper">
        <section id="cHeader">Events</section>
        <asp:Image runat="server" ID="img_main" CssClass="eImg" ImageUrl="~/images/eventsCal.png" Width="100%" />
        <br />
        <div class="eHeader col-md-12">
            <asp:Label ID="lbl_descM" runat="server" CssClass="" Text="Here at Blind River District Hopsital, we pride ourselves on keeping the community around us up to date on what's happening. 
                Here you'll see public events posted by major and minor organisatons and groups around our community. We hope that you find an event that can lighten your day, and hope you get to know and network with others from around the
                Blind River Community." />
        </div>
        <asp:Panel ID="pnl_calendar" runat="server">
            <h1 class="hEvents">Upcoming Events</h1>
            <div class="upEvents col-md-12">
                <asp:Repeater ID="rpt_up" runat="server">
                    <ItemTemplate>
                        <asp:Label ID="lbl_one" CssClass="uTitle" runat="server" Text="Title: " />
                        <asp:Label ID="lbl_evT" CssClass="uTitle" runat="server" Text='<%# Eval("EventTitle") %>' />
                        <div class="addBorder">
                            <br />
                            <asp:Label ID="lbl_two" CssClass="uBy" runat="server" Text="Hosted By: " />
                            <asp:Label ID="lbl_byU" CssClass="uBy" runat="server" Text='<%# Eval("EventsHeldBy") %>' />
                            <br />
                            <br />
                            <asp:Label ID="lbl_decU" CssClass="uDesc" runat="server" Text='<%#Eval("EventDescription") %>' />
                            <br />
                            <asp:Label ID="lbl_five" CssClass="uDesc" runat="server" Text="Location: " />
                            <asp:Label ID="Label1" CssClass="uDesc" runat="server" Text='<%#Eval("EventLocation") %>' />
                            <br />
                            <asp:Label ID="lbl_three" CssClass="uDate" runat="server" Text="From: " />
                            <asp:Label ID="lbl_from" CssClass="uDate" runat="server" Text='<%#DateTime.Parse(Eval("EventStartTime").ToString()).ToString("MMMM/d/yyyy hh:mm tt") %>' />
                            <br />
                            <asp:Label ID="lbl_four" CssClass="uDate" runat="server" Text="Until: " />
                            <asp:Label ID="lbl_until" runat="server" CssClass="uDate" Text='<%#DateTime.Parse(Eval("EventEndTime").ToString()).ToString("MMMM/d/yyyy hh:mm tt") %>' />
                            <br />
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <h1 class="hEvents">Calendar and Weekly Schedule</h1>
            <input type="submit" class="btn_cws" runat="server" value="View Schedual" onclick="return false;" />
            <input type="submit" class="btn_close" runat="server" value="Close Schedual" onclick="return false;" />
            <br />
            <br />
            <div class="calContainer">
                <div class="sCalendar col-md-4">
                    <asp:Calendar ID="small_calendar" runat="server" SelectionMode="DayWeek" OnDayRender="smallCalendar" />
                </div>
                <div class="eArticles col-md-6">
                    <article>
                        This is the Calendar and Weekly Schedual. If there is an event on any given day, it will show up as Green on the mini-calendar. To navigate week to week, just click next to the week you'd like to view on the mini-calendar, and it should load on the
                    weekly schedual below. 
                    </article>
                    <br />
                    <article>
                        By clicking events on the weekly schedual, you will be directed to a page with more information about that particular event. 
                    </article>
                </div>
                <div class="bCalendar col-lg-12">
                    <DayPilot:DayPilotCalendar ID="Calendar" runat="server" ColumnMarginRight="5" EventClickHandling="PostBack" OnEventClick="DayPilotCalendar1_EventClick" BusinessBeginsHour="6" BusinessEndsHour="24"></DayPilot:DayPilotCalendar>
                </div>
            </div>
        </asp:Panel>
        <br />
        <asp:Panel ID="pnl_singlE" runat="server">
            <div class="col-lg-12">
                <asp:ListView ID="lv_singleE" runat="server">
                    <ItemTemplate>
                        <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("EventId") %>' />
                        <h2>"<asp:Label ID="lbl_title" runat="server" Text='<%#Eval("EventTitle") %>' />"</h2>
                        <h3>Hosted By:
                        <asp:Label ID="lbl_heldBy" runat="server" Text='<%#Eval("EventsHeldBy") %>' />
                            <br />
                            Location:
                        <asp:Label ID="lbl_loc" runat="server" Text='<%#Eval("EventLocation") %>' />
                        </h3>
                        <br />
                        <br />
                        <article class="viewMsg">
                            <asp:Label ID="lbl_desc" runat="server" Text='<%#Eval("EventDescription") %>' />
                        </article>
                        <br />
                        <asp:Label ID="lbl_sTime" runat="server" Text='<%#DateTime.Parse(Eval("EventStartTime").ToString()).ToString("MMMM/ddd/yyyy hh:mm tt") %>' />
                        <br />
                        <asp:Label ID="lbl_eTime" runat="server" Text='<%#DateTime.Parse(Eval("EventEndTime").ToString()).ToString("MMMM/ddd/yyyy hh:mm tt") %>' />
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </asp:Panel>
    </div>
</asp:Content>


