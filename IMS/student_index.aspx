<%@ Page Title="" Language="C#" MasterPageFile="~/student.Master" AutoEventWireup="true" CodeBehind="student_index.aspx.cs" Inherits="IMS.student_index" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Sale & Revenue Start -->
                       <div class="container-fluid pt-4 px-4">
                  <div class="row g-4">
        <div class="col-sm-6 col-xl-3">
            <a href="student_add_attandance.aspx">
    <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
        <i class="fa-solid fa-circle-plus fa-3x text-primary"></i>
        <div class="ms-3">
            <p class="mb-3">ATTANDANCE</p>
        </div>
    </button>
                </a>
</div>
       
        <div class="col-sm-6 col-xl-3">
            <a href="student_submit_task.aspx">
    <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
        <i class="fa-solid fa-file-import fa-3x text-primary"></i>
        <div class="ms-3">
            <p class="mb-2">SUBMIT TASK</p>
        </div>
    </button>
            </a>
</div>
                              <div class="col-sm-6 col-xl-3">
            <a href="student_displaybatch.aspx">
    <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
       <i class="fa-solid fa-display fa-3x text-primary"></i>
        <div class="ms-3">
            <p class="mb-2">Diaplay Batch</p>
        </div>
    </button>
            </a>
</div>
                      <div class="col-sm-6 col-xl-3">
            <a href="student_displaytask.aspx">
    <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
       <i class="fa-solid fa-display fa-3x text-primary"></i>
        <div class="ms-3">
            <p class="mb-2">Diaplay Task</p>
        </div>
    </button>
            </a>
</div>
                      
                      <div class="col-sm-6 col-xl-3">
            <a href="student_mapping.aspx">
    <button class="btn bg-light rounded d-flex align-items-center justify-content-between p-4 w-100">
       <i class="fa-solid fa-display fa-3x text-primary"></i>
        <div class="ms-3">
            <p class="mb-2">Diaplay Batch Mapping</p>
        </div>
    </button>
            </a>
</div>
    
       
   </div>
            
            <!-- Sale & Revenue End -->

                         






   
                </div>
</asp:Content>
