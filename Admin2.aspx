<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterForm.aspx.cs" Inherits="RegisterForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Smart Busing - Register</title>

    <style>
        .wrapper {
            height: 100%;
        }
        #form1 {
            text-align: center;
            background-color: gray;
            
        }

        #loginBtn {
            width: 25%;
        }

        .logintextbox{
            font-size : 2em;
        }
    </style>

    <%--Bootstrap CSS--%>
    <link href="~/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <%-- Bootstrap Theme CSS--%>
    <link href="~/css/freelancer.min.css" rel="stylesheet" />

    <%--Fonts--%>
    <link href="~/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />

</head>
<body>

        <div id="wrapper-nav">
        <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
            <div class="container-fluid">
                <div class="navbar-header page-scroll">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle Navigation</span> Menu <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand" href="Default2.aspx">Smart Busing</a>
                </div>

                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden active">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a href="ProductForm.aspx">Products</a>
                    </li>
                    <li>
                        <a href="AboutForm.aspx">About</a>
                    </li>
                    <li>
                        <a href="ContactForm.aspx">Contact</a>
                    </li>
                </ul>
            </div>
        </nav>
        </div>

       
        <form id="form1" runat="server">
            <div id="content">
            <div id="main" class="container-fluid">
                
                    <div class="row">

                        <div class="col-md-12">
                            <h1>Smart Busing</h1>
                            <p>Registration Page</p>
                            <div class="form-group">
                                <asp:Label ID="nameLabel" runat="server" Text="First Name" Font-Size="2.5em" CssClass="loginLbl"></asp:Label><br />
                                <asp:TextBox ID="nameTB" runat="server" CssClass="logintextbox"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="usernameLabel" runat="server" Text="Username" Font-Size="2.5em" CssClass="loginLbl"></asp:Label><br />
                                <asp:TextBox ID="usernameTB" runat="server" CssClass="logintextbox"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="passwordLabel" runat="server" Text="Password" Font-Size="2.5em" CssClass="loginLbl"></asp:Label><br />
                                <asp:TextBox ID="passwordTB" runat="server" CssClass="logintextbox"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="confPasswordLabel" runat="server" Text="Confirm Password" Font-Size="2.5em" CssClass="loginLbl"></asp:Label><br />
                                <asp:TextBox ID="confPassTB" runat="server" CssClass="logintextbox" ></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="districtLbl" runat="server" Text="District" Font-Size="2.5em" CssClass="loginLbl"></asp:Label><br />
                                <asp:DropDownList ID="districtList" runat="server" Width="10em" AutoPostBack="True"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <asp:Button ID="loginBtn" runat="server" Text="Register" CssClass="btn btn-success" OnClick="loginBtn_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div style="clear: both"></div>

            <div id="footer">
                <footer class="text-center">
                    <%--<div class="footer-above">--%>
                        <div class="container">
                            <div class="row">
                                <div class="footer-col col-md-4">
                                    <h3>Location</h3>
                                    <p>
                                        1101 W Liberty St
                            <br>
                                        Medina, OH 44256
                                    </p>
                                </div>
                                <div class="footer-col col-md-4">
                                    <h3>Social</h3>
                                    <ul class="list-inline">
                                        <li>
                                            <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-facebook"></i></a>
                                        </li>
                                        <li>
                                            <a href="#" class="btn-social btn-outline"><i class="fa fa-fw fa-twitter"></i></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="footer-col col-md-4">
                                    <h3>Contact Info</h3>
                                    <p>330-888-0870</p>
                                    <p>smartbusingsupport@gmail.com</p>
                                </div>
                            </div>
                        </div>
                    <%--</div>--%>
                    <%--<div class="footer-below">--%>
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    Copyright &copy; Smart Busing 2017
                                </div>
                            </div>
                        </div>
                    <%--</div>--%>
                </footer>
            </div>
        </form>




</body>
</html>
