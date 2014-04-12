<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/healthTools.master" Theme="HealthTools" CodeFile="VolApplicationAdmin.aspx.cs" Inherits="VolunteerAdmin_VolApplicationAdmin" %>

<%@ MasterType VirtualPath="~/healthTools.master" %>

<asp:Content ID="cntHead" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="cntBody" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

            <asp:Panel ID="pnlContent" CssClass="pnlContent pnlContainer" runat="server">

            <div class="msAll90">    
                <asp:Label runat="server" ID="lbl_mes" />
                <br /><br />
                <asp:Panel ID="Panel4" GroupingText="Volunteer Application - REVIEW & DELETE" runat="server">

                <asp:Repeater runat="server" ID="rpt_App" OnItemCommand="rpt_App_ItemCommand">
                    <ItemTemplate>
                            <asp:HiddenField runat="server" ID="hdf_AppId" />
                        <div class="msMargBot10 msMargTop10">
                            <asp:Label runat="server" ID="fname" Text="First Name: " CssClass="neutralLight" />
                            <asp:Label ID="lbl_fName" runat="server" text='<%#Bind("firstName") %>' />
                        <br />
                        </div>
                        <div class="msMargBot10">
                            <asp:Label runat="server" ID="lname" Text="Last Name: " CssClass="neutralLight" /> 
                            <asp:Label ID="lbl_lName" runat="server" text='<%#Bind("lastName") %>' /> 
                        <br />
                        </div>
                        <div class="msMargBot10">
                            <asp:Label runat="server" ID="phone" Text="Phone: " CssClass="neutralLight" />
                            <asp:Label ID="lbl_phone" runat="server" text='<%#Bind("phone") %>' />
                            <br />
                        </div>
                        <div class="msMargBot10">
                            <asp:Label runat="server" ID="email" Text="Email: " CssClass="neutralLight" />
                            <asp:Label ID="lbl_email" runat="server" text='<%#Bind("email") %>' />
                            <br />
                        </div>
                        <div class="msMargBot10">
                            <asp:Label runat="server" ID="address" Text="Address" CssClass="neutralLight" />
                            <asp:Label ID="lbl_address" runat="server" text='<%#Bind("address") %>' />
                        </div>
                        <div class="msMargBot10">
                            <asp:Label ID="occupation" runat="server" Text="Occupation" CssClass="neutralLight" />
                            <asp:Label ID="lbl_occupation" runat="server" text='<%#Bind("occupation") %>' />
                        </div>
                        <div class="msMargBot10">
                            <asp:Label ID="student" runat="server" Text="Student: " CssClass="neutralLight" />
                            <asp:Label ID="lbl_student" runat="server" text='<%#Bind("student") %>' /> 
                        </div>
                        <div class="msMargBot10">
                            <asp:Label ID="prevExp" runat="server" Text="Previous Experience: " CssClass="neutralLight" />
                            <asp:Label ID="lbl_prevExp" runat="server" text='<%#Bind("prevExp") %>' />
                        </div>
                        <div class="msMargBot10">
                            <asp:Label ID="whyVol" runat="server" Text="Why volunteer: " CssClass="neutralLight" />
                            <asp:Label ID="lbl_whyVol" runat="server" text='<%#Bind("whyVol") %>' />
                        </div>
                        <div class="msMargBot10">
                            <asp:Label ID="reviewed" runat="server" Text="Notes: " CssClass="neutralLight msMargR20" />
                            <asp:Textbox ID="txt_reviewed" runat="server" text='<%#Bind("reviewed") %>' />
                            <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" />
                        </div>
                        <br /><br />
                        <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Confirm Delete?');" />
                        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                        <br /><br />
                    </ItemTemplate>
                </asp:Repeater>

            </asp:Panel>
        </div>
      </asp:Panel>
</asp:Content>
