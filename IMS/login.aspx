<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="IMS.login" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%


        String email, password;

        email = Request.Params["t1"];
        password = Request.Params["t2"];

        // Database Connection
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
        con.Open();

        // Secure Query
        SqlCommand cmd = new SqlCommand("SELECT UserType FROM Users WHERE Email = @Email AND Password = @Password", con);
        cmd.Parameters.AddWithValue("@Email", email);
        cmd.Parameters.AddWithValue("@Password", password);

        SqlDataReader reader = cmd.ExecuteReader();

        if (reader.HasRows)
        {
            reader.Read();
            string userType = reader["UserType"].ToString();
            con.Close();

            // Redirect based on user type
            if (userType == "Admin")
            {
                Response.Redirect("admin_index.aspx");
            }
            else if (userType == "Trainer")
            {
                Response.Redirect("triner_index.aspx");
            }
            else if (userType == "Student")
            {
                Response.Redirect("student_index.aspx");
            }
        }
        else
        {
            con.Close();
            //Response.Write("<script>alert('Invalid email or password!');</script>");
            //Response.Redirect("home_login.aspx");
            Response.Write("<script>alert('Invalid email or password!'); window.location='home_login.aspx';</script>");

        }
            

        %>
</body>
</html>
