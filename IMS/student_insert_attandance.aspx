<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_insert_attandance.aspx.cs" Inherits="IMS.student_insert_attandance" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   
 
   <%
    // Retrieve form data
    String batchID = Request.Params["t1"];
    String studentID = Request.Params["t2"];
    String attendanceDate = Request.Params["t3"];
    String status = Request.Params["t4"];

    // Check if required fields are not empty
    if (!String.IsNullOrEmpty(batchID) && !String.IsNullOrEmpty(studentID) && !String.IsNullOrEmpty(attendanceDate) && !String.IsNullOrEmpty(status))
    {
        // Establish database connection
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
        con.Open();

        // SQL command to insert attendance data
        SqlCommand cmd = new SqlCommand("INSERT INTO Attendance (BatchID, StudentID, AttendanceDate, Status) VALUES (@BatchID, @StudentID, @AttendanceDate, @Status)", con);
        cmd.Parameters.AddWithValue("@BatchID", batchID);
        cmd.Parameters.AddWithValue("@StudentID", studentID);
        cmd.Parameters.AddWithValue("@AttendanceDate", attendanceDate);
        cmd.Parameters.AddWithValue("@Status", status);

        // Execute the query
        cmd.ExecuteNonQuery();
        con.Close();

        // Redirect to avoid form resubmission issue
        Response.Write("<script>alert('Attendance Marked Successfully!'); window.location='student_index.aspx';</script>");
    }
%>





</body>
</html>
