<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_EditBatch.aspx.cs" Inherits="IMS.admin_EditBatch" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<%
    String p = Request.Params["x"];

    if (!String.IsNullOrEmpty(p))
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
        con.Open();

        // ✅ Fetch batch details (using parameterized query)
        SqlCommand cmdBatch = new SqlCommand("SELECT * FROM Batches WHERE BatchID = @BatchID", con);
        cmdBatch.Parameters.AddWithValue("@BatchID", p);

        SqlDataReader br = cmdBatch.ExecuteReader();

        String batchName = "", trainerID = "", schedule = "",id="";

        if (br.Read()) 
        {
            batchName = br["BatchName"].ToString();
            trainerID = br["TrainerID"].ToString();
            schedule = br["Schedule"].ToString();
                        id = br["BatchID"].ToString();

        }
        else 
        {
            Response.Write("<b>Error:</b> No batch found with ID " + p);
        }

        br.Close();

        // ✅ Fetch trainers (Only trainers from Users table)
        SqlCommand cmdTrainers = new SqlCommand("SELECT UserID, FullName FROM Users WHERE UserType='Trainer'", con);
        SqlDataReader dr = cmdTrainers.ExecuteReader();

%>

<div class="container mt-5">
    <h2 class="text-center">Update Batch</h2>
    <div class="col-md-6 mx-auto">
        <div class="bg-light rounded p-4 shadow">
            <form method="POST" action="admin_updatebatch.aspx">

                <!-- Batch Name -->
                 <input  type="hidden" class="form-control" id="ID" name="t" placeholder="ID" value="<%=id%>" required>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="batchName" name="t1" placeholder="Batch Name" value="<%=batchName%>" required>
                    <label for="batchName">Batch Name</label>
                </div>

                <!-- Trainer Selection -->
                <div class="form-floating mb-3">
                    <select class="form-select" id="trainerID" name="t2" required>
                        <% while (dr.Read()) { %>
                            <option value="<%= dr["UserID"] %>" <% if(trainerID == dr["UserID"].ToString()) { Response.Write("selected"); } %> >
                                <%= dr["FullName"] %>
                            </option>
                        <% } %>
                    </select>
                    <label for="trainerID">Trainer</label>
                </div>

                <!-- Schedule -->
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="schedule" name="t3" placeholder="Batch Schedule" value="<%=schedule%>">
                    <label for="schedule">Batch Schedule (e.g., Mon-Wed-Fri 10 AM - 12 PM)</label>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-success w-100">Update Batch</button>

            </form>
        </div>
    </div>
</div>

<%
    dr.Close();
    con.Close();
    }
    else
    {
        Response.Write("<b>Error:</b> Batch ID is missing.");
    }
%>

</asp:Content>
