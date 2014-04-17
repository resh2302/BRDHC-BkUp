<%@ Page Title="" ValidateRequest="false" Language="C#" MasterPageFile="~/brdhc.master" AutoEventWireup="true" CodeFile="careerAdmin.aspx.cs" Inherits="careerAdmin" %>
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

                <asp:Label ID="lblDashboard" CssClass="lblDashboard" runat="server"/>

                <asp:LinkButton ID="mnuToggle" CssClass="dashboardMenuBtn btn" PostBackUrl="#" runat="server" Text="DASHBOARD MENU" />

            </asp:Panel>
            <asp:Panel ID="pnlDashboard" runat="server">

                <asp:Panel ID="pnlLeftMenu" CssClass="pnlLeftMenu" runat="server">

                </asp:Panel>


                <asp:Panel ID="pnlAdd" CssClass="pnlContent" runat="server">
                    <div id="addCareer">
                        <asp:Button ID="btn_all" runat="server" CssClass="btnCancel" Text="View All Careers" OnCommand="viewAll" />
                        <asp:Button ID="btn_apps" runat="server" CssClass="btnCancel" Text="View Apps by Career" OnCommand="viewApps" />
                        <br />
                        <asp:Label ID="lbl_message" CssClass="message" runat="server" />
                        <br />
                        <br />
                        <h1>Add a Career</h1>
                        <asp:Label ID="lbl_pos" Text="Position:" runat="server" CssClass="infoLabel" />
                        <asp:TextBox ID="txt_pos" runat="server" CssClass="textContact" />
                        <br />
                        <asp:Label ID="lbl_des" Text="Description:" CssClass="infoLabel" runat="server" />
                        <br />
                        <FTB:FreeTextBox ID="txt_des" runat="server" />
                        <br />
                        <asp:Label ID="lbl_exp" Text="Expiry Date :" runat="server" CssClass="infoLabel" />
                        <asp:TextBox ID="txt_exp" runat="server" AutoPostBack="true" onkeypress="return false;" />
                        <ajax:CalendarExtender ID="cd_exp" FirstDayOfWeek="Monday" EnableViewState="true" PopupPosition="BottomRight" Format="yyyy-MM-dd" TargetControlID="txt_exp" PopupButtonID="imgCal" runat="server"></ajax:CalendarExtender>
                        &nbsp;<asp:ImageButton ID="imgCal" runat="server" ImageUrl="~/images/calendar_icon.png" ToolTip="Select Appointment Date" />
                        <br />
                        <asp:Label ID="lbl_email" Text="Contact Email:" runat="server" CssClass="infoLabel" />
                        <asp:TextBox ID="txt_email" runat="server" CssClass="textContact" />
                        <br />
                        <asp:Button ID="btn_msg" Text="Add" runat="server" CommandName="Insert" OnClientClick="return confirm('Are you sure you would like to add this Career?')" OnCommand="addCareer" />
                        <asp:Button ID="btn_cancel" Text="Cancel" runat="server" CommandName="Cancel" OnClientClick="return confirm('Are you sure you want to Cancel?')" OnCommand="addCareer" />
                        <br />
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnlViewAll" CssClass="pnlContent" runat="server">
                    <asp:Button ID="btn_viewC" runat="server" CssClass="btnCancel" Text="Add a Career" OnCommand="viewAddC" />
                    <asp:Button ID="btn_viewApp" runat="server" CssClass="btnCancel" Text="View Apps by Career" OnCommand="viewApps" />
                    <br />
                    <br />
                    <h1>View All Careers</h1>
                    <table class="blueTable table">
                        <thead>
                            <tr>
                                <th>Position</th>
                                <th>Date Posted</th>
                                <th>Expiration Date</th>
                                <th>Update/Delete</th>
                            </tr>
                        </thead>
                        <asp:ListView ID="lv_allJobs" runat="server" OnItemCommand="subCommandsCareers">
                            <ItemTemplate>
                                <tr>
                                    <asp:HiddenField ID="hdf_idC" runat="server" Value='<%#Eval("JobPostId") %>' />
                                    <td><%#Eval("JobPostTitle") %></td>
                                    <td><%#Eval("JobPostingDate") %></td>
                                    <td><%#Eval("ExpDate") %></td>
                                    <td>
                                        <asp:Button ID="btn_updV" runat="server" CommandArgument='<%#Eval("JobPostId") %>' CommandName="UpdateV" Text="Update" />
                                        <asp:Button ID="btn_delete" runat="server" CommandArgument='<%#Eval("JobPostId") %>' CommandName="DeleteC" Text="Delete" />
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </table>
                </asp:Panel>
                <asp:Panel ID="pnlUpdate" CssClass="pnlContent" runat="server">
                    <asp:Button ID="btn_addU" runat="server" CssClass="btnCancel" Text="Add a Career" OnCommand="viewAddC" />
                    <asp:Button ID="btn_allU" runat="server" CssClass="btnCancel" Text="View All Careers" OnCommand="viewAll" />
                    <br />
                    <br />
                    <h1>Update Career</h1>
                    <asp:Label ID="lbl_msgU" runat="server" CssClass="message" />
                    <br />
                    <asp:ListView ID="lv_update" runat="server" OnItemCommand="updateCareer">
                        <ItemTemplate>
                            <asp:HiddenField ID="hdf_idC" runat="server" Value='<%#Eval("JobPostId") %>' />
                            <asp:Label ID="lbl_posU" runat="server" Text="Position" CssClass="infoLabel" />
                            <asp:TextBox ID="txt_posU" runat="server" Text='<%#Eval("JobPostTitle") %>' CssClass="textContact" />
                            <br />
                            <asp:Label ID="lbl_descU" runat="server" Text="Desciption" CssClass="infoLabel" />
                            <br />
                            <FTB:FreeTextBox ID="txt_descU" runat="server" Text='<%#Eval("JobPostDescription") %>' />
                            <br />
                            <asp:Label ID="lbl_emailU" runat="server" Text="Email" CssClass="infoLabel" />
                            <asp:TextBox ID="txt_emailU" runat="server" Text='<%#Eval("ContactEmail") %>' />
                            <br />
                            <asp:Label ID="lbl_expU" Text="Expiry Date :" runat="server" CssClass="infoLabel" />
                            <asp:TextBox ID="txt_expU" runat="server" AutoPostBack="true" onkeypress="return false;" />
                            <ajax:CalendarExtender ID="cd_expU" FirstDayOfWeek="Monday" EnableViewState="true" PopupPosition="BottomRight" Format="yyyy-MM-dd" TargetControlID="txt_expU" PopupButtonID="imgCal" runat="server"></ajax:CalendarExtender>
                            &nbsp;<asp:ImageButton ID="imgCal" runat="server" ImageUrl="~/images/calendar_icon.png" ToolTip="Select Appointment Date" />
                            <br />
                            <asp:Button ID="btn_updU" runat="server" CommandArgument='<%#Eval("JobPostId") %>' CommandName="UpdateC" Text="Submit Update" />
                            <asp:Button ID="btn_delU" runat="server" CommandArgument='<%#Eval("JobPostId") %>' CommandName="DeleteCC" Text="Delete" />
                            <br />
                            <br />
                        </ItemTemplate>
                    </asp:ListView>
                </asp:Panel>
                <asp:Panel ID="pnlApps" runat="server">
                    <asp:Button ID="btn_addC2" runat="server" CssClass="btnCancel" Text="Add a Career" OnCommand="viewAddC" />
                    <asp:Button ID="btn_allA" runat="server" CssClass="btnCancel" Text="View All Careers" OnCommand="viewAll" />
                    <br />
                    <br />
                    <h1>View App By Career:</h1>
                    <asp:DropDownList CssClass="greenBtn" ID="ddl_job" runat="server" OnSelectedIndexChanged="ddlCareer" AutoPostBack="true">
                        <asp:ListItem Text="Careers" Value=" " />
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:ListView ID="lv_apps" runat="server" OnItemCommand="subCommandsApps">
                        <ItemTemplate>
                            <table class="blueTable table">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Resume</th>
                                        <th>View/Delete</th>
                                    </tr>
                                </thead>
                                <tr>
                                    <asp:HiddenField ID="hdf_idA" runat="server" Value='<%#Eval("ApplicationId") %>' />
                                    <td><%#Eval("FirstName") %> <%#Eval("LastName") %></td>
                                    <td><%#Eval("Email") %></td>
                                    <td><%#Eval("Phone") %></td>
                                    <td><%#Eval("ResumePath") %></td>
                                    <td>
                                        <asp:Button ID="btn_view" runat="server" CommandArgument='<%#Eval("ApplicationId") %>' CommandName="View" Text="View" />
                                        <asp:Button ID="btn_delete" runat="server" CommandArgument='<%#Eval("ApplicationId") %>' CommandName="DeleteA" Text="Delete" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:ListView>
                </asp:Panel>
                <asp:Panel ID="pnlSingleApp" runat="server">
                    <asp:Button ID="btn_allCa" runat="server" CssClass="btnCancel" Text="View Apps by Career" OnCommand="viewApps" />
                    <asp:Button ID="btn_allSa" runat="server" CssClass="btnCancel" Text="View All Careers" OnCommand="viewAll" />
                    <asp:ListView ID="lv_singleApp" runat="server" OnItemCommand="subCommandsApps">
                        <ItemTemplate>
                            <asp:HiddenField ID="hdf_idA" runat="server" Value='<%#Eval("ApplicationId") %>' />
                            <h1>Name:
                                <asp:Label ID="lbl_subV" runat="server" Text='<%#Eval("FirstName") %>' />
                                <asp:Label ID="lbl_lnameV" runat="server" Text='<%#Eval("LastName") %>' /></h1>
                            <br />
                            <asp:Label ID="lbl_cover" runat="server" Text='<%#Eval("CoverLetter") %>' />

                            <br />
                            Email:
                            <asp:Label ID="lbl_emailV" runat="server" Text='<%#Eval("Email") %>' /></p>
                        <br />
                            Phone:
                            <asp:Label ID="Label3" runat="server" Text='<%#Eval("Phone") %>' /></p>
                        <br />
                            <a id="Ares" href='../UpResume/<%#Eval("ResumePath") %>'>
                                <asp:Label ID="lbl_res" runat="server" Text='<%#Eval("ResumePath") %>' />
                            </a>
                            <article class="viewCover">
                                <asp:Label ID="lbl_msgV" runat="server" Text='' /></article>
                            <p>
                                <asp:Label ID="lbl_dateV" runat="server" Text='' /></p>
                            <br />
                            <br />
                            <input type="button" id="boxExpand" value="Reply" onclick="replyExpand()" />
                            <asp:Button ID="btn_delete" runat="server" CssClass="contactBtn" CommandArgument='<%#Eval("ApplicationId") %>' Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?')" CommandName="DeleteA" /></td>
                        <br />
                            <br />
                            <div id="replyBox" class="replyBox">
                                <asp:Label ID="Lbl_subR" Text="Subject:" runat="server" CssClass="infoLabel" />
                                <asp:TextBox ID="txt_subR" runat="server" CssClass="textContact" />
                                <br />
                                <asp:Label ID="lbl_msgR" runat="server" Text="Message" CssClass="infoLabel" />
                                <br />
                                <asp:TextBox ID="txt_msgR" TextMode="multiline" Columns="50" Rows="15" runat="server" />
                                <br />
                                <asp:Button ID="btn_reply" runat="server" CommandArgument='<%#Eval("ApplicationId") %>' OnClientClick="return confirm('Are you sure you want to reply? This will send an email to the user.')" CommandName="Reply" Text="Send" />
                                <br />
                                <br />
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</asp:Content>

