using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class RegisterForm : System.Web.UI.Page
{
    private SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["Mycon"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
            FillDropDown();
    }

    protected void loginBtn_Click(object sender, EventArgs e)   // Should be register Button
    {

        int district = 0;
        if (districtList.Text == "Medina")
            district = 1;
        else if (districtList.Text == "Brunswick")
            district = 3;
        else if (districtList.Text == "Highland")
            district = 4;

        if (passwordTB.Text == confPassTB.Text)
        {
            
            con.Open();
            string query = "INSERT INTO UserTbl (FirstName, UserName, Password, District_ID) VALUES ('" + nameTB.Text + "','" + usernameTB.Text + "','" + passwordTB.Text + "','" + district + "')";
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

    private void FillDropDown()
    {
        string selectCMD = "SELECT District_Name FROM DistrictTbl";
        using (con)
        {
            using (SqlCommand cmd = new SqlCommand(selectCMD))
            {
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                con.Open();
                districtList.DataSource = cmd.ExecuteReader();
                districtList.DataTextField = "District_Name";
                //districtList.DataValueField = "District_ID";
                districtList.DataBind();
                con.Close();
            }
        }
        districtList.Items.Insert(0, new ListItem("--Select District--", "0"));
    }

}