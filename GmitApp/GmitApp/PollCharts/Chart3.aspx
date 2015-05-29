<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Chart3.aspx.cs" Inherits="PollCharts_Chart3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Chart ID="ChartPoll3" runat="server" DataSourceID="SqlDataSourceChart3" Width="350px">
        <Series>
            <asp:Series Name="Series3" XValueMember="Answers" YValueMembers="Votes" 
                ChartType="Pie" CustomProperties="PieDrawingStyle=SoftEdge" 
                Legend="LegendAnswers">
            </asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea3">
            <area3dstyle Enable3D="True" Inclination="45" Rotation="90" LightStyle="Realistic" />
            </asp:ChartArea>
        </ChartAreas>
        <Legends><asp:Legend LegendStyle="Column" Name="LegendAnswers"></asp:Legend></Legends>
        <Titles><asp:Title Font="Microsoft Sans Serif, 16pt, style=Bold" Name="Chart1Title" Text="Rate the quality of lecturers"></asp:Title></Titles>
    </asp:Chart>
    <asp:SqlDataSource ID="SqlDataSourceChart3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:cnString %>" 
        SelectCommand="SELECT [Answers], [Votes] FROM [Polls] WHERE ([PollID] = @PollID)">
        <SelectParameters>
            <asp:Parameter DefaultValue="3" Name="PollID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:Button ID="ButtonBack" runat="server" Text="Back to polls" PostBackUrl="~/MemberPages/Polls.aspx" />
</asp:Content>

