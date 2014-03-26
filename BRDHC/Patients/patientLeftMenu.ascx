<%@ Control Language="C#" AutoEventWireup="true" CodeFile="patientLeftMenu.ascx.cs" Inherits="Patients_patientLeftMenu" %>

<asp:Menu ID="mnuLeft" runat="server" Orientation="Vertical" CssClass="Menu" StaticEnableDefaultPopOutImage="False" RenderingMode="List">
    <Items>
        <asp:MenuItem NavigateUrl="#" Text="My Profile" Value="New Item"></asp:MenuItem>
        <asp:MenuItem NavigateUrl="#" Text="Appointments" Value="New Item">
            <asp:MenuItem NavigateUrl="#" Text="Upcoming Appointments" />
            <asp:MenuItem NavigateUrl="#" Text="Request Appointments" />
            <asp:MenuItem NavigateUrl="#" Text="Request Status" />
        </asp:MenuItem>
        <asp:MenuItem NavigateUrl="#" Text="Doctor Schedule" Value="New Item"></asp:MenuItem>
        <asp:MenuItem NavigateUrl="#" Text="Prescription" Value="New Item"></asp:MenuItem>
        <asp:MenuItem NavigateUrl="#" Text="Pay Bills" Value="New Item"></asp:MenuItem>
        <asp:MenuItem NavigateUrl="findDoctor.aspx" Text="Find a Doctor" Value="New Item"></asp:MenuItem>
        <asp:MenuItem NavigateUrl="~/Patients/EmergencyWaitTime.aspx" Text="Emergency Wait Time"></asp:MenuItem>
    </Items>
</asp:Menu>
