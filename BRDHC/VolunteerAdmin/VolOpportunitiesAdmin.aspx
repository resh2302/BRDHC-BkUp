<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/brdhc.master" Theme="HealthTools" CodeFile="VolOpportunitiesAdmin.aspx.cs" Inherits="VolunteerAdmin_VolOpportunitiesAdmin" %>

<%@ MasterType VirtualPath="~/brdhc.master" %>

<%--overriding content on the masterpage--%>
<asp:Content ID="cntBody" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">

      <%--needed to hold all content centre aligned--%>
      <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server">

            <%--container for responsiveness--%>
            <div class="bootContainer">
            
                <div class="col-xs-12">
                <asp:Label ID="lbl_mes" runat="server" CssClass="msPara attn" />
                </div>
                    
                <%--subHeader and panel--%>
                <div class="col-xs-12">
                
                <asp:Repeater runat="server" ID="rpt_AdVol" OnItemCommand="rpt_AdVol_ItemCommand">
                    <HeaderTemplate>

                        <asp:Panel ID="pnl_volOpps" GroupingText="Volunteer Opportunities - INSERT" runat="server">
                     
                        <%--Insert: Opportunity Title label and textbox--%>
                        <div class="col-xs-12"> 
                            <div class="col-xs-12 col-sm-4">  
                            <asp:Label ID="lbl_oppTitle" runat="server" text="Opportunity Title" CssClass="msFont11" />
                            </div>
                            <div class="col-xs-12 col-sm-8">
                            <asp:TextBox ID="txt_oppTitle" runat="server" Width="100%" CssClass="msFont11" />
                            <asp:RequiredFieldValidator ID="rfv_oppTitle" runat="server" Text="*Required" ControlToValidate="txt_oppTitle" ValidationGroup="insert" />
                            </div>
                        </div>

                        <%--Insert: Skills label and textbox--%>
                        <div class="col-xs-12">
                            <div class="col-xs-12 col-sm-4">
                            <asp:Label ID="lbl_skills" runat="server" text="Skills" CssClass="msFont11" />
                            </div>
                            <div class="col-xs-12 col-sm-8">
                            <asp:TextBox ID="txt_skills" runat="server" Width="100%" CssClass="msFont11" />
                            <asp:RequiredFieldValidator ID="rfv_skills" runat="server" Text="*Required" ControlToValidate="txt_skills" ValidationGroup="insert" />
                            </div>
                        </div>
                        
                        <%--Insert: Benefits label and textbox--%>
                        <div class="col-xs-12">
                            <div class="col-xs-12 col-sm-4">
                            <asp:Label ID="lbl_benefits" runat="server" text="Benefits" CssClass="msFont11" />
                            </div>
                            <div class="col-xs-12 col-sm-8">                
                            <asp:TextBox ID="txt_benefits" runat="server" width="100%" CssClass="msFont11" />
                            <asp:RequiredFieldValidator ID="rfv_benefits" runat="server" Text="*Required" ControlToValidate="txt_benefits" ValidationGroup="insert" />       
                            </div>
                        </div>

                        <%--Insert: Other label and textbox--%>
                        <div class="col-xs-12">
                            <div class="col-xs-12 col-sm-4">
                            <asp:Label ID="lbl_other" runat="server" text="Other Requirements" CssClass="msFont11" />
                            </div>
                            <div class="col-xs-12 col-sm-8">
                            <asp:TextBox ID="txt_other" runat="server" Width="100%" CssClass="msFont11" />
                            <asp:RequiredFieldValidator ID="rfv_other" runat="server" Text="*Required" ControlToValidate="txt_other" ValidationGroup="insert" />
                            </div>
                        </div>

                        <%--Insert: Time Commitment label and textbox--%>
                        <div class="col-xs-12">
                            <div class="col-xs-12 col-sm-4">
                            <asp:Label ID="lbl_how" runat="server" text="Time Commitment" CssClass="msFont11" />
                            </div>
                            <div class="col-xs-12 col-sm-8">                   
                            <asp:TextBox ID="txt_how" runat="server" Width="100%" CssClass="msFont11" />
                            <asp:RequiredFieldValidator ID="rfv_how" runat="server" Text="*Required" ControlToValidate="txt_how" ValidationGroup="insert" />
                            </div>
                        </div>
                         
                        <%--Insert: Date and Time label and textbox--%>       
                        <div class="col-xs-12">
                            <div class="col-xs-12 col-sm-4">
                            <asp:Label ID="lbl_when" runat="server" text="Date and Time" CssClass="msFont11" />
                            </div>
                            <div class="col-xs-12 col-sm-8">
                            <asp:TextBox ID="txt_when" runat="server" Width="100%" CssClass="msFont11" />
                            <asp:RequiredFieldValidator ID="rfv_when" runat="server" Text="*Required" ControlToValidate="txt_when" ValidationGroup="insert" />
                            </div>
                        </div>

                        <%--Insert: Contact person label and textbox--%>
                        <div class="col-xs-12">
                            <div class="col-xs-12 col-sm-4">
                            <asp:Label ID="lbl_contact" runat="server" text="Contact Person" CssClass="msFont11" />
                            </div>
                            <div class="col-xs-12 col-sm-8">
                            <asp:TextBox ID="txt_contact" runat="server" Width="100%" CssClass="msFont11" />
                            <asp:RequiredFieldValidator ID="rfv_contact" runat="server" Text="*Required" ControlToValidate="txt_contact" ValidationGroup="insert" />
                            </div>
                        </div>

                        <%--Insert: Department label and textbox--%>
                        <div class="col-xs-12">
                            <div class="col-xs-12 col-sm-4">
                            <asp:Label ID="lbl_department" runat="server" text="Department" CssClass="msFont11" />
                            </div>
                            <div class="col-xs-12 col-sm-8">
                            <asp:TextBox ID="txt_department" runat="server" Width="100%" CssClass="msFont11" />
                            <asp:RequiredFieldValidator ID="rfv_dept" runat="server" Text="*Required" ControlToValidate="txt_department" ValidationGroup="insert" />
                            </div>
                        </div>
                        
                        <%--Insert: Reviewed label and textbox--%>
                        <div class="col-xs-12">
                            <div class="col-xs-12 col-sm-4">
                            <asp:Label ID="lbl_reviewed" runat="server" text="Reviewed" CssClass="msFont11" />
                            </div>
                            <div class="col-xs-12 col-sm-8">
                            <asp:TextBox ID="txt_reviewed" runat="server" Width="100%" CssClass="msFont11" />
                            </div>
                        </div>

                        <div class="col-xs-12 msPadTop10">
                        <asp:Button ID="btn_insert" runat="server" Text="Insert" CommandName="Insert" CssClass="msMargTop10" ValidationGroup="insert" />
                        <asp:Button ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancel" CssClass="msMargTop10" CausesValidation="false" />  
                        </div>

                        </asp:Panel>
     
                    </HeaderTemplate>
        
                    <ItemTemplate>

                    <asp:Panel ID="pnl_volOpps" GroupingText="Volunteer Opportunities - UPDATE & DELETE" runat="server">

                        <div class="col-xs-12">
                                <asp:HiddenField ID="hdf_idE" runat="server" Value='<%#Eval("OppId") %>' />

                                 <%--Update or delete: Opporunity Tile label and textbox--%>
                                <div class="col-xs-12 msMargBot10"> 
                                    <div class="col-xs-12 col-sm-4">  
                                    <asp:Label ID="lbl_oppTitleU" runat="server" text="Opportunity Title" CssClass="msFont11" />
                                    </div>
                                    <div class="col-xs-12 col-sm-8">
                                    <asp:TextBox ID="txt_oppTitleU" runat="server" Text='<%#Bind("OppTitle") %>' Width="100%" />
                                    </div>
                                </div>
                                
                                <%--Update or delete: Skills label and textbox--%>
                                <div class="col-xs-12 msMargBot10">
                                    <div class="col-xs-12 col-sm-4">
                                    <asp:Label ID="lbl_skillsU" runat="server" text="Skills" CssClass="msFont11" />
                                    </div>
                                    <div class="col-xs-12 col-sm-8">
                                    <asp:TextBox ID="txt_skillsU" runat="server" Text='<%#Bind("Skills") %>' Width="100%" />
                                    </div>
                                </div>

                                <%--Update or delete: Benefits label and textbox--%>
                                <div class="col-xs-12 msMargBot10">
                                    <div class="col-xs-12 col-sm-4">
                                    <asp:Label ID="lbl_benefitsU" runat="server" text="Benefits" CssClass="msFont11" />
                                    </div>
                                    <div class="col-xs-12 col-sm-8">
                                    <asp:TextBox ID="txt_benefitsU" runat="server" Text='<%#Bind("Benefits") %>' Width="100%" />
                                    </div>
                                </div>

                                <%--Update or delete: Other label and textbox--%>
                                <div class="col-xs-12 msMargBot10">
                                    <div class="col-xs-12 col-sm-4">
                                    <asp:Label ID="lbl_otherU" runat="server" text="Other Requirements" CssClass="msFont11" />
                                    </div>
                                    <div class="col-xs-12 col-sm-8">
                                    <asp:TextBox ID="txt_otherU" runat="server" Text='<%#Bind("Other") %>' Width="100%" />
                                    </div>
                                </div>

                                <%--Update or delete: Time Commitment label and textbox--%>
                                <div class="col-xs-12 msMargBot10">
                                    <div class="col-xs-12 col-sm-4">
                                    <asp:Label ID="lbl_howU" runat="server" text="Time Commitment" CssClass="msFont11" />
                                    </div>
                                    <div class="col-xs-12 col-sm-8">
                                    <asp:TextBox ID="txt_howU" runat="server" Text='<%#Bind("CommitmentHow") %>' Width="100%" />
                                    </div>
                                </div>

                                <%--Update or delete: Date and Time label and textbox--%>       
                                <div class="col-xs-12 msMargBot10">
                                    <div class="col-xs-12 col-sm-4">
                                    <asp:Label ID="lbl_whenU" runat="server" text="Date and Time" CssClass="msFont11" />
                                    </div>
                                    <div class="col-xs-12 col-sm-8">
                                    <asp:TextBox ID="txt_whenU" runat="server" Text='<%#Bind("CommitmentWhen") %>' Width="100%" />
                                    </div>
                                </div>     

                                <%--Update or delete: Contact person label and textbox--%>
                                <div class="col-xs-12 msMargBot10">
                                    <div class="col-xs-12 col-sm-4">
                                    <asp:Label ID="lbl_contactU" runat="server" text="Contact Person" CssClass="msFont11" />
                                    </div>
                                    <div class="col-xs-12 col-sm-8">
                                    <asp:TextBox ID="txt_contactU" runat="server" Text='<%#Bind("ContactPerson") %>' Width="100%" />
                                    </div>
                                </div>
                                
                                <%--Update or delete: Department label and textbox--%>
                                <div class="col-xs-12 msMargBot10">
                                    <div class="col-xs-12 col-sm-4">
                                    <asp:Label ID="lbl_departmentU" runat="server" text="Department" CssClass="msFont11" />
                                    </div>
                                    <div class="col-xs-12 col-sm-8">
                                    <asp:TextBox ID="txt_department" runat="server" Text='<%#Bind("Department") %>' Width="100%" />
                                    </div>
                                </div>
                                
                                <%--Insert: Reviewed label and textbox--%>
                                <div class="col-xs-12 msMargBot10">
                                    <div class="col-xs-12 col-sm-4">
                                    <asp:Label ID="lbl_reviewedU" runat="server" text="Reviewed" CssClass="msFont11" />
                                    </div>
                                    <div class="col-xs-12 col-sm-8">
                                    <asp:TextBox ID="txt_reviewed" runat="server" Text='<%#Bind("Reviewed") %>' Width="100%" />
                                    </div>
                                </div>
                                        
                                <div class="col-xs-12 msPadTop10">
                                    <asp:Button ID="btn_update" runat="server" Text="Update" CommandName="Update" CssClass="msMargTop10" />
                                    <asp:Button ID="btn_delete" runat="server" Text="Delete" CommandName="Delete" CssClass="msMargTop10"  OnClientClick="return confirm('Confirm Delete?');" />
                                    <asp:Button ID="btn_cancel2" runat="server" Text="Cancel" CommandName="Cancel" CssClass="msMargTop10" />
                                </div>
                        </div>

                    </asp:Panel>

                    </ItemTemplate>
                </asp:Repeater>

             
                </div>
            </div>
                
      </asp:Panel>

</asp:Content>



