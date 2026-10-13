<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_register.aspx.cs" Inherits="IMS.admin_register" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%

        String a, b, c,d;

        a = Request.Params["t1"];
        b = Request.Params["t2"];
        c = Request.Params["t3"];
        d = Request.Params["t4"];

        SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
        con.Open();

        SqlCommand cmd = new SqlCommand("insert into Users (UserType, FullName, Email, Password) values('" + c + "','" + a + "','" + b + "','"+d+"')", con);
        cmd.ExecuteNonQuery();

            Response.Write("<script>alert('User Added Succesfull...!'); window.location='admin_add_user.aspx';</script>");





  %>
</body>
</html>
