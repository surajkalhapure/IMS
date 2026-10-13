<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_DeleteUserData.aspx.cs" Inherits="IMS.admin_DeleteUserData" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


 <%
     string k = Request.Params["x"];
     Response.Write("Id is " + k);

    SqlConnection con = new SqlConnection("Data Source=DESKTOP-L1OH3C3\\SQLEXPRESS01;Initial Catalog=IMSDB;Trusted_Connection=true");
     con.Open();

     SqlCommand cmd = new SqlCommand("delete from Users where UserID='" + k + "'", con);
     cmd.ExecuteNonQuery();

                 Response.Write("<script>alert('User Delete Succesfull...!'); window.location='admin_display_user.aspx';</script>");


   %>

</asp:Content>
