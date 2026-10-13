<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_DeleteBatchData.aspx.cs" Inherits="IMS.admin_DeleteBatchData" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%
     string k = Request.Params["x"];
     Response.Write("Id is " + k);

    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
     con.Open();

     SqlCommand cmd = new SqlCommand("delete from Batches where BatchID='" + k + "'", con);
     cmd.ExecuteNonQuery();

                 Response.Write("<script>alert('User Delete Succesfull...!'); window.location='admin_display_batch.aspx';</script>");


   %>
</body>
</html>
