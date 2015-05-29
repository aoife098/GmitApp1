using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Data;
using System.Web.Security;

public partial class PollsMore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RadioButtonList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Check if user has voted before
        SqlConnection con;
        SqlCommand cmdUserName;
        string s;
        s = WebConfigurationManager.ConnectionStrings["cnString"].ConnectionString;
        con = new SqlConnection(s);
        con.Open();
        string comd = "SELECT UserName FROM Voted WHERE PollID = 3 AND UserName ='" + Page.User.Identity.Name + "'";
        cmdUserName = new SqlCommand(comd, con);
        cmdUserName.ExecuteNonQuery();
        string votedUserName = Convert.ToString(cmdUserName.ExecuteScalar());

        if (votedUserName == string.Empty)
        {
            ButtonVote3.Enabled = true;
            con.Close();
        }
        else
        {
            LabelVoted3.Visible = true;
            LabelAnswer3.Visible = false;
            con.Close();
        }
    }

    protected void RadioButtonList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        //Check if user has voted before
        SqlConnection con;
        SqlCommand cmdUserName;
        string s;
        s = WebConfigurationManager.ConnectionStrings["cnString"].ConnectionString;
        con = new SqlConnection(s);
        con.Open();
        string comd = "SELECT UserName FROM Voted WHERE PollID = 4 AND UserName ='" + Page.User.Identity.Name + "'";
        cmdUserName = new SqlCommand(comd, con);
        cmdUserName.ExecuteNonQuery();
        string votedUserName = Convert.ToString(cmdUserName.ExecuteScalar());

        if (votedUserName == string.Empty)
        {
            ButtonVote4.Enabled = true;
            con.Close();
        }
        else
        {
            LabelVoted4.Visible = true;
            LabelAnswer4.Visible = false;
            con.Close();
        }
    }

    protected void ButtonVote3_Click(object sender, EventArgs e)
    {
        LabelAnswer3.Text = "You voted for " + RadioButtonAnswers3.SelectedItem.ToString();
        LabelAnswer3.Visible = true;

        //When a radio button is selected in the radiobuttonlist - update the counter in database
        if (RadioButtonAnswers3.SelectedIndex == 0)
        {
            incrementVotes("Votes", "3", "Good");
        }

        else if (RadioButtonAnswers3.SelectedIndex == 1)
        {
            incrementVotes("Votes", "3", "Average");
        }

        else if (RadioButtonAnswers3.SelectedIndex == 2)
        {
            incrementVotes("Votes", "3", "Poor");
        }

        ButtonVote3.Enabled = false;
    }

    protected void ButtonVote4_Click(object sender, EventArgs e)
    {
        LabelAnswer4.Text = "You voted for " + RadioButtonAnswers4.SelectedItem.ToString();
        LabelAnswer4.Visible = true;

        //When a radio button is selected in the radiobuttonlist - update the counter in database
        if (RadioButtonAnswers4.SelectedIndex == 0)
        {
            incrementVotes("Votes", "4", "Yes");
        }

        else if (RadioButtonAnswers4.SelectedIndex == 1)
        {
            incrementVotes("Votes", "4", "No");
        }

        else if (RadioButtonAnswers4.SelectedIndex == 2)
        {
            incrementVotes("Votes", "4", "Maybe");
        }

        ButtonVote4.Enabled = false;
    }

    private void incrementVotes(string numvotes, string pollnum, string answers)
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlConnection conn;

        string s;
        s = WebConfigurationManager.ConnectionStrings["cnString"].ConnectionString;
        con = new SqlConnection(s);
        con.Open();
        string comd = "UPDATE Polls SET " + numvotes + "=" + numvotes + "+ 1 WHERE pollID = " + pollnum + " AND Answers ='" + answers + "'";
        cmd = new SqlCommand(comd, con);
        cmd.ExecuteNonQuery();
        con.Close();

        //Add username to the voted table so user can only vote once on a poll  
        conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["cnString"].ConnectionString);
        cmd = new SqlCommand("INSERT INTO Voted(PollID,UserName) VALUES (@PollID,@UserName)", conn);
        cmd.CommandType = CommandType.Text;
        cmd.Parameters.AddWithValue("@PollID", pollnum);
        cmd.Parameters.AddWithValue("@UserName", Page.User.Identity.Name);
        using (conn)
        {
            //Connect to the database  
            conn.Open();
            //Execute query   
            cmd.ExecuteNonQuery();
        }
    }
}