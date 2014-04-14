<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/brdhc.master" Theme="HealthTools" CodeFile="VolApplicationAdmin.aspx.cs" Inherits="VolunteerAdmin_VolApplicationAdmin" %>

<%@ MasterType VirtualPath="~/brdhc.master" %>

<%--overriding content on the masterpage--%>
<asp:Content ID="cntBody" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

       <%--needed to hold all content centre aligned--%>
       <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">

            <%--container for responsiveness--%>
            <div class="bootContainer">
                    
                <div class="col-xs-12">
                <asp:Label runat="server" ID="lbl_mes" />
                </div>

             <%--subHeader and panel--%>
            <div class="col-xs-12">
            <asp:Panel ID="pnl_volpp" GroupingText="Volunteer Application - REVIEW & DELETE" runat="server">
                <asp:Repeater runat="server" ID="rpt_App" OnItemCommand="rpt_App_ItemCommand">
                    <ItemTemplate>
                            <asp:HiddenField runat="server" ID="hdf_AppId" Value='<%#Eval("AppId") %>' />
                        <%--Display: First name labels--%>
                        <div class="col-xs-12 msMargBot10">
                            <asp:Label runat="server" ID="fname" Text="First Name: " CssClass="neutralLight msFont11" />
                            <asp:Label ID="lbl_fName" runat="server" text='<%#Bind("firstName") %>' CssClass="msFont11" />
                        </div>

                        <%--Display: Last name labels--%>
                        <div class="col-xs-12 msMargBot10">
                            <asp:Label runat="server" ID="lname" Text="Last Name: " CssClass="neutralLight msFont11" /> 
                            <asp:Label ID="lbl_lName" runat="server" text='<%#Bind("lastName") %>' CssClass="msFont11" /> 
                        </div>

                        <%--Display: Phone labels--%>
                        <div class="col-xs-12 msMargBot10">
                            <asp:Label runat="server" ID="phone" Text="Phone: " CssClass="neutralLight msFont11" />
                            <asp:Label ID="lbl_phone" runat="server" text='<%#Bind("phone") %>' CssClass="msFont11" />
                        </div>

                        <%--Display: Email labels--%>
                        <div class="col-xs-12 msMargBot10">
                            <asp:Label runat="server" ID="email" Text="Email: " CssClass="neutralLight msFont11" />
                            <asp:Label ID="lbl_email" runat="server" text='<%#Bind("email") %>' CssClass="msFont11" />
                            <br />
                        </div>

                        <%--Display: Address labels--%>
                        <div class="col-xs-12 msMargBot10">
                            <asp:Label runat="server" ID="address" Text="Address: " CssClass="neutralLight msFont11" />
                            <asp:Label ID="lbl_address" runat="server" text='<%#Bind("address") %>' CssClass="msFont11" />
                        </div>

                        <%--Display: Occupation label and textbox--%>
                        <div class="col-xs-12 msMargBot10">
                            <asp:Label ID="occupation" runat="server" Text="Occupation: " CssClass="neutralLight msFont11" />
                            <asp:Label ID="lbl_occupation" runat="server" text='<%#Bind("occupation") %>' CssClass="msFont11" />
                        </div>

                        <%--Display: Student labels--%>
                        <div class="col-xs-12 msMargBot10">
                            <asp:Label ID="student" runat="server" Text="Student: " CssClass="neutralLight msFont11" />
                            <asp:Label ID="lbl_student" runat="server" text='<%#Bind("student") %>' CssClass="msFont11" /> 
                        </div>

                        <%--Display: Previous experience labels--%>
                        <div class="col-xs-12 msMargBot10">
                            <asp:Label ID="prevExp" runat="server" Text="Previous Experience: " CssClass="neutralLight msFont11" />
                            <asp:Label ID="lbl_prevExp" runat="server" text='<%#Bind("prevExp") %>' CssClass="msFont11" />
                        </div>

                        <%--Display: Why volunteer labels--%>
                        <div class="col-xs-12 msMargBot10">
                            <asp:Label ID="whyVol" runat="server" Text="Why volunteer: " CssClass="neutralLight msFont11" />
                            <asp:Label ID="lbl_whyVol" runat="server" text='<%#Bind("whyVol") %>' CssClass="msFont11" />
                        </div>

                        <%--Update: Notes label and textbox--%>
                        <div class="col-xs-12 msMargBot10">
                            <div class="col-xs-12 col-sm-2">
                            <asp:Label ID="reviewed" runat="server" Text="Notes: " CssClass="neutralLight msFont11" />
                            </div>
                            <div class="col-xs-12 col-sm-8">
                            <asp:Textbox ID="txt_reviewed" runat="server" text='<%#Bind("reviewed") %>' Width="100%" />
                            </div>
                            <div class="col-xs-12 col-sm-2">
                            <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" />
                            </div>
                        </div>

                        <%--Delete and cancel buttons--%>
                        <div class="col-xs-12 msMargBot10 msPadTop20">
                        <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Confirm Delete?');" />
                        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" />
                        </div>

                    </ItemTemplate>
                </asp:Repeater>

            </asp:Panel>
            </div>
            </div>
      </asp:Panel>
</asp:Content>
