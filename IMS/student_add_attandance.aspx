<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="student_add_attandance.aspx.cs" Inherits="IMS.student_add_attandance" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%
    // Database connection string
    string connectionString = "Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true";
    
    // Lists to store dropdown values
    List<KeyValuePair<int, string>> batches = new List<KeyValuePair<int, string>>();
    List<KeyValuePair<int, string>> students = new List<KeyValuePair<int, string>>();

    using (SqlConnection con = new SqlConnection(connectionString))
    {
        con.Open();

        // Fetch Batches
        using (SqlCommand cmd = new SqlCommand("SELECT BatchID, BatchName FROM Batches", con))
        using (SqlDataReader dr = cmd.ExecuteReader())
        {
            while (dr.Read())
            {
                batches.Add(new KeyValuePair<int, string>((int)dr["BatchID"], dr["BatchName"].ToString()));
            }
        }

        // Fetch Students
        using (SqlCommand cmd = new SqlCommand("SELECT UserID, FullName FROM Users WHERE UserType='Student'", con))
        using (SqlDataReader dr = cmd.ExecuteReader())
        {
            while (dr.Read())
            {
                students.Add(new KeyValuePair<int, string>((int)dr["UserID"], dr["FullName"].ToString()));
            }
        }
    }
%>

<div class="container mt-5">
    <h2 class="text-center">Mark Attendance</h2>
    <div class="col-md-6 mx-auto">
        <div class="bg-light rounded p-4 shadow">
            <form method="POST" action="student_insert_attandance.aspx">

                <!-- Batch Selection -->
                <div class="form-floating mb-3">
                    <select class="form-select" id="batchID" name="t1" required>
                        <option selected disabled>Select Batch</option>
                        <% foreach (var batch in batches) { %>
                            <option value="<%= batch.Key %>"><%= batch.Value %></option>
                        <% } %>
                    </select>
                    <label for="batchID">Batch</label>
                </div>

                <!-- Student Selection -->
                <div class="form-floating mb-3">
                    <select class="form-select" id="studentID" name="t2" required>
                        <option selected disabled>Select Student</option>
                        <% foreach (var student in students) { %>
                            <option value="<%= student.Key %>"><%= student.Value %></option>
                        <% } %>
                    </select>
                    <label for="studentID">Student</label>
                </div>

                <!-- Attendance Date -->
                <div class="form-floating mb-3">
                    <input type="date" class="form-control" id="attendanceDate" name="t3" required>
                    <label for="attendanceDate">Attendance Date</label>
                </div>

                <!-- Attendance Status -->
                <div class="form-floating mb-3">
                    <select class="form-select" id="status" name="t4" required>
                        <option selected disabled>Select Status</option>
                        <option value="Present">Present</option>
                        <option value="Absent">Absent</option>
                        <option value="Late">Late</option>
                    </select>
                    <label for="status">Status</label>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-success w-100">Mark Attendance</button>

            </form>
        </div>
    </div>
</div>

</asp:Content>
