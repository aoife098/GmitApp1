<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Chart1.aspx.cs" Inherits="PollCharts_Chart1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   <asp:Chart ID="ChartPoll1" runat="server" DataSourceID="SqlDataSourceChart1" Width="350px">
        <Series>
            <asp:Series Name="Series1" XValueMember="Answers" YValueMembers="Votes" 
                ChartType="Pie" CustomProperties="PieDrawingStyle=SoftEdge" 
                Legend="LegendAnswers">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
            <area3dstyle Enable3D="True" Inclination="45" Rotation="90" LightStyle="Realistic" />
            </asp:ChartArea>
        </ChartAreas>
        <Legends><asp:Legend LegendStyle="Column" Name="LegendAnswers"></asp:Legend></Legends>
        <Titles><asp:Title Font="Microsoft Sans Serif, 16pt, style=Bold" Name="Chart1Title" Text="Rate the food in the cantene"></asp:Title></Titles>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSourceChart1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cnString %>" 
        SelectCommand="SELECT Answers, Votes FROM Polls WHERE (PollID = 1)">
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="ButtonBack" runat="server" Text="Back to polls" PostBackUrl="~/MemberPages/Polls.aspx" />
</asp:Content>

