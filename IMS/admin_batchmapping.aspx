<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_batchmapping.aspx.cs" Inherits="IMS.admin_batchmapping" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
        con.Open();

        // Fetch Students (Only those with UserType = 'Student')
        SqlCommand cmdStudents = new SqlCommand("SELECT UserID, FullName FROM Users WHERE UserType = 'Student'", con);
        SqlDataReader drStudents = cmdStudents.ExecuteReader();

        // Store student data
        List<string> students = new List<string>();
        while (drStudents.Read())
        {
            students.Add($"<option value='{drStudents["UserID"]}'>{drStudents["FullName"]}</option>");
        }
        drStudents.Close();

        // Fetch Batches
        SqlCommand cmdBatches = new SqlCommand("SELECT BatchID, BatchName FROM Batches", con);
        SqlDataReader drBatches = cmdBatches.ExecuteReader();

        // Store batch data
        List<string> batches = new List<string>();
        while (drBatches.Read())
        {
            batches.Add($"<option value='{drBatches["BatchID"]}'>{drBatches["BatchName"]}</option>");
        }
        drBatches.Close();

        con.Close();
    %>

    <div class="container mt-5">
        <h2 class="text-center">Enroll Student in Batch</h2>
        <div class="col-md-6 mx-auto">
            <div class="bg-light rounded p-4 shadow">
                <form method="POST" action="admin_enroll_student.aspx">

                    <!-- Student Selection -->
                    <div class="form-floating mb-3">
                        <select class="form-select" id="studentID" name="studentID" required>
                            <option selected disabled>Select Student</option>
                            <%= string.Join("\n", students) %> <!-- Dynamically adding students -->
                        </select>
                        <label for="studentID">Student</label>
                    </div>

                    <!-- Batch Selection -->
                    <div class="form-floating mb-3">
                        <select class="form-select" id="batchID" name="batchID" required>
                            <option selected disabled>Select Batch</option>
                            <%= string.Join("\n", batches) %> <!-- Dynamically adding batches -->
                        </select>
                        <label for="batchID">Batch</label>
                    </div>

                    <!-- Enrollment Date -->
                    <div class="form-floating mb-3">
                        <input type="date" class="form-control" id="enrollmentDate" name="enrollmentDate" required>
                        <label for="enrollmentDate">Enrollment Date</label>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-success w-100">Enroll Student</button>

                </form>
            </div>
        </div>
    </div>

</asp:Content>
