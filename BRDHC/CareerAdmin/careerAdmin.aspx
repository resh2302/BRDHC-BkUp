<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="careerAdmin.aspx.cs" Inherits="careerAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" Runat="Server">
      <script type="text/javascript"> /* Make this user control */
          $(document).ready(function () {
              console.log("Script loaded");
              $('.dashboardMenuBtn').click(function (e) {
                  e.preventDefault();
                  $('.pnlLeftMenu').toggleClass('active');
              });
          });
    </script>

    <asp:Panel ID="Panel1" CssClass="pnlContainer" runat="server"> <%--REquired--%>
        <asp:Panel ID="pnlHead" runat="server"> <%--REquired--%>
            <asp:Label ID="lblDashboard" CssClass="lblDashboard" runat="server" Text="Careers Admin DASHBOARD" /> <%--REquired--%>
            <asp:LinkButton ID="mnuToggle"  CssClass="dashboardMenuBtn btn" PostBackUrl="#" runat="server" Text="DASHBOARD MENU" /> <%--REquired--%>
        </asp:Panel>
        <asp:Panel ID="pnlDashboard" runat="server"> <%--REquired--%>
            <asp:Panel ID="pnlLeftMenu" CssClass="pnlLeftMenu" runat="server"> <%--REquired--%>

            </asp:Panel>
            <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server"> <%--REquired--%>
                <%-- you can replace everything under pnlContent --%>
                <asp:Panel ID="pnlAdd" CssClass="pnlContent" runat="server">
                        <div id="addCareer">
                            
                            <section id="cHeader">Add a Career</section>
                            <asp:Button ID="btn_all" runat="server" Text="View All Careers" OnCommand="viewAll" /> 
                            <asp:Label ID="lbl_message" CssClass="message" runat="server" /> 
                            <br />
                            <asp:Label ID="lbl_pos" Text="Position:" runat="server" CssClass="infoLabel" />
                            <asp:TextBox ID="txt_pos" runat="server" CssClass="textContact" />
                            <br />     
                            <asp:Label ID="lbl_des" Text="Description:" CssClass="infoLabel" runat="server"/>
                            <br />
                            <asp:TextBox ID="txt_des" TextMode="multiline" Columns="50" Rows="15" runat="server" />
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
                            <br />
                            <br />
                        </div>
                </asp:Panel>
                <asp:Panel ID="pnlViewAll" CssClass="pnlContent" runat="server">
                    <section id="Section1">View All</section>
                    <table class="blueTable table">
                        <thead>
                            <tr>
                                <th>Position</th>
                                <th>Date Posted</th>
                                <th>Expiration Date</th>
                                <th>Update/Delete</th>
                            </tr>
                        </thead>
                        <asp:Listview ID="lv_allJobs" runat="server" OnItemCommand="subCommands">
                            <ItemTemplate>
                                <tr>
                                    <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("JobPostId") %>' />
                                    <td><%#Eval("JobPostTitle") %></td>
                                    <td><%#Eval("JobPostingDate") %></td>
                                    <td><%#Eval("ExpDate") %></td>
                                    <td>
                                        <asp:Button ID="btn_updV" runat="server" CommandArgument='<%#Eval("JobPostId") %>' CommandName="Upd" Text="Update"/>
                                        <asp:Button ID="btn_delete" runat="server" CommandArgument='<%#Eval("JobPostId") %>' CommandName="Del" Text="Delete"/>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Listview>
                    </table>
                </asp:Panel>
                <asp:Panel ID="pnlUpdate" CssClass="pnlContent" runat="server">
                    <asp:ListView ID="lv_update" runat="server" OnItemCommand="updateCareer">
                        <ItemTemplate>
                                <asp:HiddenField ID="hdf_idU" runat="server" Value='<%#Eval("JobPostId") %>' />
                                <asp:Label ID="lbl_posU" runat="server" Text="Position" CssClass="infoLabel"/>
                                <asp:TextBox ID="txt_posU" runat="server" Text='<%#Eval("JobPostTitle") %>' CssClass="textContact" />
                                <br />
                                <asp:Label ID="lbl_descU" runat="server" Text="Desciption" CssClass="infoLabel"/>
                                <asp:TextBox ID="txt_descU" runat="server" TextMode="MultiLine" Columns="50" Rows="15" Text='<%#Eval("JobPostDescription") %>' />
                                <br />
                                <asp:Label ID="lbl_emailU" runat="server" Text="Email" CssClass="infoLabel"/>
                                <asp:TextBox ID="txt_emailU" runat="server" Text='<%#Eval("ContactEmail") %>' />
                                <br />
                                <asp:Label ID="lbl_expU" Text="Expiry Date :" runat="server" CssClass="infoLabel" />
                                <asp:TextBox ID="txt_expU" runat="server" AutoPostBack="true" onkeypress="return false;" />
                                <ajax:CalendarExtender ID="cd_expU" FirstDayOfWeek="Monday" EnableViewState="true" PopupPosition="BottomRight" Format="yyyy-MM-dd" TargetControlID="txt_exp" PopupButtonID="imgCal" runat="server"></ajax:CalendarExtender>
                                &nbsp;<asp:ImageButton ID="imgCal" runat="server" ImageUrl="~/images/calendar_icon.png" ToolTip="Select Appointment Date" />
                                <br />
                                <asp:Button ID="btn_updU" runat="server" CommandArgument='<%#Eval("JobPostId") %>' CommandName="Update" Text="Submit Update"/>
                                <asp:Button ID="btn_delU" runat="server" CommandArgument='<%#Eval("JobPostId") %>' CommandName="Delete" Text="Delete" />     
                        </ItemTemplate>
                    </asp:ListView>
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</asp:Content>

