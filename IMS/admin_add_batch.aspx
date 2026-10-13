<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_add_batch.aspx.cs" Inherits="IMS.admin_add_batch" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%
    String batchName = Request.Params["batchName"];
    String trainerID = Request.Params["trainerID"];
    String schedule = Request.Params["schedule"];

    if (!String.IsNullOrEmpty(batchName) && !String.IsNullOrEmpty(trainerID))
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
        con.Open();

        SqlCommand cmd = new SqlCommand("INSERT INTO Batches (BatchName, TrainerID, Schedule) VALUES (@BatchName, @TrainerID, @Schedule)", con);
        cmd.Parameters.AddWithValue("@BatchName", batchName);
        cmd.Parameters.AddWithValue("@TrainerID", trainerID);
        cmd.Parameters.AddWithValue("@Schedule", schedule);

        cmd.ExecuteNonQuery();
        con.Close();

        Response.Write("<script>alert('Batch Added Successfully!'); window.location='admin_addbranch.aspx';</script>");
    }
%>

</body>
</html>
