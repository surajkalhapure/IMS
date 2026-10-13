<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_Delete_Attandance.aspx.cs" Inherits="IMS.admin_Delete_Attandance" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%
    // Get AttendanceID from URL parameters
    string k = Request.Params["x"];
    Response.Write("Id is " + k);

    // Establish database connection
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
    con.Open();

    // Delete record from Attendance table using parameterized query
    SqlCommand cmd = new SqlCommand("DELETE FROM Attendance WHERE AttendanceID = @AttendanceID", con);
    cmd.Parameters.AddWithValue("@AttendanceID", k);
    cmd.ExecuteNonQuery();

    // Close connection
    con.Close();

    // Show success message and redirect
    Response.Write("<script>alert('Attendance Record Deleted Successfully!'); window.location='admin_display_attandance.aspx';</script>");
%>

</body>
</html>
