<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_updatebatch.aspx.cs" Inherits="IMS.admin_updatebatch" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
      <%

   String a, b, c, d;

   a = Request.Params["t1"];
   b = Request.Params["t2"];
   c = Request.Params["t3"];
   d = Request.Params["t"];//id
   

  SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
   con.Open();

   SqlCommand cmd = new SqlCommand("update Batches set BatchName='"+a+"',TrainerID='"+b+"',Schedule='"+c+"'where BatchID='"+d+"'", con);
   cmd.ExecuteNonQuery();

               Response.Write("<script>alert('Batch Update Succesfull...!'); window.location='admin_display_batch.aspx';</script>");


%>
</body>
</html>
