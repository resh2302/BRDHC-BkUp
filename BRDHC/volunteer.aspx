<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/healthTools.master" CodeFile="volunteer.aspx.cs"  Theme="HealthTools" Inherits="volunteer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server">

        <asp:Label ID="lbl_vol_opp" runat="server" Text="Volunteer Opportunities"></asp:Label>
        <br />
        <br />
        <asp:Panel ID="pnlShow" runat="server">
            
            <div id="all_opps">
                <asp:Label ID="lbl_select" runat="server" Text="Select the opportunities you are interested in applying for:"></asp:Label>
                <br /><br />
                <asp:CheckBoxList  AutoPostBack="true" ID="ckl_opps" runat="server">
                    <%-- Current Opportunities are loaded into the checkbox list from the codebehind file --%>
                </asp:CheckBoxList>

                <asp:Repeater ID="rptOpps" runat="server" OnItemCommand="rptOpps_ItemCommand">
                    <HeaderTemplate>
                        <table>
                            <tr>
                                <th>Select</th>
                                <th>Name</th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td>
                                <asp:HiddenField ID="hdnOppID" runat="server" Value='<%#Eval("OppId") %>' />
                                <asp:CheckBox ID="chk" runat="server" />
                            </td>
                            <td>
                                <asp:LinkButton ID="lnk" runat="server" CommandArgument='<%#Eval("OppId") %>' CommandName="getOpps" Text='<%#Eval("OppTitle") %>'></asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        
            <div id="ind_opps">

                <asp:Label ID="lblOpp" runat="server"></asp:Label>
            
                <%--  ALL THE QUESTIONS ARE LOADED INTO LISTVIEW --%>
                <asp:ListView runat="server" ID="ltv_opps">

                    <LayoutTemplate>
                        <table cellpadding="2" runat="server" id="tblOpps">
                            <tr runat="server" id="itemPlaceholder">
                            </tr>
                        </table>
                    </LayoutTemplate>
                
                    <ItemTemplate>
                        <tr id="Tr1" runat="server">
                            <td>
                                <div>
                                    <asp:LinkButton ID="lbtnOpp" OnClientClick="return false;" runat="server" Text='<%#Eval("OppTitle") %>' ></asp:LinkButton> 
                                      <%-- CommandArgument='<%#Eval("OppTitle")%>' --%>
                                </div>
                            
                                <div>
                                    <%#Eval("Skills") %>
                                    <br />
                                    <%#Eval("Benefits") %>
                                    <br />
                                    <%#Eval("Other") %>
                                    <br />
                                    <%#Eval("CommitmentHow") %>
                                    <br />
                                    <%#Eval("CommitmentWhen") %>
                                    <br />
                                    <%#Eval("ContactPerson") %>
                                    <br />
                                    <%#Eval("Department") %>
                                </div>


                            </td>
                        </tr>
                    </ItemTemplate>

                </asp:ListView>
            </div>

        </asp:Panel>

    </asp:Panel>

</asp:Content>