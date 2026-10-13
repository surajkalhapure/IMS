<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_display_batch.aspx.cs" Inherits="IMS.admin_display_batch" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
               <div class="container-fluid pt-4 px-4">

    <div class="container-fluid col-sm-12 col-xl-12">
    <div class="bg-light rounded h-100 p-4">
        <h6 class="mb-4">Batch Details</h6>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">BatchID</th>
                    <th scope="col">Batch Name</th>
                    <th scope="col">Trainer Name</th>
                    <th scope="col">Schedule</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
                    con.Open();

                    // Use JOIN to get Trainer Name in the same query
                    SqlCommand cmd = new SqlCommand(@"
                        SELECT B.BatchID, B.BatchName, B.Schedule, U.FullName AS TrainerName
                        FROM Batches B
                        INNER JOIN Users U ON B.TrainerID = U.UserID", con);

                    SqlDataReader br = cmd.ExecuteReader();

                    while (br.Read())
                    {
                %>
                <tr>
                    <td><%= br["BatchID"] %></td>
                    <td><%= br["BatchName"] %></td>
                    <td><%= br["TrainerName"] %></td> <!-- Corrected Trainer Name -->
                    <td><%= br["Schedule"] %></td>
                    <td>
                        <a href="admin_EditBatch.aspx?x=<%= br["BatchID"] %>" class="btn btn-outline-warning m-2">Edit</a> |
                        <a href="admin_DeleteBatchData.aspx?x=<%= br["BatchID"] %>" class="btn btn-outline-danger m-2">Delete</a>
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

</asp:Content>
