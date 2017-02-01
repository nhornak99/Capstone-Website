using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class LoginForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void loginBtn_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=215-6565;Initial Catalog=SmartBusing;User ID=sa;Password=password24$");
        con.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM UserTbl WHERE UserName ='" + usernameTB.Text + "' AND password = '" + passwordTB.Text + "'", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            Response.Write("<script>alert('Welcome!)</script>");
            Response.Redirect("Default2.aspx");
            
        }
        else
        {
            Response.Write("<script>alert('Please enter valid username and password')</script>");
            usernameTB.Focus();
        }
        con.Close();
    }
}