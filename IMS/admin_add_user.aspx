<%@ Page Title="" Language="C#" MasterPageFile="~/admin.Master" AutoEventWireup="true" CodeBehind="admin_add_user.aspx.cs" Inherits="IMS.admin_add_user" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="container mt-5">
        <h2 class="text-center">User Registration</h2>
        <div class="col-md-6 mx-auto">
            <div class="bg-light rounded p-4 shadow">
                <form method="POST" action="admin_register.aspx">
                    
                    <!-- Full Name -->
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" id="fullName" name="t1" placeholder="Full Name" required>
                        <label for="fullName">Full Name</label>
                    </div>

                    <!-- Email -->
                    <div class="form-floating mb-3">
                        <input type="email" class="form-control" id="email" name="t2" placeholder="name@example.com" required>
                        <label for="email">Email Address</label>
                    </div>

                    <!-- User Type -->
                    <div class="form-floating mb-3">
                        <select class="form-select" id="userType" name="t3" required>
                            <option selected disabled>Choose User Type</option>
                            <option value="Admin">Admin</option>
                            <option value="Trainer">Trainer</option>
                            <option value="Student">Student</option>
                        </select>
                        <label for="userType">User Type</label>
                    </div>

                    <!-- Password -->
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" id="password" name="t4" placeholder="Password" required>
                        <label for="password">Password</label>
                        <i class="fa fa-eye-slash position-absolute end-0 top-50 translate-middle-y me-3" id="togglePassword" style="cursor: pointer;"></i>
                    </div>

                    <!-- Submit Button -->
                    <button type="submit" class="btn btn-success w-100">Register</button>
                
                </form>
            </div>
        </div>
    </div>

    <script>
        

            document.getElementById("togglePassword").addEventListener("click", function () {
         var passwordField = document.getElementById("password");
            var icon = this;

            if (passwordField.type === "password") {
                passwordField.type = "text";
            icon.classList.remove("fa-eye-slash");
            icon.classList.add("fa-eye");
         } else {
                passwordField.type = "password";
            icon.classList.remove("fa-eye");
            icon.classList.add("fa-eye-slash");
         }
     });
    </script>
    </script>

</asp:Content>
