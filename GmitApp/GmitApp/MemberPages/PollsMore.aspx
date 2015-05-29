<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="PollsMore.aspx.cs" Inherits="PollsMore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>
        Polls
    </h2>
    <p>
        Please vote in the following polls to help improve your college experience
    </p>
    <br />
    <asp:Label ID="LabelQuestion3" runat="server" 
        Text="Rate the quality of lecturers" Font-Bold="True"></asp:Label>
        <br />
        <asp:RadioButtonList ID="RadioButtonAnswers3" runat="server" 
        DataTextField="Answers" DataValueField="Answers" AutoPostBack="True" 
        onselectedindexchanged="RadioButtonList3_SelectedIndexChanged" 
        DataSourceID="SqlDataSourcePoll3">
    </asp:RadioButtonList>
            <asp:SqlDataSource ID="SqlDataSourcePoll3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cnString %>" 
        SelectCommand="SELECT Answers, Votes FROM Polls WHERE (PollID = 3)">
    </asp:SqlDataSource>
            <asp:Button ID="ButtonVote3" runat="server" Text="Vote" 
        onclick="ButtonVote3_Click" Enabled="False" />
    <asp:Button ID="ButtonResults3" runat="server" Text="Results" PostBackUrl="~/PollCharts/Chart3.aspx"/>
    <br />
    <asp:Label ID="LabelVoted3" runat="server" Text="You have already voted on this poll" Visible="False" ForeColor="Red"></asp:Label>
    <asp:Label ID="LabelAnswer3" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:Label ID="LabelQuestion4" runat="server" 
        Text="Do you think GMIT caters for your needs?" Font-Bold="True"></asp:Label>
    <br />
    <asp:RadioButtonList ID="RadioButtonAnswers4" runat="server"  
        DataTextField="Answers"  DataValueField="Answers" AutoPostBack="True" 
        onselectedindexchanged="RadioButtonList4_SelectedIndexChanged" 
        DataSourceID="SqlDataSourcePoll4">
    </asp:RadioButtonList>
        <asp:SqlDataSource ID="SqlDataSourcePoll4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cnString %>" 
        SelectCommand="SELECT Answers, Votes FROM Polls WHERE (PollID = 4)">
    </asp:SqlDataSource>
        <asp:Button ID="ButtonVote4" runat="server" Text="Vote" 
        onclick="ButtonVote4_Click" Enabled="False" />
    <asp:Button ID="ButtonResults2" runat="server" Text="Results" PostBackUrl="~/PollCharts/Chart4.aspx"/>
    <br />
    <asp:Label ID="LabelVoted4" runat="server" Text="You have already voted on this poll" Visible="False" ForeColor="Red"></asp:Label>
    <asp:Label ID="LabelAnswer4" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:Button ID="ButtonBack" runat="server" Text="Back" PostBackUrl="~/Polls.aspx"  />
</asp:Content>

