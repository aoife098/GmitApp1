using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PollCharts_Chart1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Add results as a percentage to slices
        ChartPoll1.Series[0].Label = "#VALX (#PERCENT{P0})";
    }
}