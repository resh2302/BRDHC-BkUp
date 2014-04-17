<%@ Page Title="" Language="C#" MasterPageFile="~/brdhc.master" AutoEventWireup="true" CodeFile="ContactAdmin.aspx.cs" Inherits="ContactAdmin" %>
<%@ MasterType VirtualPath="~/brdhc.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    <link rel="stylesheet" href="App_Themes/Theme/contactUs.css" />

    <script type="text/javascript"> /* Make this user control */
        $(document).ready(function () {
            $(".replyBox").slideUp(0);
            console.log("Script loaded");
            $('.dashboardMenuBtn').click(function (e) {
                e.preventDefault();
                $('.pnlLeftMenu').toggleClass('active');
            });
        });

        function replyExpand() {
            $(".replyBox").slideDown();
        }
    </script>
    <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">
        <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">
            <asp:Panel ID="pnlHead" runat="server">
                <asp:Label ID="lblDashboard" CssClass="lblDashboard" runat="server" />
                <asp:LinkButton ID="mnuToggle" CssClass="dashboardMenuBtn btn" PostBackUrl="#" runat="server" Text="DASHBOARD MENU" />

            </asp:Panel>
            <asp:Panel ID="pnlDashboard" runat="server">

                <asp:Panel ID="pnlLeftMenu" CssClass="pnlLeftMenu" runat="server">
                </asp:Panel>

                <asp:Panel ID="pnlTable" CssClass="pnlTable table-responsive" runat="server">
                    <asp:Label ID="lbl_message" runat="server" CssClass="statusMsg" />
                    <table class="blueTable table">
                        <thead>
                            <tr>
                                <th>From</th>
                                <th>Subject</th>
                                <th>Date Sent</th>
                                <th>View/Delete</th>
                            </tr>
                        </thead>
                        <asp:ListView ID="lst_inbox" runat="server" OnItemCommand="subCommands">
                            <ItemTemplate>
                                <tr>
                                    <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("ContactMessageId") %>' />
                                    <td>
                                        <%#Eval("FirstName") %> <%#Eval("LastName") %>
                                        <br />
                                        <p style="color: black;" class="cSmall">
                                            <asp:CheckBox ID="cb_check" runat="server" Checked='<%#Eval("IsChecked") %>' Enabled="false" />Viewed?
                                        </p>
                                    </td>
                                    <td><%#Eval("Subject") %></td>
                                    <td><%#Eval("ContactDate") %></td>
                                    <td>
                                        <asp:Button ID="btn_view" runat="server" CssClass="contactBtn" CommandArgument='<%#Eval("ContactMessageId") %>' Text="View" CommandName="View Message" />
                                        <asp:Button ID="btn_delete" runat="server" CssClass="contactBtn" CommandArgument='<%#Eval("ContactMessageId") %>' OnClientClick="return confirm('Are you sure you want to delete?')" Text="Delete" CommandName="Deleted" /></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </table>
                </asp:Panel>
                <asp:Panel ID="pnl_view" runat="server">
                    <asp:ListView ID="dtl_view" runat="server" OnItemCommand="subCommands">
                        <ItemTemplate>
                            <div class="viewStyle">
                                <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("ContactMessageId") %>' />
                                <h1>Subject: "<asp:Label ID="lbl_subV" runat="server" Text='<%#Eval("Subject") %>' />"</h1>
                                <p class="viewFont">
                                    From:
                                <asp:Label ID="lbl_fnameV" runat="server" Text='<%#Eval("FirstName") %>' />
                                    <asp:Label ID="lbl_lnameV" runat="server" Text='<%#Eval("LastName") %>' />
                                    <br />
                                    Email:
                                <asp:Label ID="lbl_emailV" runat="server" Text='<%#Eval("Email") %>' />
                                </p>
                                <br />
                                <article class="viewMsg">
                                    <asp:Label ID="lbl_msgV" runat="server" Text='<%#Eval("Message") %>' />
                                </article>
                                <p>
                                    <asp:Label ID="lbl_dateV" runat="server" Text='<%#Eval("ContactDate") %>' />
                                </p>
                                <br />
                                <article class="replyMsg">
                                    <asp:Label ID="Label1" runat="server" Text='<%#"My Reply: <br /><br />" + Eval("ReplyMessage") %>' />
                                </article>
                                <p class="replyMsg">
                                    <asp:Label ID="Label2" runat="server" Text='<%#"Sent: " + Eval("ReplyDate") %>' />
                                </p>
                                <br />
                                <br />
                                <input type="button" id="boxExpand" value="Reply" onclick="replyExpand()" />
                                <asp:Button ID="btn_delete" runat="server" CssClass="contactBtn" CommandArgument='<%#Eval("ContactMessageId") %>' Text="Delete" OnClientClick="return confirm('Are you sure you want to delete?')" CommandName="Deleted" /></td>
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
                                    <asp:Button ID="btn_reply" runat="server" CommandArgument='<%#Eval("ContactMessageId") %>' OnClientClick="return confirm('Are you sure you want to reply? This will send an email to the user.')" CommandName="Reply" Text="Send" />
                                    <br />
                                    <br />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
</asp:Content>

