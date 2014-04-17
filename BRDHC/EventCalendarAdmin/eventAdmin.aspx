<%@ Page Title="" ValidateRequest="false" Language="C#" MasterPageFile="~/brdhc.master" AutoEventWireup="true" CodeFile="eventAdmin.aspx.cs" Inherits="eventAdmin" %>
<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="MKB" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<%@ MasterType VirtualPath="~/brdhc.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    <script type="text/javascript"> /* Make this user control */
        $(document).ready(function () {
            console.log("Script loaded");
            $('.dashboardMenuBtn').click(function (e) {
                e.preventDefault();
                $('.pnlLeftMenu').toggleClass('active');
            });

            function replyExpand() {
                $(".replyBox").animate({ height: '460px', overflow: 'auto' }, 750, 'swing');
            }
        });
    </script>
    <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">
        <asp:Panel ID="Panel1" CssClass="pnlContainer" runat="server">

            <asp:Panel ID="pnlHead" runat="server">

                <asp:Label ID="lblDashboard" CssClass="lblDashboard" runat="server" />

                <asp:LinkButton ID="mnuToggle" CssClass="dashboardMenuBtn btn" PostBackUrl="#" runat="server" />

            </asp:Panel>
            <asp:Panel ID="pnlDashboard" runat="server">

                <asp:Panel ID="pnlLeftMenu" CssClass="pnlLeftMenu" runat="server">

                </asp:Panel>
                <asp:Panel ID="pnl_add" runat="server">
                    <asp:Button ID="btn_all" runat="server" CssClass="btnCancel" Text="View All Events" OnCommand="viewAll" />
                    <br />
                    <asp:Label ID="lbl_message" CssClass="statusMsg" runat="server" />
                    <br />
                    <br />
                    <h1>Add an Event</h1>
                    <asp:Label ID="lbl_title" Text="Title:" runat="server" CssClass="infoLabel" />
                    <asp:TextBox ID="txt_title" runat="server" CssClass="textContact" />
                    <asp:RequiredFieldValidator ID="rfv_title" ControlToValidate="txt_title" runat="server" Text="*Required" ValidationGroup="Events" />
                    <br />
                    <asp:Label ID="lbl_loc" Text="Location:" runat="server" CssClass="infoLabel" />
                    <asp:TextBox ID="txt_loc" runat="server" CssClass="textContact" />
                    <asp:RequiredFieldValidator ID="rfv_loc" ControlToValidate="txt_loc" runat="server" Text="*Required" ValidationGroup="Events"  />
                    <br />
                    <asp:Label ID="lbl_host" Text="Host:" runat="server" CssClass="infoLabel" />
                    <asp:TextBox ID="txt_host" runat="server" CssClass="textContact" />
                    <asp:RequiredFieldValidator ID="rfv_host" ControlToValidate="txt_host" runat="server" Text="*Required" ValidationGroup="Events"  />
                    <br />
                    <asp:Label ID="lbl_des" Text="Description:" CssClass="infoLabel" runat="server" />
                    <br />
                    <FTB:FreeTextBox ID="txt_des" runat="server" />
                    <asp:RequiredFieldValidator ID="rfv_des" ControlToValidate="txt_des" runat="server" Text="*Required" ValidationGroup="Events"  />
                    <br />
                    <asp:Label ID="lbl_date" Text="Date :" runat="server" CssClass="infoLabel" />
                    <asp:TextBox ID="txt_date" runat="server" AutoPostBack="true" onkeypress="return false;" />
                    <asp:RequiredFieldValidator ID="rfv_date" ControlToValidate="txt_date" runat="server" Text="*Required" ValidationGroup="Events"  />
                    <ajax:CalendarExtender ID="cd_date" FirstDayOfWeek="Monday" EnableViewState="true" PopupPosition="BottomRight" Format="yyyy-MM-dd" TargetControlID="txt_date" PopupButtonID="imgCal" runat="server"></ajax:CalendarExtender>
                    &nbsp;<asp:ImageButton ID="imgCal" runat="server" ImageUrl="~/images/calendar_icon.png" ToolTip="Select Appointment Date" />
                    <br />
                    <asp:Label ID="lbl_startTime" Text="Start Time :" runat="server" CssClass="infoLabel" />
                    <br />
                    <MKB:TimeSelector ID="tms_start" runat="server"></MKB:TimeSelector>
                    <br />
                    <asp:Label ID="lbl_endTime" Text="End Time :" runat="server" CssClass="infoLabel" />
                    <br />
                    <MKB:TimeSelector ID="tms_end" runat="server"></MKB:TimeSelector>
                    <br />
                    <asp:Button ID="btn_msg" Text="Add" runat="server" CausesValidation="true" ValidationGroup="Events" OnClick="insertEvent" />
                     <asp:Button ID="Button1" Text="Cancel" runat="server" OnClientClick="return confirm('Are you sure you want to Cancel?')" OnClick="cancel" />
                    <br />
                    <br />
                </asp:Panel>
                <asp:Panel ID="pnl_viewAll" runat="server">
                    <asp:Button ID="btn_viewAdd" runat="server" CssClass="btnCancel" Text="Add an Event" OnCommand="viewAdd" />
                    <table class="blueTable table">
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>Hosted By</th>
                                <th>Dates</th>
                                <th></th>
                            </tr>
                        </thead>
                        <asp:ListView ID="lst_all" runat="server" OnItemCommand="subCommandsEvents">
                            <ItemTemplate>
                                <tr>
                                    <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("EventId") %>' />
                                    <td><%#Eval("EventTitle") %></td>
                                    <td><%#Eval("EventsHeldBy") %></td>
                                    <td>From: <%#DateTime.Parse(Eval("EventStartTime").ToString()).ToString("MMMM/d/yyyy hh:mm tt") %>
                                        Until: <%#DateTime.Parse(Eval("EventEndTime").ToString()).ToString("MMMM/d/yyyy hh:mm tt") %></>
                                    <td>
                                        <asp:Button ID="btn_view" runat="server" CommandArgument='<%#Eval("EventId") %>' Text="Edit" CommandName="View" />
                                        <asp:Button ID="btn_delete" runat="server" CommandArgument='<%#Eval("EventId") %>' OnClientClick="return confirm('Are you sure you want to delete this Event?')" Text="Delete" OnCommand="deleteEvent"/>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </table>
                </asp:Panel>
                <asp:Panel ID="pnlUpdate" CssClass="pnlContent" runat="server">
                    <asp:Button ID="btn_addU" runat="server" CssClass="btnCancel" Text="Add an Event" />
                    <asp:Button ID="btn_allU" runat="server" CssClass="btnCancel" Text="View All Events" />
                    <br />
                    <br />
                    <h1>Update Event</h1>
                    <asp:Label ID="lbl_msgU" runat="server" CssClass="message" />
                    <br />
                    <asp:ListView ID="lv_update" runat="server" OnItemCommand="updateEvent">
                        <ItemTemplate>
                            <asp:Label ID="lbl_messageU" runat="server" />
                            <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval("EventId") %>' />
                            <asp:Label ID="lbl_titleU" runat="server" Text="Title" CssClass="infoLabel" />
                            <asp:TextBox ID="txt_titleU" runat="server" Text='<%#Eval("EventTitle") %>' CssClass="textContact" />
                            <br />
                            <asp:Label ID="lbl_hostU" runat="server" Text="Hosted By: " CssClass="infoLabel" />
                            <asp:TextBox ID="txt_hostU" runat="server" Text='<%#Eval("EventsHeldBy") %>' />
                            <br />
                            <asp:Label ID="lbl_locU" runat="server" Text="Location: " CssClass="infoLabel" />
                            <asp:TextBox ID="txt_locU" runat="server" Text='<%#Eval("EventLocation") %>' />
                            <br />
                            <asp:Label ID="lbl_descU" runat="server" Text="Desciption" CssClass="infoLabel" />
                            <br />
                            <FTB:FreeTextBox ID="txt_descU" runat="server" Text='<%#Eval("EventDescription") %>' />
                            <br />
                            <asp:Label ID="lbl_expU" Text="Start Date :" runat="server" CssClass="infoLabel" />
                            <asp:TextBox ID="txt_dateU" runat="server" AutoPostBack="true" onkeypress="return false;" />
                            <ajax:CalendarExtender ID="cd_dateU" FirstDayOfWeek="Monday" EnableViewState="true" PopupPosition="BottomRight" Format="yyyy-MM-dd" TargetControlID="txt_dateU" PopupButtonID="imgCal" runat="server"></ajax:CalendarExtender>
                            &nbsp;<asp:ImageButton ID="imgCal" runat="server" ImageUrl="~/images/calendar_icon.png" ToolTip="Select Appointment Date" />
                            <br />
                            <br />
                            <asp:Label ID="lbl_startTimeU" Text="Start Time :" runat="server" CssClass="infoLabel" />
                            <br />
                            <MKB:TimeSelector ID="tms_startU" runat="server"></MKB:TimeSelector>
                            <br />
                            <asp:Label ID="lbl_endTimeU" Text="End Time :" runat="server" CssClass="infoLabel" />
                            <br />
                            <MKB:TimeSelector ID="tms_endU" runat="server"></MKB:TimeSelector>
                            <br />
                            <asp:Button ID="btn_updU" runat="server" CommandArgument='<%#Eval("EventId") %>' Text="Submit Update" OnClientClick="return confirm('Are you sure you want to update this Event?')" CommandName="UpdateE" />
                            <asp:Button ID="btn_delU" runat="server" CommandArgument='<%#Eval("EventId") %>' Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this Event?')"  CommandName="DeleteE" />
                            <br />
                            <br />
                        </ItemTemplate>
                    </asp:ListView>
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</asp:Content>
