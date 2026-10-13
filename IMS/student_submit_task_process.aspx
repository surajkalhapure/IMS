<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="student_submit_task_process.aspx.cs" Inherits="IMS.student_submit_task_process" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.IO" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Submit Task</title>
</head>
<body>

<%
    // ✅ Retrieve form data
    string taskID = Request.Params["taskID"];
    string studentID = Request.Params["studentID"];
    string submissionDate = Request.Params["submissionDate"];
    string grade = Request.Params["grade"];
    string feedback = Request.Params["feedback"];
    string documentPath = "";

    // ✅ Database Connection String
    string connectionString = "Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true";

    try
    {
        // ✅ Ensure required fields are not empty
        if (string.IsNullOrEmpty(taskID) || string.IsNullOrEmpty(studentID) || string.IsNullOrEmpty(submissionDate))
        {
            Response.Write("<script>alert('All required fields must be filled!'); window.history.back();</script>");
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
                string uploadFolder = Server.MapPath("~/TaskSubmissions/");
                if (!Directory.Exists(uploadFolder))
                {
                    Directory.CreateDirectory(uploadFolder);
                }

                string fileName = "Submission_" + DateTime.Now.Ticks + fileExtension;
                documentPath = "/TaskSubmissions/" + fileName; // Relative Path for DB
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
            string query = "INSERT INTO TaskSubmissions (TaskID, StudentID, SubmissionDate, Grade, Feedback, DocumentPath) VALUES (@TaskID, @StudentID, @SubmissionDate, @Grade, @Feedback, @DocumentPath)";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@TaskID", taskID);
                cmd.Parameters.AddWithValue("@StudentID", studentID);
                cmd.Parameters.AddWithValue("@SubmissionDate", Convert.ToDateTime(submissionDate));
                cmd.Parameters.AddWithValue("@Grade", string.IsNullOrEmpty(grade) ? DBNull.Value : (object)grade);
                cmd.Parameters.AddWithValue("@Feedback", string.IsNullOrEmpty(feedback) ? DBNull.Value : (object)feedback);
                cmd.Parameters.AddWithValue("@DocumentPath", string.IsNullOrEmpty(documentPath) ? DBNull.Value : (object)documentPath);

                int rowsAffected = cmd.ExecuteNonQuery();

                if (rowsAffected > 0)
                {
                    Response.Write("<script>alert('Task Submitted Successfully!'); window.location='student_index.aspx';</script>");
                }
                else
                {
                    Response.Write("<script>alert('Error: Submission failed. Please try again.'); window.history.back();</script>");
                }
            }
        }
    }
    catch (Exception ex)
    {
       // Response.Write("<script>alert(\"Error: " + ex.Message.Replace(\"\", \"\") + "\"); window.history.back();</script>");
    }
%>

</body>
</html>
