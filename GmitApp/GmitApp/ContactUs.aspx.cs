using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        //Send feedback administrator email
        MailMessage feedBack = new MailMessage();
        feedBack.To.Add("gmitapp@gmail.com");
        feedBack.From = new MailAddress(TextBoxEmail.Text);
        feedBack.Subject = TextBoxSubject.Text;
        feedBack.Body = "User Name: " + TextBoxName.Text + "<br /><br />User Email: " + TextBoxEmail.Text + "<br /><br />Message: " + TextBoxMessage.Text;
        feedBack.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.EnableSsl = true;
        smtp.Credentials = new System.Net.NetworkCredential("gmitapp@gmail.com", "gmitapp2015");
        smtp.Send(feedBack);

        //Clear form data
        TextBoxEmail.Text = string.Empty;
        TextBoxMessage.Text = string.Empty;
        TextBoxName.Text = string.Empty;
        TextBoxSubject.Text = string.Empty;

        //Send user to thank you page
        Response.Redirect("ContactUsResponder.aspx");
    }

    protected void ButtonReset_Click(object sender, EventArgs e)
    {
        //Clear form data
        TextBoxEmail.Text = string.Empty;
        TextBoxMessage.Text = string.Empty;
        TextBoxName.Text = string.Empty;
        TextBoxSubject.Text = string.Empty;

        //Disable validation
        RequiredFieldValidatorEmail.Enabled = false;
        RequiredFieldValidatorMessage.Enabled = false;
        RequiredFieldValidatorName.Enabled = false;
        RequiredFieldValidatorSubject.Enabled = false;
    }
}