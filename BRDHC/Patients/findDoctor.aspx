<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="findDoctor.aspx.cs" Inherits="Patients_find_a_doctor" %>

<%@ Register Src="~/Patients/patientLeftMenu.ascx" TagName="LeftMenu" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" runat="Server">
    
    <script type="text/javascript"> /* Make this user control */
        $(document).ready(function () {
            console.log("Script loaded");
            $('.dashboardMenuBtn').click(function (e) {
                e.preventDefault();
                $('.pnlLeftMenu').toggleClass('active');
            });
        });
    </script>
    <asp:Panel ID="pnlContainer" CssClass="pnlContainer" runat="server"> <%--REquired--%>
        <asp:Panel ID="pnlHead" runat="server"> <%--REquired--%>
            <asp:Label ID="lblDashboard" CssClass="lblDashboard" runat="server" Text="PATIENT DASHBOARD : MY PROFILE" /> <%--REquired--%>
            <asp:LinkButton ID="mnuToggle"  CssClass="dashboardMenuBtn btn" PostBackUrl="#" runat="server" Text="DASHBOARD MENU" /> <%--REquired--%>
            <%-- Problem: button goes outside container --%>
        </asp:Panel>
        <asp:Panel ID="pnlDashboard" runat="server"> <%--REquired--%>
            <asp:Panel ID="pnlLeftMenu" CssClass="pnlLeftMenu" runat="server"> <%--REquired--%>
                <uc1:LeftMenu ID="left_menu" runat="server" />
            </asp:Panel>
            <asp:Panel ID="pnlContent" CssClass="pnlContent" runat="server"> <%--REquired--%>
                <asp:Panel ID="pnlDetails" GroupingText="Find a Doctor" runat="server" CssClass="pnlLabel">
                    <asp:Image ImageUrl="~/App_Themes/Theme/images/Doctors-group.jpg" AlternateText="Please Wait" runat="server" Height="300" Width="750" /> 
                    <br /> <br />
                    <asp:DropDownList ID="ddl_name" runat="server"
                         OnSelectedIndexChanged="ddlNameIndex" AutoPostBack="true">  
                         <asp:ListItem Text="All Doctors" Value=""/>
                    </asp:DropDownList>

                    <asp:DropDownList ID="ddl_speciality" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlSpecialityIndex" >
                        <asp:ListItem Text="All Doctors" Value=" " />
                    </asp:DropDownList>
                <br />
                   <asp:Label ID="lblMsg" runat="server" />


                    <br /><br />

                     <table>
                         <tr style="background-color: #F6E3CE;">
                             <th>Name</th>
                             <th>Identification</th>
                             <th>Department</th>
                             <th>Date Of Joining</th>
                             <th>Speciality</th>
                
                                      </tr>
                          <asp:Panel ID="pnlRPT" runat="server">
                <asp:Repeater ID="rptUserDetails" runat="server" OnItemDataBound="rptUserDetails_ItemDataBound">
                    <ItemTemplate>
                       
                            <tr style="background-color: #F6E3CE;">
                                <td>
                                    <asp:Label ID="lblFullName" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                </td> 
                                <td>
                                    <asp:Label ID="lblIdentification" runat="server" Text='<%#Eval("Identification") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblDep" runat="server" Text='<%#Eval("Department") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblJoinDate" runat="server" Text='<%#Eval("JoinDate") %>'></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="lblSpec" runat="server" Text='<%#Eval("Speciality") %>'></asp:Label>
                                </td>
                            </tr>
                        
                        
                    </ItemTemplate>

                   
                </asp:Repeater>
</asp:Panel>
            </table>



            </asp:Panel>
        </asp:Panel>
    </asp:Panel>
          <br />
        </asp:Panel>
  
</asp:Content>


