<%@ Page Title="" Language="C#" MasterPageFile="~/triner.Master" AutoEventWireup="true" CodeBehind="trainer_display_user.aspx.cs" Inherits="IMS.trainer_display_user" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

               <div class="container-fluid pt-4 px-4">
    <div class="container-fluid col-sm-12 col-xl-12">
                    <div class="bg-light rounded h-100 p-4">
                        <h6 class=" mb-4">User Detals</h6>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Full Name</th>
                                    <th scope="col">User Type</th>
                                    <th scope="col">User Email</th>
                                   <!-- <th scope="col">Password</th>                                        
                                    <th scope="col">Action</th>-->
                                </tr>
                            </thead>
                            <tbody>
                               <%
    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
con.Open();

SqlCommand cmd = new SqlCommand("select * from Users", con);

SqlDataReader br = cmd.ExecuteReader();

while (br.Read())
{
   %>
    <tr>
        <td><%=br["UserID"]%></td>
        <td><%=br["UserType"]%></td>
        <td><%=br["FullName"] %></td>
         <td><%=br["Email"] %></td>
         <!--<td><%=br["Password"] %></td>
        <td>
            <a href="EditUser.aspx?x=<%=br["UserID"]%>" class="btn btn-outline-warning m-2">Edit</a> |
            <a href="DeleteUserData.aspx?x=<%=br["UserID"]%>" class="btn btn-outline-danger m-2">Delete</a>
        </td>-->

</tr>
<%
}
 %>
                            </tbody>
                        </table>
                    </div>
                </div>
        </div>

</asp:Content>
