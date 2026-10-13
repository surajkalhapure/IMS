<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="student_displaybatch.aspx.cs" Inherits="IMS.student_displaybatch" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

               <div class="container-fluid pt-4 px-4">

    <div class="container-fluid col-sm-12 col-xl-12">
    <div class="bg-light rounded h-100 p-4">
        <h6 class="mb-4">User Details</h6>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">BatchID</th>
                    <th scope="col">Batch Name</th>
                    <th scope="col">Trainer Name</th>
                    <th scope="col">Schedule</th>
                </tr>
            </thead>
            <tbody>
                <%
                    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
                    con.Open();

                    // ✅ Use JOIN to get Trainer Name in the same query
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
