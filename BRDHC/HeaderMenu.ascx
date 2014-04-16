<%@ Control Language="C#" AutoEventWireup="true" CodeFile="HeaderMenu.ascx.cs" Inherits="HeaderMenu" %>

<div class="menuWrapper">

<asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" CssClass="Menu headerMenu" 
    StaticEnableDefaultPopOutImage="False" Font-Bold="True">

        <Items>
            <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="About us" Value="New Item">
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Mission,Vision and Values" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Message from the CEO" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="History" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Board Of Trustees" Value="New Item"></asp:MenuItem>
            </asp:MenuItem>

            <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Patients & Visitors" Value="New Item">
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="What to Bring" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="What to Expect" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Patient's Privacy, Rights & Responsiblities" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Access to Information & Records" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Television & Telephone" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="International & Out of Province Patients" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Spiritual and Religious Care" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Food Services" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/giftShopWelcome.aspx" Text="Gift Shop" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Pharmacy" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="FAQs" Value="New Item"></asp:MenuItem>
            </asp:MenuItem>

            <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Health Services (A-Z)" Value="New Item">
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Diabetes Centre" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Diagnostic Imaging Services" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Dietitian Services" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="EMS" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Laboratory" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Mental Health" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Oncology Service" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Out Patients (All clinics)" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Rehabilitation" Value="New Item"></asp:MenuItem>
            </asp:MenuItem>

            <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Community Resources" Value="New Item">
                <asp:MenuItem NavigateUrl="~/healthToolsQuiz.aspx" Text="Health Tools" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Programs" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Meals on Wheels" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Housing" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Transportation" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Ontario Telemedecine Network" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Social Services" Value="New Item"></asp:MenuItem>
            </asp:MenuItem>

            <asp:MenuItem Text="Support us" Value="New Item">
            <asp:MenuItem NavigateUrl="~/careers.aspx" Text="Employment" Value="New Item"></asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Donations & Foundation" Value="New Item"></asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/volunteer.aspx" Text="Volunteer" Value="New Item"></asp:MenuItem>
            <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="BRDHC Auxiliary" Value="New Item"></asp:MenuItem>
            </asp:MenuItem>

             <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Contact us" Value="New Item">
                <asp:MenuItem NavigateUrl="~/contactUs.aspx" Text="Location" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Visiting Hours" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Night Access" Value="New Item"></asp:MenuItem>
                <asp:MenuItem NavigateUrl="~/Default2.aspx" Text="Senior Management Team" Value="New Item"></asp:MenuItem>
                 <asp:MenuItem NavigateUrl="~/Feedback/feedback.aspx" Text="Feedback Survey" Value="New Item"></asp:MenuItem>
            </asp:MenuItem>           
           
        </Items>
         
</asp:Menu>

</div>

