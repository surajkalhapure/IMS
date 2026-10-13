<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_DeleteBatchMapping.aspx.cs" Inherits="IMS.admin_DeleteBatchMapping" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%
    // Get MappingID from URL parameters
    string k = Request.Params["x"];
    Response.Write("Id is " + k);

    // Establish database connection
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
    con.Open();

    // Delete record from StudentBatchMapping table using parameterized query
    SqlCommand cmd = new SqlCommand("DELETE FROM StudentBatchMapping WHERE MappingID = @MappingID", con);
    cmd.Parameters.AddWithValue("@MappingID", k);
    cmd.ExecuteNonQuery();

    // Close connection
    con.Close();

    // Show success message and redirect
    Response.Write("<script>alert('Enrollment Record Deleted Successfully!'); window.location='admin_display_batchMapping.aspx';</script>");
%>

</body>
</html>
