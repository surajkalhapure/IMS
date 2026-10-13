<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_UpdateBatchMapping.aspx.cs" Inherits="IMS.admin_UpdateBatchMapping" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<%
    string connectionString = "Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true";
    string mappingID = Request.Params["x"];

    string selectedStudentID = "", selectedBatchID = "", enrollmentDate = "";

    List<KeyValuePair<string, string>> students = new List<KeyValuePair<string, string>>();
    List<KeyValuePair<string, string>> batches = new List<KeyValuePair<string, string>>();

    if (!string.IsNullOrEmpty(mappingID))
    {
        using (SqlConnection con = new SqlConnection(connectionString))
        {
            con.Open();

            // ✅ Fetch the existing student-batch mapping details
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM StudentBatchMapping WHERE MappingID = @MappingID", con))
            {
                cmd.Parameters.AddWithValue("@MappingID", mappingID);
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        selectedStudentID = reader["StudentID"].ToString();
                        selectedBatchID = reader["BatchID"].ToString();
                        enrollmentDate = Convert.ToDateTime(reader["EnrollmentDate"]).ToString("yyyy-MM-dd");
                    }
                    else
                    {
                        Response.Write("<b>Error:</b> No record found with ID " + mappingID);
                    }
                }
            }

            // ✅ Fetch Student List (Only students from Users table)
            using (SqlCommand cmd = new SqlCommand("SELECT UserID, FullName FROM Users WHERE UserType='Student'", con))
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    students.Add(new KeyValuePair<string, string>(reader["UserID"].ToString(), reader["FullName"].ToString()));
                }
            }

            // ✅ Fetch Batch List
            using (SqlCommand cmd = new SqlCommand("SELECT BatchID, BatchName FROM Batches", con))
            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    batches.Add(new KeyValuePair<string, string>(reader["BatchID"].ToString(), reader["BatchName"].ToString()));
                }
            }
        }
    }
    else
    {
        Response.Write("<b>Error:</b> Mapping ID is missing.");
    }
%>

<div class="container mt-5">
    <h2 class="text-center">Update Student Batch Mapping</h2>
    <div class="col-md-6 mx-auto">
        <div class="bg-light rounded p-4 shadow">
            <form method="POST" action="admin_UpdateBatchMappingProcess.aspx">

                <!-- Hidden Mapping ID -->
                <input type="hidden" class="form-control" id="mappingID" name="t" value="<%= mappingID %>" required>

                <!-- Student Selection -->
                <div class="form-floating mb-3">
                    <select class="form-select" id="studentID" name="t1" required>
                        <option selected disabled>Select Student</option>
                        <% foreach (var student in students) { %>
                            <option value="<%= student.Key %>" <% if(selectedStudentID == student.Key) { Response.Write("selected"); } %> >
                                <%= student.Value %>
                            </option>
                        <% } %>
                    </select>
                    <label for="studentID">Student</label>
                </div>

                <!-- Batch Selection -->
                <div class="form-floating mb-3">
                    <select class="form-select" id="batchID" name="t2" required>
                        <option selected disabled>Select Batch</option>
                        <% foreach (var batch in batches) { %>
                            <option value="<%= batch.Key %>" <% if(selectedBatchID == batch.Key) { Response.Write("selected"); } %> >
                                <%= batch.Value %>
                            </option>
                        <% } %>
                    </select>
                    <label for="batchID">Batch</label>
                </div>

                <!-- Enrollment Date -->
                <div class="form-floating mb-3">
                    <input type="date" class="form-control" id="enrollmentDate" name="t3" value="<%= enrollmentDate %>" required>
                    <label for="enrollmentDate">Enrollment Date</label>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-success w-100">Update Mapping</button>

            </form>
        </div>
    </div>
</div>

</asp:Content>
