using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Security;

public partial class Polls : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RadioButtonAnswers1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        //Check if user has voted before
        SqlConnection con;
        SqlCommand cmdUserName;
        string s;
        s = WebConfigurationManager.ConnectionStrings["cnString"].ConnectionString;
        con = new SqlConnection(s);
        con.Open();
        string comd = "SELECT UserName FROM Voted WHERE PollID = 1 AND UserName ='" + Page.User.Identity.Name + "'";
        cmdUserName = new SqlCommand(comd, con);
        cmdUserName.ExecuteNonQuery();
        string votedUserName = Convert.ToString(cmdUserName.ExecuteScalar());

        if (votedUserName == string.Empty)
        {
            ButtonVote1.Enabled = true;
            con.Close();
        }
        else
        {
            LabelVoted1.Visible = true;
            LabelAnswer1.Visible = false;
            con.Close();
        }
    }

    protected void RadioButtonAnswers2_SelectedIndexChanged1(object sender, EventArgs e)
    {
        //Check if user has voted before
        SqlConnection con;
        SqlCommand cmdUserName;
        string s;
        s = WebConfigurationManager.ConnectionStrings["cnString"].ConnectionString;
        con = new SqlConnection(s);
        con.Open();
        string comd = "SELECT UserName FROM Voted WHERE PollID = 2 AND UserName ='" + Page.User.Identity.Name + "'";
        cmdUserName = new SqlCommand(comd, con);
        cmdUserName.ExecuteNonQuery();
        string votedUserName = Convert.ToString(cmdUserName.ExecuteScalar());

        if (votedUserName == string.Empty)
        {
            ButtonVote2.Enabled = true;
            con.Close();
        }
        else
        {
            LabelVoted2.Visible = true;
            LabelAnswer2.Visible = false;
            con.Close();
        }
    }

    protected void ButtonVote1_Click(object sender, EventArgs e)
    {
        LabelAnswer1.Text = "You voted for " + RadioButtonAnswers1.SelectedItem.ToString();
        LabelAnswer1.Visible = true;

        //When a radio button is selected in the radiobuttonlist - update the counter in database
        if (RadioButtonAnswers1.SelectedIndex == 0)
        {
            incrementVotes("Votes", "1", "Good");
        }

        else if (RadioButtonAnswers1.SelectedIndex == 1)
        {
            incrementVotes("Votes", "1", "Average");
        }

        else if (RadioButtonAnswers1.SelectedIndex == 2)
        {
            incrementVotes("Votes", "1", "Poor");
        }

        ButtonVote1.Enabled = false;
    }

    protected void ButtonVote2_Click(object sender, EventArgs e)
    {
        LabelAnswer2.Text = "You voted for " + RadioButtonAnswers2.SelectedItem.ToString();
        LabelAnswer2.Visible = true;

        //When a radio button is selected in the radiobuttonlist - update the counter in database
        if (RadioButtonAnswers2.SelectedIndex == 0)
        {
            incrementVotes("Votes", "2", "Yes");
        }

        else if (RadioButtonAnswers2.SelectedIndex == 1)
        {
            incrementVotes("Votes", "2", "No");
        }

        else if (RadioButtonAnswers2.SelectedIndex == 2)
        {
            incrementVotes("Votes", "2", "Maybe");
        }

        ButtonVote2.Enabled = false;
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