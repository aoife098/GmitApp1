<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Chart4.aspx.cs" Inherits="PollCharts_Chart4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Chart ID="ChartPoll4" runat="server" DataSourceID="SqlDataSourceChart4" Width="350px">
        <Series>
            <asp:Series Name="Series4" XValueMember="Answers" YValueMembers="Votes" 
                ChartType="Pie" CustomProperties="PieDrawingStyle=SoftEdge" 
                Legend="LegendAnswers">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea4">
            <area3dstyle Enable3D="True" Inclination="45" Rotation="90" LightStyle="Realistic" />
            </asp:ChartArea>
        </ChartAreas>
        <Legends><asp:Legend LegendStyle="Column" Name="LegendAnswers"></asp:Legend></Legends>
        <Titles><asp:Title Font="Microsoft Sans Serif, 16pt, style=Bold" Name="Chart1Title" Text="Do you think GMIT caters for your needs?"></asp:Title></Titles>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSourceChart4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cnString %>" 
        SelectCommand="SELECT [Answers], [Votes] FROM [Polls] WHERE ([PollID] = @PollID)">
        <SelectParameters>
            <asp:Parameter DefaultValue="4" Name="PollID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSourceChart3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cnString %>" 
        SelectCommand="SELECT [Answers], [Votes] FROM [Polls] WHERE ([PollID] = @PollID)">
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="PollID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="ButtonBack" runat="server" Text="Back to Polls" PostBackUrl="~/MemberPages/Polls.aspx" />
</asp:Content>

