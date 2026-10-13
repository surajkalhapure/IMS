<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_index.aspx.cs" Inherits="IMS.admin_index" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!-- Sale & Revenue Start -->
            
           

    <div class="container-fluid pt-4 px-4">
    <div class="row g-4">
         <div class="col-sm-6 col-xl-3">
             <a href="admin_add_user.aspx">
     <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
         <i class="fa-solid fa-user-plus fa-3x text-primary"></i>
         <div class="ms-3">
             <p class="mb-3">ADD USER</p>
         </div>
     </button>
                 </a>
 </div>
        
                              <div class="col-sm-6 col-xl-3">
    <a href="admin_addbranch.aspx">
    <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
        <i class="fa-solid fa-building fa-3x text-primary"></i>
        <div class="ms-3">
            <p class="mb-2">Add Branch</p>
        </div>
    </button>
        </a>
</div>
        <div class="col-sm-6 col-xl-3">
            <a href="admin_batchmapping.aspx">
            <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
               <i class="fa-solid fa-timeline fa-3x text-primary"></i>
                <div class="ms-3">
                    <p class="mb-2">Batch Mapping</p>
                </div>
            </button>
                </a>
        </div>
        <div class="col-sm-6 col-xl-3">
    <a href="admin_display_attandance.aspx">
    <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
       <i class="fa-solid fa-display fa-3x text-primary"></i>
        <div class="ms-3">
            <p class="mb-2">Display Attandance</p>
        </div>
    </button>
        </a>
</div>
                <div class="col-sm-6 col-xl-3">
    <a href="admin_display_user.aspx">
    <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
       <i class="fa-solid fa-display fa-3x text-primary"></i>
        <div class="ms-3">
            <p class="mb-2">Display User</p>
        </div>
    </button>
        </a>
</div>
                                              <div class="col-sm-6 col-xl-3">
    <a href="admin_display_batch.aspx">
    <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
       <i class="fa-solid fa-display fa-3x text-primary"></i>
        <div class="ms-3">
            <p class="mb-2">Display Batch</p>
        </div>
    </button>
        </a>
</div>

                                                      <div class="col-sm-6 col-xl-3">
    <a href="admin_display_batchMapping.aspx">
    <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
       <i class="fa-solid fa-display fa-3x text-primary"></i>
        <div class="ms-3">
            <p class="mb-2">Display Batch Mapping</p>
        </div>
    </button>
        </a>
</div>
    </div>

     <!-- Sale & Revenue End -->
<!--------------------------------------->
           


  <!-- <h1>Hello Admin Index</h1>-->
</div>

</asp:Content>
