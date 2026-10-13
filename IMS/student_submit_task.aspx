<%@ Page Title="Submit Task" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="student_submit_task.aspx.cs" Inherits="IMS.student_submit_task" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container mt-5">
    <h2 class="text-center">Submit Task</h2>
    <div class="col-md-6 mx-auto">
        <div class="bg-light rounded p-4 shadow">
            <form method="POST" action="student_submit_task_process.aspx" enctype="multipart/form-data">

                <!-- Task Selection (Dynamically Loaded) -->
                <div class="form-floating mb-3">
                    <select class="form-select" id="taskID" name="taskID" required>
                        <option selected disabled>Select Task</option>
                        <%
                            SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
                            con.Open();
                            SqlCommand cmd = new SqlCommand("SELECT TaskID, Title FROM Tasks", con);
                            SqlDataReader dr = cmd.ExecuteReader();
                            while (dr.Read())
                            {
                        %>
                            <option value="<%= dr["TaskID"] %>"><%= dr["Title"] %></option>
                        <%
                            }
                            dr.Close();
                            con.Close();
                        %>
                    </select>
                    <label for="taskID">Task</label>
                </div>

                <!-- Student Selection (Dynamically Loaded) -->
                <div class="form-floating mb-3">
                    <select class="form-select" id="studentID" name="studentID" required>
                        <option selected disabled>Select Student</option>
                        <%
                            con.Open();
                            cmd = new SqlCommand("SELECT UserID, FullName FROM Users WHERE UserType = 'Student'", con);
                            dr = cmd.ExecuteReader();
                            while (dr.Read())
                            {
                        %>
                            <option value="<%= dr["UserID"] %>"><%= dr["FullName"] %></option>
                        <%
                            }
                            dr.Close();
                            con.Close();
                        %>
                    </select>
                    <label for="studentID">Student</label>
                </div>

                <!-- Submission Date -->
                <div class="form-floating mb-3">
                    <input type="datetime-local" class="form-control" id="submissionDate" name="submissionDate" required>
                    <label for="submissionDate">Submission Date</label>
                </div>

                <!-- Grade (Optional) -->
                <div class="form-floating mb-3">
                    <select class="form-select" id="grade" name="grade">
                        <option selected disabled>Select Grade</option>
                        <option value="A">A</option>
                        <option value="B">B</option>
                        <option value="C">C</option>
                        <option value="D">D</option>
                        <option value="F">F</option>
                    </select>
                    <label for="grade">Grade (Optional)</label>
                </div>

                <!-- Feedback -->
                <div class="form-floating">
                    <textarea class="form-control" placeholder="Leave feedback here" id="feedback" name="feedback" style="height: 150px;"></textarea>
                    <label for="feedback">Feedback</label>
                </div>

                <!-- File Upload (PDF Only) -->
                <div class="mb-3">
                    <label for="taskFile" class="form-label">Upload Task File (PDF, Max 2MB)</label>
                    <input type="file" class="form-control" id="taskFile" name="taskFile" accept=".pdf" required>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-success w-100 mt-3">Submit Task</button>

            </form>
        </div>
    </div>
</div>
</asp:Content>
