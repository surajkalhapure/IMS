<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="trainer_DeleteTask.aspx.cs" Inherits="IMS.trainer_DeleteTask" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

<%
    // ✅ Get the TaskID from the query string
    string taskID = Request.QueryString["taskID"];

    if (!string.IsNullOrEmpty(taskID))
    {
        try
        {
            // ✅ Database Connection
            string connectionString = "Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true";
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // ✅ Retrieve DocumentPath (to delete the file if exists)
                string getFilePathQuery = "SELECT DocumentPath FROM Tasks WHERE TaskID = @TaskID";
                using (SqlCommand getFileCmd = new SqlCommand(getFilePathQuery, con))
                {
                    getFileCmd.Parameters.AddWithValue("@TaskID", taskID);
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

                // ✅ Delete Task Query
                string deleteQuery = "DELETE FROM Tasks WHERE TaskID = @TaskID";
                using (SqlCommand cmd = new SqlCommand(deleteQuery, con))
                {
                    cmd.Parameters.AddWithValue("@TaskID", taskID);
                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        Response.Write("<script>alert('Task Deleted Successfully!'); window.location='trainer_task_list.aspx';</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Error: Task not found or could not be deleted.'); window.location='admin_display_tasks.aspx';</script>");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Error: " + ex.Message + "'); window.location='admin_display_tasks.aspx';</script>");
        }
    }
    else
    {
        Response.Write("<script>alert('Invalid Task ID!'); window.location='admin_display_tasks.aspx';</script>");
    }
%>

</body>
</html>
