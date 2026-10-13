<%@ Page Title="" Language="C#" MasterPageFile="~/triner.Master" AutoEventWireup="true" CodeBehind="triner_index.aspx.cs" Inherits="IMS.triner_index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!-- Sale & Revenue Start -->
            <div class="container-fluid pt-4 px-4">
                  <div class="row g-4">
        <div class="col-sm-6 col-xl-3">
            <a href="trainer_add_user.aspx">
    <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
        <i class="fa-solid fa-user-plus fa-3x text-primary"></i>
        <div class="ms-3">
            <p class="mb-3">ADD USER</p>
        </div>
    </button>
                </a>
</div>
       
        <div class="col-sm-6 col-xl-3">
            <a href="triner_addtask.aspx">
    <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
        <i class="fa-solid fa-book-open fa-3x text-primary"></i>
        <div class="ms-3">
            <p class="mb-2">ADD TASK</p>
        </div>
    </button>
            </a>
</div>
    
       <div class="col-sm-6 col-xl-3">
           <a href="triner_display_attandance.aspx">
           <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
               <i class="fa-solid fa-display fa-3x text-primary"></i>
               <div class="ms-3">
                   <p class="mb-2">Display Attandance</p>
               </div>
           </button>
               </a>
       </div>
                      
                <div class="col-sm-6 col-xl-3">
    <a href="trainer_display_user.aspx">
    <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
       <i class="fa-solid fa-display fa-3x text-primary"></i>
        <div class="ms-3">
            <p class="mb-2">Display User</p>
        </div>
    </button>
        </a>
</div>
                                      <div class="col-sm-6 col-xl-3">
    <a href="triner_displatbatches.aspx">
    <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
       <i class="fa-solid fa-display fa-3x text-primary"></i>
        <div class="ms-3">
            <p class="mb-2">Display Batch</p>
        </div>
    </button>
        </a>
</div>

                   <div class="col-sm-6 col-xl-3">
    <a href="trainer_mapping.aspx">
    <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
       <i class="fa-solid fa-display fa-3x text-primary"></i>
        <div class="ms-3">
            <p class="mb-2">Display Batch Mapping</p>
        </div>
    </button>
        </a>
</div>

          <div class="col-sm-6 col-xl-3">
    <a href="trainer_submitted task.aspx">
    <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
       <i class="fa-solid fa-display fa-3x text-primary"></i>
        <div class="ms-3">
            <p class="mb-2">Display Submitted Task</p>
        </div>
    </button>
        </a>
</div>
   </div>
            
            <!-- Sale & Revenue End -->
    
                </div>

</asp:Content>
