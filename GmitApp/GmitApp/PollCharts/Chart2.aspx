<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Chart2.aspx.cs" Inherits="PollCharts_Chart2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Chart ID="ChartPoll2" runat="server" DataSourceID="SqlDataSourceChart2" Width="350px">
        <Series>
            <asp:Series Name="Series2" XValueMember="Answers" YValueMembers="Votes" 
                ChartType="Pie" CustomProperties="PieDrawingStyle=SoftEdge" 
                Legend="LegendAnswers">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea2">
            <area3dstyle Enable3D="True" Inclination="45" Rotation="90" LightStyle="Realistic" />
            </asp:ChartArea>
        </ChartAreas>
        <Legends><asp:Legend LegendStyle="Column" Name="LegendAnswers"></asp:Legend></Legends>
        <Titles><asp:Title Font="Microsoft Sans Serif, 16pt, style=Bold" Name="Chart1Title" Text="Do you think GMIT should have a student bar?"></asp:Title></Titles>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSourceChart2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cnString %>" 
        SelectCommand="SELECT [Answers], [Votes] FROM [Polls] WHERE ([PollID] = @PollID)">
        <SelectParameters>
            <asp:Parameter DefaultValue="2" Name="PollID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="ButtonBack" runat="server" Text="Back to polls" PostBackUrl="~/MemberPages/Polls.aspx" />
</asp:Content>

