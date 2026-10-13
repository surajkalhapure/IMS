<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_UpdateBatchMappingProcess.aspx.cs" Inherits="IMS.admin_UpdateBatchMappingProcess" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <%@ Import Namespace="System.Data.SqlClient" %>
<%

    // Get form values from Request parameters
    string mappingID = Request.Params["t"];
    string studentID = Request.Params["t1"];
    string batchID = Request.Params["t2"];
    string enrollmentDate = Request.Params["t3"];

    // Validate input
    if (string.IsNullOrWhiteSpace(mappingID) || 
        string.IsNullOrWhiteSpace(studentID) || 
        string.IsNullOrWhiteSpace(batchID) || 
        string.IsNullOrWhiteSpace(enrollmentDate))
    {
        Response.Write("<script>alert('Error: All fields are required!'); window.history.back();</script>");
        return;
    }

    // Database connection
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");

    try 
    {
        con.Open();

        // SQL Update Query
        string updateQuery = "UPDATE StudentBatchMapping SET StudentID=@StudentID, BatchID=@BatchID, EnrollmentDate=@EnrollmentDate WHERE MappingID=@MappingID";
        SqlCommand cmd = new SqlCommand(updateQuery, con);

        // Add parameters to avoid SQL injection
        cmd.Parameters.AddWithValue("@StudentID", studentID);
        cmd.Parameters.AddWithValue("@BatchID", batchID);
        cmd.Parameters.AddWithValue("@EnrollmentDate", enrollmentDate);
        cmd.Parameters.AddWithValue("@MappingID", mappingID);

        int rowsAffected = cmd.ExecuteNonQuery();

        if (rowsAffected > 0)
        {
            Response.Write("<script>alert('Batch Mapping Updated Successfully!'); window.location='admin_display_batchMapping.aspx';</script>");
        }
        else
        {
            Response.Write("<script>alert('Error: No record found for the given Mapping ID.'); window.history.back();</script>");
        }
    } 
    catch (Exception ex) 
    {
        Response.Write("<script>alert('Database Error: " + ex.Message.Replace("'", "\\'") + "'); window.history.back();</script>");
    } 
    finally 
    {
        con.Close();
    }

%>

</body>
</html>
