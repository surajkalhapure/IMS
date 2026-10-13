<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_enroll_student.aspx.cs" Inherits="IMS.admin_enroll_student" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%
    // Retrieve values from the form/request
    String batchID = Request.Params["batchID"];
    String studentID = Request.Params["studentID"];

    if (!String.IsNullOrEmpty(batchID) && !String.IsNullOrEmpty(studentID))
    {
        // Establish SQL connection
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
        con.Open();

        // Insert data into StudentBatchMapping table using parameterized query
        SqlCommand cmd = new SqlCommand("INSERT INTO StudentBatchMapping (BatchID, StudentID) VALUES (@BatchID, @StudentID)", con);
        cmd.Parameters.AddWithValue("@BatchID", batchID);
        cmd.Parameters.AddWithValue("@StudentID", studentID);

        cmd.ExecuteNonQuery();
        con.Close();

        // Show success message and redirect
        Response.Write("<script>alert('Student Enrolled in Batch Successfully!'); window.location='admin_batchmapping.aspx';</script>");
    }
    else
    {
        Response.Write("<script>alert('Error: Please select a valid batch and student!'); window.location='admin_batchmapping.aspx';</script>");
    }
%>

</body>
</html>
