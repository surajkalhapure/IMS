<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="student_displaytask.aspx.cs" Inherits="IMS.student_displaytask" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container-fluid pt-4 px-4">
    <div class="container-fluid col-sm-12 col-xl-12">
        <div class="bg-light rounded h-100 p-4">
            <h6 class="mb-4">Task Details</h6>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Task ID</th>
                        <th scope="col">Batch Name</th>
                        <th scope="col">Task Title</th>
                        <th scope="col">Description</th>
                        <th scope="col">Due Date</th>
                        <th scope="col">Document</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
                        con.Open();

                        // ✅ Query to fetch tasks along with batch name
                        SqlCommand cmd = new SqlCommand(@"
                            SELECT T.TaskID, B.BatchName, T.Title, T.Description, 
                                   T.DueDate, T.DocumentPath
                            FROM Tasks T
                            INNER JOIN Batches B ON T.BatchID = B.BatchID", con);

                        SqlDataReader br = cmd.ExecuteReader();

                        while (br.Read())
                        {
                    %>
                    <tr>
                        <td><%= br["TaskID"] %></td>
                        <td><%= br["BatchName"] %></td>
                        <td><%= br["Title"] %></td>
                        <td><%= br["Description"] %></td>
                        <td><%= Convert.ToDateTime(br["DueDate"]).ToString("yyyy-MM-dd") %></td>
                        <td>
                            <% if (!string.IsNullOrEmpty(br["DocumentPath"].ToString())) { %>
                                <a href="<%= br["DocumentPath"] %>" target="_blank" class="btn btn-outline-primary btn-sm">View File</a>
                            <% } else { %>
                                <span class="text-muted">No File</span>
                            <% } %>
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
