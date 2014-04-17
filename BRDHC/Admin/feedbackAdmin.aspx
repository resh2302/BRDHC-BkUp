<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" Theme="Theme" AutoEventWireup="true" CodeFile="feedbackAdmin.aspx.cs" Inherits="FeedbackAdmin_feedbackAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" Runat="Server">
   
     <asp:Label ID="lbl_message" CssClass="message" runat="server"/>
   
      <%-- using the list view to get data from tables --%>
     <asp:ListView ID="dl_main" runat="server" OnItemCommand="subDel">
         <ItemTemplate>
              <table class="blueTable table">
                  <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Is Patient</th>
                            <th>Gender</th>
                            <th>Cell No</th>
                            <th>Email</th>
                            <th>Feedback</th>
                            <th>Option</th> 
                    </tr>  
                             
                    <tr>
                        <asp:HiddenField runat="server" ID="hdf_idE" Value='<%#Eval("feedbackId") %>' /> 
                       <td><%#Eval("firstName") %></td> 
                         <td><%#Eval("lastName") %></td>
                         <td><%#Eval("isPatient") %></td>
                         <td><%#Eval("gender") %></td>
                         <td><%#Eval("mobile") %></td>
                         <td><%#Eval("email") %></td>  
                         <td><%#Eval("feedback") %></td> 
                      
                  
                    <td>  
    <asp:LinkButton ID="btn_delete" runat="server" Text="Delete" CommandName="Deletea"  CommandArgument='<%#Eval("feedbackId") %>' OnClientClick="return confirm('Confirm Delete?');" /> 
    <asp:LinkButton ID="btn_cancel" runat="server" Text="Cancel" CommandName="Cancela" />
                        </td>
                    </tr>
                       </table>
                  </ItemTemplate>
            </asp:ListView>
         
</asp:Content>


