<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_addbranch.aspx.cs" Inherits="IMS.admin_addbranch" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
    con.Open();

    SqlCommand cmd = new SqlCommand("SELECT UserID, FullName FROM Users WHERE UserType='Trainer'", con);
    SqlDataReader dr = cmd.ExecuteReader();
%>







<div class="container mt-5">
        <h2 class="text-center">Add New Batch</h2>
        <div class="col-md-6 mx-auto">
            <div class="bg-light rounded p-4 shadow">
                <form method="POST" action="admin_add_batch.aspx">

                    <!-- Batch Name -->
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="batchName" name="batchName" placeholder="Batch Name" required>
                        <label for="batchName">Batch Name</label>
                    </div>

                    <!-- Trainer Selection -->
                    <div class="form-floating mb-3">
                        <select class="form-select" id="trainerID" name="trainerID" required>
                            <% while (dr.Read()) { %>
    <option value="<%= dr["UserID"] %>"><%= dr["FullName"] %></option>
<% } %>
                        </select>
                        <label for="trainerID">Trainer</label>
                    </div>
                    <label>Select Trainer:</label>
    
                    <!-- Schedule -->
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="schedule" name="schedule" placeholder="Batch Schedule">
                        <label for="schedule">Batch Schedule (e.g., Mon-Wed-Fri 10 AM - 12 PM)</label>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-success w-100">Add Batch</button>

                </form>
            </div>
        </div>
    </div>
    <%
    dr.Close();
    con.Close();
%>

</asp:Content>
