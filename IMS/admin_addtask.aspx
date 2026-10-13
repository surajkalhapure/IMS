<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_addtask.aspx.cs" Inherits="IMS.admin_addtask" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container mt-5">
        <h2 class="text-center">Add New Task</h2>
        <div class="col-md-6 mx-auto">
            <div class="bg-light rounded p-4 shadow">
                <form method="POST" action="add_task.aspx">

                    <!-- Batch ID -->
                    <div class="form-floating mb-3">
                        <select class="form-select" id="batchID" name="batchID" required>
                            <option selected disabled>Select Batch</option>
                             <option value="1">Full Stack .NET</option>
 <option value="2">Full Stack JAVA</option>
 <option value="3">Full Stack PYTHON</option>
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

                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-success w-100">Add Task</button>

                </form>
            </div>
        </div>
    </div>




</asp:Content>
