<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="careers.aspx.cs" Inherits="careers" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" Runat="Server">
    <script type="text/javascript">
        $(function () {
            $(".displayCareers").accordion({
                collapsible: true,
                active: false 
            });
        });


    </script>
<div id="careerWrapper">

    
    <asp:Panel ID="pnl_main" runat="server">
        <section id="cHeader">Careers</section>
        <br />
        <div class="displayCareers" style = "width:100%">
            <asp:Repeater ID="rpt_careers" runat="server" OnItemCommand="mainCommands">
                <ItemTemplate>
                    <h3><%# Eval("JobPostTitle") %></h3>
                    <div>
                        <p>
                            <%# Eval("JobPostDescription") %>
                        </p>
                        <p>
                            Contact: <%#Eval("ContactEmail") %>
                        </p>
                        <p>
                            DatePosted: <%#Eval("JobPostingDate") %>
                        </p>
                        <p>
                            Date of Expiry <%#Eval("ExpDate") %>
                        </p>
                        <asp:Button ID="btn_applyV" runat="server" Text="Apply" CommandArgument='<%#Eval("JobPostId") %>' CommandName="Apply" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </asp:Panel>
    <br />
    <br />
    <asp:Panel ID="pnl_apply" runat="server">
        <asp:Repeater ID="rpt_apply" runat="server" OnItemCommand="applyCommands">
            <ItemTemplate>
                <section id="cHeader"><%# Eval("JobPostTitle") %>: Application Form</section>
                <br />
                <asp:HiddenField ID="hdf_id" runat="server" Value='<%#Eval("JobPostId") %>' />
                <br />
                <asp:Label ID="lbl_message" runat="server"/>
                <br />
                <asp:Label ID="lbl_fname" Text="First name:" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txt_fname" runat="server" CssClass="textContact" />
                <br />
                <asp:Label ID="lbl_lname" Text="Last name:" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txt_lname" runat="server" CssClass="textContact" />
                <br />
                <asp:Label ID="lbl_cover" Text="Description:" CssClass="infoLabel" runat="server" />
                <br />
                <asp:TextBox ID="txt_cover" TextMode="multiline" Columns="50" Rows="15" runat="server" />
                <br />
                <asp:Label ID="lbl_email" Text="Email :" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txt_email" runat="server" CssClass="textContact" />
                <br />
                <asp:Label ID="lbl_phone" Text="Phone Number:" runat="server" CssClass="infoLabel" />
                <asp:TextBox ID="txt_phone" runat="server" CssClass="textContact" />
                <br />
                <asp:Label ID="lbl_res" Text="Upload Resume:" runat="server" CssClass="infoLabel" />
                <asp:FileUpload ID="fu_res" runat="server" CssClass="btnUpdate"/>
                <br />
                <br />
                <asp:Button ID="btn_sub" Text="Submit" runat="server" CommandName="Insert" />
                <asp:Button ID="btn_back" runat="server" CssClass="btnCancel" Text="Cancel" CommandName="Cancel" />
                <br />
                <br />
            </ItemTemplate>
        </asp:Repeater>
    </asp:Panel>

</div>


</asp:Content>

