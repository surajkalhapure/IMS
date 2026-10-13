<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_display_attandance.aspx.cs" Inherits="IMS.admin_display_attandance" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container-fluid pt-4 px-4">
    <div class="container-fluid col-sm-12 col-xl-12">
        <div class="bg-light rounded h-100 p-4">
            <h6 class="mb-4">Attendance Records</h6>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th scope="col">Attendance ID</th>
                        <th scope="col">Batch Name</th>
                        <th scope="col">Student Name</th>
                        <th scope="col">Attendance Date</th>
                        <th scope="col">Status</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Establish Database Connection
                        SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
                        con.Open();

                        // ✅ Use JOIN to get Batch Name and Student Name
                        SqlCommand cmd = new SqlCommand(@"
                            SELECT A.AttendanceID, B.BatchName, U.FullName AS StudentName, 
                                   A.AttendanceDate, A.Status
                            FROM Attendance A
                            INNER JOIN Batches B ON A.BatchID = B.BatchID
                            INNER JOIN Users U ON A.StudentID = U.UserID", con);

                        SqlDataReader br = cmd.ExecuteReader();

                        while (br.Read())
                        {
                    %>
                    <tr>
                        <td><%= br["AttendanceID"] %></td>
                        <td><%= br["BatchName"] %></td>
                        <td><%= br["StudentName"] %></td>
                        <td><%= Convert.ToDateTime(br["AttendanceDate"]).ToString("yyyy-MM-dd") %></td>
                        <td><%= br["Status"] %></td>
                        <td>
                            <a href="admin_Delete_Attandance.aspx?x=<%= br["AttendanceID"] %>" class="btn btn-outline-danger m-2">Delete</a>
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
