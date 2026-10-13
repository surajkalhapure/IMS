<%@ Page Title="" Language="C#" MasterPageFile="~/triner.Master" AutoEventWireup="true" CodeBehind="trainer_mapping.aspx.cs" Inherits="IMS.trainer_mapping" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div class="container-fluid pt-4 px-4">
     <div class="container-fluid col-sm-12 col-xl-12">
         <div class="bg-light rounded h-100 p-4">
             <h6 class="mb-4">Student Batch Mapping Details</h6>
             <table class="table table-hover">
                 <thead>
                     <tr>
                         <th scope="col">Mapping ID</th>
                         <th scope="col">Batch Name</th>
                         <th scope="col">Student Name</th>
                         <th scope="col">Enrollment Date</th>
                     </tr>
                 </thead>
                 <tbody>
                     <%
                         // Define connection string
                         string connectionString = "Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true";

                         // Use 'using' to ensure proper resource cleanup
                         using (SqlConnection con = new SqlConnection(connectionString))
                         {
                             con.Open();

                             // Fetching Batch and Student Details using JOIN
                             string query = @"
                                 SELECT SBM.MappingID, B.BatchName, U.FullName AS StudentName, SBM.EnrollmentDate
                                 FROM StudentBatchMapping SBM
                                 INNER JOIN Batches B ON SBM.BatchID = B.BatchID
                                 INNER JOIN Users U ON SBM.StudentID = U.UserID";

                             using (SqlCommand cmd = new SqlCommand(query, con))
                             using (SqlDataReader br = cmd.ExecuteReader())
                             {
                                 while (br.Read())
                                 {
                     %>
                     <tr>
                         <td><%= br["MappingID"] %></td>
                         <td><%= br["BatchName"] %></td>
                         <td><%= br["StudentName"] %></td>
                         <td>
                             <% 
                                 // Ensure EnrollmentDate is not null
                                 if (br["EnrollmentDate"] != DBNull.Value) 
                                 { 
                                     Response.Write(Convert.ToDateTime(br["EnrollmentDate"]).ToString("yyyy-MM-dd")); 
                                 } 
                                 else 
                                 { 
                                     Response.Write("N/A"); // Display "N/A" if date is missing
                                 } 
                             %>
                         </td>
                        
                     </tr>
                     <%
                                 } // End while loop
                             } // End using SqlDataReader
                         } // End using SqlConnection
                     %>
                 </tbody>
             </table>
         </div>
     </div>
 </div>

</asp:Content>
