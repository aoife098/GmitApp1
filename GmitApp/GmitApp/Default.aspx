<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="GmitApp._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:ImageButton ID="ButtonEmail" runat="server"  
        PostBackUrl="https://webmail.gmit.ie/gw/webacc" ImageUrl="~/Images/Home/Email.jpg" CssClass="imageButton" Height="255" Width="255" />
    <asp:ImageButton ID="ButtonLearnOnline" runat="server"
        PostBackUrl="https://learnonline.gmit.ie/login/index.php" ImageUrl="~/Images/Home/LearnOnline.jpg" CssClass="imageButton" Height="255" Width="255"/>
    <asp:ImageButton ID="ButtonOneDrive" runat="server" 
        PostBackUrl="https://login.live.com/login.srf"
        ImageUrl="~/Images/Home/OneDrive.png" CssClass="imageButton" Height="255" Width="255" />
    <asp:ImageButton ID="ButtonLibrary" runat="server"
        PostBackUrl="http://library.gmit.ie/" ImageUrl="~/Images/Home/Library.jpg" CssClass="imageButton" Height="255" Width="255" />
    <asp:ImageButton ID="ButtonDirectory" runat="server" 
        PostBackUrl="http://www.gmit.ie/staff-az" ImageUrl="~/Images/Home/Directory.jpg" CssClass="imageButton" Height="255" Width="255" />
    <asp:ImageButton ID="ButtonPolls" runat="server" ImageUrl="~/Images/Home/Polls.jpg" CssClass="imageButton" Height="255" Width="255" PostBackUrl="~/MemberPages/Polls.aspx" />
    <asp:ImageButton ID="ButtonMap" runat="server" ImageUrl="~/Images/Home/GoogleMap.jpg" CssClass="imageButton" Height="255" Width="255" PostBackUrl="~/MemberPages/GoogleMap.aspx"  />
    <asp:ImageButton ID="ButtonContactUs" runat="server" 
        PostBackUrl="~/ContactUs.aspx" ImageUrl="~/Images/Home/ContactUs.jpg" CssClass="imageButton" Height="255" Width="255"/>
</asp:Content>
