<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_UpdateUser.aspx.cs" Inherits="IMS.admin_UpdateUser" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
     <%

     String a, b, c, d, e;

     a = Request.Params["t1"];
     b = Request.Params["t2"];
     c = Request.Params["t3"];
     d = Request.Params["t4"];
     e = Request.Params["t"];//id
     

    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
     con.Open();

     SqlCommand cmd = new SqlCommand("update Users set UserType='"+c+"',FullName='"+a+"',Email='"+b+"',Password='"+d+"'where UserID='"+e+"'", con);
     cmd.ExecuteNonQuery();

                 Response.Write("<script>alert('User Update Succesfull...!'); window.location='admin_display_user.aspx';</script>");


  %>
</body>
</html>
