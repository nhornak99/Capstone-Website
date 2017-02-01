using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class RegisterForm : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void loginBtn_Click(object sender, EventArgs e)   // Should be register Button
    {
        if(passwordTB.Text == confPassTB.Text)
        {
            SqlConnection con = new SqlConnection(@"Data Source=215-6565;Initial Catalog=SmartBusing;User ID=sa;Password=password24$");
            con.Open();
            string query = "INSERT INTO UserTbl (FirstName, UserName, Password) VALUES ('" + nameTB.Text + "','" + usernameTB.Text + "','" + passwordTB.Text + "')";
            SqlCommand cmd = new SqlCommand(query, con);
            int OBJ = Convert.ToInt32(cmd.ExecuteNonQuery());
            if (OBJ > 0)
            {

            }
            else
            {

            }
            Response.Redirect("Default2.aspx");
            con.Close();
        }
        else
        {
            Response.Write("<script>alert('Passwords do not match!')</script>");
            passwordTB.Focus();
        }

        
    }
}