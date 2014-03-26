<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="careers.aspx.cs" Inherits="careers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphSiteMasterBody" Runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#cHeader").css({ height: '400px' });
            $(".displayCareers").accordion({ header: " div > h3" });
            $(".accordion").accordion();
        });

    </script>
<div id="careerWrapper">


    <section id="cHeader">Careers</section>
        <div class="accordian displayCareers" style = "width:600px">
            <asp:Repeater ID="rpt_careers" runat="server">
                <ItemTemplate>
                    <h3><%# Eval("JobPostTitle") %></h3>
                    <div>
                        <p>
                            <%# Eval("JobPostDescription") %>
                        </p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
</div>
        <div class="accordion" id="section1">Heading<span></span></div>
    <div class="container">
        <div class="content">
            <div>Sample Content</div>
            <p>Content here....</p>
        </div>
    </div>
    <div class="accordion" id="section2">Heading<span></span></div>
    <div class="container">
        <div class="content">
            <div>Sample Content</div>
            <p>Content here....</p>
        </div>
    </div>
    <div class="accordion" id="section3">Heading<span></span></div>
    <div class="container">
        <div class="content">
            <div>Sample Content</div>
            <p>Content here....</p>
        </div>
    </div>


</asp:Content>

