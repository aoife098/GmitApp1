<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Polls.aspx.cs" Inherits="Polls" %>

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
        <asp:Label ID="LabelQuestion1" runat="server" 
        Text="Rate the food in the canteen" Font-Bold="True"></asp:Label>
        <asp:RadioButtonList ID="RadioButtonAnswers1" runat="server"  
        DataTextField="Answers" DataValueField="Answers" AutoPostBack="True" 
        onselectedindexchanged="RadioButtonAnswers1_SelectedIndexChanged1" 
        DataSourceID="SqlDataSourcePoll1">
    </asp:RadioButtonList>
    <asp:SqlDataSource ID="SqlDataSourcePoll1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cnString %>" 
        SelectCommand="SELECT Answers FROM Polls WHERE (PollID = 1)">
    </asp:SqlDataSource>
    <asp:Button ID="ButtonVote1" runat="server" Text="Vote" 
        onclick="ButtonVote1_Click" Enabled="False" />
    <asp:Button ID="ButtonResults1" runat="server" Text="Results" PostBackUrl="~/PollCharts/Chart1.aspx"/>
    <br />
    <asp:Label ID="LabelVoted1" runat="server" Text="You have already voted on this poll" Visible="False" ForeColor="Red"></asp:Label>
    <asp:Label ID="LabelAnswer1" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:Label ID="LabelQuestion2" runat="server" 
        Text="Do you think GMIT should have a student bar?" Font-Bold="True"></asp:Label>
    <br />
    <asp:RadioButtonList ID="RadioButtonAnswers2" runat="server" 
        DataTextField="Answers" DataValueField="Answers" AutoPostBack="True" 
        onselectedindexchanged="RadioButtonAnswers2_SelectedIndexChanged1" 
        DataSourceID="SqlDataSourcePoll2">
    </asp:RadioButtonList>
    <asp:SqlDataSource ID="SqlDataSourcePoll2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cnString %>" 
        SelectCommand="SELECT Answers FROM Polls WHERE (PollID = 2)">
    </asp:SqlDataSource>
    <asp:Button ID="ButtonVote2" runat="server" Text="Vote" 
        onclick="ButtonVote2_Click" Enabled="False" />
    <asp:Button ID="ButtonResults2" runat="server" Text="Results" PostBackUrl="~/PollCharts/Chart2.aspx"/>
    <br />
    <asp:Label ID="LabelVoted2" runat="server" Text="You have already voted on this poll" Visible="False" ForeColor="Red"></asp:Label>
    <asp:Label ID="LabelAnswer2" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    <br />
    <asp:Button ID="ButtonMorePolls" runat="server" 
        Text="Click for more polls" PostBackUrl="~/MemberPages/PollsMore.aspx" />
</asp:Content>

