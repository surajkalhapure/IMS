<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="trainer_add_task_process.aspx.cs" Inherits="IMS.trainer_add_task_process" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.IO" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    



<%
    // ✅ Retrieve form data
    string batchID = Request.Params["batchID"];
    string taskTitle = Request.Params["taskTitle"];
    string taskDescription = Request.Params["taskDescription"];
    string dueDate = Request.Params["dueDate"];
    string documentPath = "";

    // ✅ Database Connection String
    string connectionString = "Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true";

    try
    {
        // ✅ Ensure BatchID, TaskTitle, and TaskDescription are not null
        if (string.IsNullOrEmpty(batchID) || string.IsNullOrEmpty(taskTitle) || string.IsNullOrEmpty(taskDescription))
        {
            Response.Write("<script>alert('All fields are required!'); window.history.back();</script>");
            return;
        }

        // ✅ Handle File Upload (if exists)
        if (Request.Files["taskFile"] != null && Request.Files["taskFile"].ContentLength > 0)
        {
            HttpPostedFile file = Request.Files["taskFile"];
            string fileExtension = Path.GetExtension(file.FileName).ToLower();

            // ✅ Validate File Type and Size (Max 2MB, Only PDF)
            if (fileExtension == ".pdf" && file.ContentLength <= 2097152)
            {
                string uploadFolder = Server.MapPath("~/TaskFiles/");
                if (!Directory.Exists(uploadFolder))
                {
                    Directory.CreateDirectory(uploadFolder);
                }

                string fileName = "Task_" + DateTime.Now.Ticks + fileExtension;
                documentPath = "/TaskFiles/" + fileName; // Relative Path for DB
                file.SaveAs(Path.Combine(uploadFolder, fileName)); // Save file
            }
            else
            {
                Response.Write("<script>alert('Invalid File! Only PDFs under 2MB allowed.'); window.history.back();</script>");
                return;
            }
        }

        // ✅ Insert Data into Database
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();
            string query = "INSERT INTO Tasks (BatchID, Title, Description, DueDate, DocumentPath) VALUES (@BatchID, @Title, @Description, @DueDate, @DocumentPath)";
            
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@BatchID", batchID);
                cmd.Parameters.AddWithValue("@Title", taskTitle);
                cmd.Parameters.AddWithValue("@Description", taskDescription);
                cmd.Parameters.AddWithValue("@DueDate", string.IsNullOrEmpty(dueDate) ? DBNull.Value : (object)Convert.ToDateTime(dueDate));
                cmd.Parameters.AddWithValue("@DocumentPath", string.IsNullOrEmpty(documentPath) ? DBNull.Value : (object)documentPath);

                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    Response.Write("<script>alert('Task Added Successfully!'); window.location='trainer_task_list.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('Error: Task was not added. Please try again.'); window.history.back();</script>");
                }
            }
        }
    }
    catch (Exception ex)
    {
        Response.Write("<script>alert(\"Error: " + ex.Message.Replace("\"", "\\\"") + "\"); window.history.back();</script>");
    }
%>


</body>
</html>
