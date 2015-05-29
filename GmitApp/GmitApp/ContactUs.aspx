<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Contact Us
    </h2>
    <p>
        If you have any problems or questions please do not hesitate to get in touch.
    </p>
    <br />
    <asp:Label ID="LabelName" runat="server" Text="Your Name:"/><br/>
    <asp:TextBox ID="TextBoxName" runat="server"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" ControlToValidate="TextBoxName" runat="server" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="LabelEmail" runat="server" Text="Email:"/><br/>
    <asp:TextBox ID="TextBoxEmail" runat="server"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" ControlToValidate="TextBoxEmail" runat="server" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="LabelSubject" runat="server" Text="Subject:"/><br/>
    <asp:TextBox ID="TextBoxSubject" runat="server"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorSubject" ControlToValidate="TextBoxSubject" runat="server" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
    <br />
    <asp:Label ID="LabelMessage" runat="server" Text="Message:"/><br/>
    <asp:TextBox ID="TextBoxMessage" runat="server" TextMode="MultiLine"/>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorMessage" ControlToValidate="TextBoxMessage" runat="server" ForeColor="Red" Text="*"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" onclick="ButtonSubmit_Click"/>
    <asp:Button ID="ButtonReset" runat="server" Text="Reset" onclick="ButtonReset_Click" />
    <br />
</asp:Content>

