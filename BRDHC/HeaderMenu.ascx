<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HeaderMenu.ascx.cs" Inherits="HeaderMenu" %>

<asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" CssClass="Menu headerMenu" 
    StaticEnableDefaultPopOutImage="False" Font-Bold="True">

        <Items>
            <asp:MenuItem NavigateUrl="#" Text="About us" Value="New Item">
                <asp:MenuItem NavigateUrl="#" Text="Mission,vision and values" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="#" Text="Message from the CEO" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="#" Text="History" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="#" Text="Board Of Trustees" Value="New Item"></asp:MenuItem>
            </asp:MenuItem>

            <asp:MenuItem NavigateUrl="#" Text="Patients and services" Value="New Item">
                <asp:MenuItem NavigateUrl="#" Text="Bringings" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="#" Text="What to Expect" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="#" Text="Patients.." Value="New Item"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="#" Text="Access info" Value="New Item"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="#" Text="International/Out Province Patients" Value="New Item"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="#" Text="Spiritual and Religious care" Value="New Item"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="#" Text="Food Services" Value="New Item"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="#" Text="Gift Shop" Value="New Item"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="#" Text="Pharmacy" Value="New Item"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="#" Text="Frequently asked Questions" Value="New Item"></asp:MenuItem>
               </asp:MenuItem>

            <asp:MenuItem NavigateUrl="#" Text="Health Services" Value="New Item">
                <asp:MenuItem NavigateUrl="#" Text="Diabetes Centre" Value="New Item"></asp:MenuItem>
                <asp:MenuItem Text="Diagnostic Imaging Centre" Value="New Item"></asp:MenuItem>
                <asp:MenuItem Text="Dietitian Services" Value="New Item"></asp:MenuItem>
                <asp:MenuItem Text="EMS" Value="New Item"></asp:MenuItem>
                <asp:MenuItem Text="Laboratory" Value="New Item"></asp:MenuItem>
                <asp:MenuItem Text="Mental Health" Value="New Item"></asp:MenuItem>
                <asp:MenuItem Text="Oncology Service" Value="New Item"></asp:MenuItem>
                <asp:MenuItem Text="Out Patients" Value="New Item"></asp:MenuItem>
                <asp:MenuItem Text="Rehabilitation" Value="New Item"></asp:MenuItem>
            </asp:MenuItem>

            <asp:MenuItem NavigateUrl="#" Text="Community Resources" Value="New Item">
                <asp:MenuItem NavigateUrl="#" Text="Health Tips" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="#" Text="Adult Day Program" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="#" Text="Meals on Wheels" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="#" Text="Golden Birches" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="#" Text="Independent Living with Helpline" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="#" Text="Transportation" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="#" Text="Ontario Telemedecine Network" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="#" Text="Social Services" Value="New Item"></asp:MenuItem>
            </asp:MenuItem>

            <asp:MenuItem Text="Support us" Value="New Item">
            <asp:MenuItem NavigateUrl="#" Text="Employment" Value="New Item"></asp:MenuItem>
            <asp:MenuItem NavigateUrl="#" Text="BRDHC Foundation" Value="New Item"></asp:MenuItem>
            <asp:MenuItem NavigateUrl="#" Text="Volunteer" Value="New Item"></asp:MenuItem>
            <asp:MenuItem NavigateUrl="#" Text="BRDHC Auxiliary" Value="New Item"></asp:MenuItem>
            </asp:MenuItem>

             <asp:MenuItem NavigateUrl="#" Text="Contact us" Value="New Item">
                <asp:MenuItem NavigateUrl="#" Text="Location" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="#" Text="Visiting Hours" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="#" Text="Night Access" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="#" Text="Senior Management Team" Value="New Item"></asp:MenuItem>
            </asp:MenuItem>
           
           
        </Items>
         
</asp:Menu>

