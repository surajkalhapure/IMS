<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="trainer_DeleteSubmittedTask.aspx.cs" Inherits="IMS.trainer_DeleteSubmittedTask" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
 
<%
    // ✅ Get the SubmissionID from the query string
    string submissionID = Request.QueryString["submissionID"];

    if (!string.IsNullOrEmpty(submissionID))
    {
        try
        {
            // ✅ Database Connection
            string connectionString = "Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // ✅ Retrieve DocumentPath (to delete the file if exists)
                string getFilePathQuery = "SELECT DocumentPath FROM TaskSubmissions WHERE SubmissionID = @SubmissionID";
                using (SqlCommand getFileCmd = new SqlCommand(getFilePathQuery, con))
                {
                    getFileCmd.Parameters.AddWithValue("@SubmissionID", submissionID);
                    object filePath = getFileCmd.ExecuteScalar();

                    // ✅ Delete the file from the server if it exists
                    if (filePath != null && !string.IsNullOrEmpty(filePath.ToString()))
                    {
                        string fullPath = Server.MapPath(filePath.ToString());
                        if (System.IO.File.Exists(fullPath))
                        {
                            System.IO.File.Delete(fullPath);
                        }
                    }
                }

                // ✅ Delete Submission Query
                string deleteQuery = "DELETE FROM TaskSubmissions WHERE SubmissionID = @SubmissionID";
                using (SqlCommand cmd = new SqlCommand(deleteQuery, con))
                {
                    cmd.Parameters.AddWithValue("@SubmissionID", submissionID);
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Submission Deleted Successfully!'); window.location='trainer_submitted task.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Error: Submission not found or could not be deleted.'); window.location='trainer_submitted_task.aspx';</script>");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Error: " + ex.Message + "'); window.location='trainer_submitted_task.aspx';</script>");
        }
    }
    else
    {
        Response.Write("<script>alert('Invalid Submission ID!'); window.location='trainer_submitted_task.aspx';</script>");
    }
%>

</body>
</html>
