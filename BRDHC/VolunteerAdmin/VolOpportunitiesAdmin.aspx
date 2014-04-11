<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/healthTools.master" Theme="HealthTools" CodeFile="VolOpportunitiesAdmin.aspx.cs" Inherits="VolunteerAdmin_VolOpportunitiesAdmin" %>

<%@ MasterType VirtualPath="~/healthTools.master" %>

<asp:Content ID="cntHead" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="cntBody" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

            <asp:Panel ID="pnlContent" CssClass="pnlContent pnlContainer" runat="server">
                <br /><br />
                <asp:Panel ID="Panel4" GroupingText="Volunteer Opportunities - INSERT, UPDATE & DELETEE" runat="server">

                <asp:Label ID="lbl_mes" runat="server" />
                <br />

                <asp:Repeater runat="server" ID="rpt_AdVol" OnItemCommand="rpt_AdVol_ItemCommand">
                    <HeaderTemplate>
                        
                    <div class="msAll90 msOH">
                        <div class="msLeft60">
                            <asp:Label ID="lbl_oppTitle" runat="server" text="Opportunity Title" CssClass="msFormLabel" />
                            <asp:Label ID="lbl_skills" runat="server" text="Skills" CssClass="msFormLabel" />
                            <asp:Label ID="lbl_benefits" runat="server" text="Benefits" CssClass="msFormLabel" />
                            <asp:Label ID="lbl_other" runat="server" text="Other Requirements" CssClass="msFormLabel" />
                            <asp:Label ID="lbl_how" runat="server" text="Time Commitment" CssClass="msFormLabel" />
                            <asp:Label ID="lbl_when" runat="server" text="Date and Time" CssClass="msFormLabel" />
                            <asp:Label ID="lbl_contact" runat="server" text="Contact Person" CssClass="msFormLabel" />
                            <asp:Label ID="lbl_department" runat="server" text="Department" CssClass="msFormLabel" />
                            <asp:Label ID="lbl_reviewed" runat="server" text="Reviewed" CssClass="msFormLabel" />
                        </div>
                        <div class="msRight40">
                            <asp:TextBox ID="txt_oppTitle" runat="server" Width="100%" /><br />
                            <asp:TextBox ID="txt_skills" runat="server" Width="100%" /><br />
                            <asp:TextBox ID="txt_benefits" runat="server" Width="100%" /><br />
                            <asp:TextBox ID="txt_other" runat="server" Width="100%" /><br />
                            <asp:TextBox ID="txt_how" runat="server" Width="100%" /><br />
                            <asp:TextBox ID="txt_when" runat="server" Width="100%" /><br />
                            <asp:TextBox ID="txt_contact" runat="server" Width="100%" /><br />
                            <asp:TextBox ID="txt_department" runat="server" Width="100%" /><br />
                            <asp:TextBox ID="txt_reviewed" runat="server" Width="100%" />
                        </div>
                    </div>

                    <br /><br />
                    <asp:Button ID="btn_insert" runat="server" Text="Insert" CommandName="Insert" CssClass="msMargTop10" />
                    <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" />  
                    <br /><br />     
                    </HeaderTemplate>
        
                    <ItemTemplate>
                        <div class="msAll90"> 
                                        <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval("OppId") %>' />
                                        <asp:TextBox ID="txt_oppTitleU" runat="server" Text='<%#Bind("OppTitle") %>' Width="100%" />
                                        <br /> 
                                        <asp:TextBox ID="txt_skillsU" runat="server" Text='<%#Bind("Skills") %>' Width="100%" /> 
                                        <br />                                             
                                        <asp:TextBox ID="txt_benefitsU" runat="server" Text='<%#Bind("Benefits") %>' Width="100%" />
                                        <br />
                                        <asp:TextBox ID="txt_otherU" runat="server" Text='<%#Bind("Other") %>' Width="100%" />
                                        <br />                                        
                                        <asp:TextBox ID="txt_howU" runat="server" Text='<%#Bind("CommitmentHow") %>' Width="100%" />
                                        <br />
                                        <asp:TextBox ID="txt_whenU" runat="server" Text='<%#Bind("CommitmentWhen") %>' Width="100%" />
                                        <br />
                                        <asp:TextBox ID="txt_contactU" runat="server" Text='<%#Bind("ContactPerson") %>' Width="100%" />
                                        <br />
                                        <asp:TextBox ID="txt_department" runat="server" Text='<%#Bind("Department") %>' Width="100%" />
                                        <br />
                                       <asp:TextBox ID="txt_reviewed" runat="server" Text='<%#Bind("Reviewed") %>' Width="100%" />
                                        <br /><br />
                                        <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" CssClass="msMargTop10" />
                                        <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" OnClientClick="return confirm('Confirm Delete?');" />
                                        <asp:Button ID="btn_cancel2" runat="server" Text="Cancel" CommandName="Cancel" />
                        </div>
                        <br />
                        <br />

                    </ItemTemplate>
                </asp:Repeater>

                </asp:Panel>

            </asp:Panel>

</asp:Content>



