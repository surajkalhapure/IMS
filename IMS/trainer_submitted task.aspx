<%@ Page Title="" Language="C#" MasterPageFile="~/triner.Master" AutoEventWireup="true" CodeBehind="trainer_submitted task.aspx.cs" Inherits="IMS.trainer_submitted_task" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">






<div class="container-fluid pt-4 px-4">
    <div class="container-fluid col-sm-12 col-xl-12">
        <div class="bg-light rounded h-100 p-4">
            <h6 class="mb-4">Submitted Tasks</h6>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Submission ID</th>
                        <th scope="col">Task Title</th>
                        <th scope="col">Student Name</th>
                        <th scope="col">Submission Date</th>
                        <th scope="col">Grade</th>
                        <th scope="col">Feedback</th>
                        <th scope="col">Document</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
                        con.Open();

                        // ✅ Join TaskSubmissions with Tasks & Users to get names instead of IDs
                        SqlCommand cmd = new SqlCommand(@"
                            SELECT TS.SubmissionID, T.Title AS TaskTitle, 
                                   U.FullName AS StudentName, TS.SubmissionDate, 
                                   TS.Grade, TS.Feedback, TS.DocumentPath
                            FROM TaskSubmissions TS
                            INNER JOIN Tasks T ON TS.TaskID = T.TaskID
                            INNER JOIN Users U ON TS.StudentID = U.UserID", con);

                        SqlDataReader br = cmd.ExecuteReader();

                        while (br.Read())
                        {
                    %>
                    <tr>
                        <td><%= br["SubmissionID"] %></td>
                        <td><%= br["TaskTitle"] %></td> <!-- Task Title instead of TaskID -->
                        <td><%= br["StudentName"] %></td> <!-- Student Name instead of StudentID -->
                        <td><%= Convert.ToDateTime(br["SubmissionDate"]).ToString("yyyy-MM-dd HH:mm") %></td>
                        <td><%= br["Grade"] %></td>
                        <td><%= br["Feedback"] %></td>
                        <td>
                            <% if (!string.IsNullOrEmpty(br["DocumentPath"].ToString())) { %>
                                <a href="<%= br["DocumentPath"] %>" target="_blank" class="btn btn-outline-primary btn-sm">View File</a>
                            <% } else { %>
                                <span class="text-muted">No File</span>
                            <% } %>
                        </td>
                        <td>
                            <a href="trainer_DeleteSubmittedTask.aspx?submissionID=<%= br["SubmissionID"] %>" class="btn btn-outline-danger btn-sm" onclick="return confirm('Are you sure you want to delete this submission?');">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                        br.Close();
                        con.Close();
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>

</asp:Content>

