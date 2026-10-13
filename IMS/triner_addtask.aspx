<%@ Page Title="" Language="C#" MasterPageFile="~/triner.Master" AutoEventWireup="true" CodeBehind="triner_addtask.aspx.cs" Inherits="IMS.triner_addtask" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




<%
    // Define connection string
    string connectionString = "Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true";
    List<KeyValuePair<string, string>> batchList = new List<KeyValuePair<string, string>>();

    using (SqlConnection con = new SqlConnection(connectionString))
    {
        con.Open();

        // ✅ Fetch Batch List from Reference Table
        string query = "SELECT BatchID, BatchName FROM Batches";
        using (SqlCommand cmd = new SqlCommand(query, con))
        using (SqlDataReader br = cmd.ExecuteReader())
        {
            while (br.Read())
            {
                batchList.Add(new KeyValuePair<string, string>(br["BatchID"].ToString(), br["BatchName"].ToString()));
            }
        }
    }
%>

<div class="container mt-5">
    <h2 class="text-center">Add New Task</h2>
    <div class="col-md-6 mx-auto">
        <div class="bg-light rounded p-4 shadow">
            <form method="POST" action="trainer_add_task_process.aspx" enctype="multipart/form-data">

                <!-- Batch ID Selection (Dynamically Fetched) -->
                <div class="form-floating mb-3">
                    <select class="form-select" id="batchID" name="batchID" required>
                        <option selected disabled>Select Batch</option>
                        <% foreach (var batch in batchList) { %>
                            <option value="<%= batch.Key %>"><%= batch.Value %></option>
                        <% } %>
                    </select>
                    <label for="batchID">Batch</label>
                </div>

                <!-- Task Title -->
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="taskTitle" name="taskTitle" placeholder="Task Title" required>
                    <label for="taskTitle">Task Title</label>
                </div>

                <!-- Task Description -->
                <div class="form-floating mb-3">
                    <textarea class="form-control" placeholder="Enter task details" id="taskDescription" name="taskDescription" style="height: 150px;" required></textarea>
                    <label for="taskDescription">Task Description</label>
                </div>

                <!-- Due Date -->
                <div class="form-floating mb-3">
                    <input type="date" class="form-control" id="dueDate" name="dueDate" required>
                    <label for="dueDate">Due Date</label>
                </div>

                <!-- File Upload (PDF Only) -->
                <div class="mb-3">
                    <label for="taskFile" class="form-label">Upload Task File (PDF, Max: 2MB)</label>
                    <input type="file" class="form-control" id="taskFile" name="taskFile" accept="application/pdf" required>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-success w-100">Add Task</button>

            </form>
        </div>
    </div>
</div>

</asp:Content>




