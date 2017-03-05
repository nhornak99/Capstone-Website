<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>SmartBusing - Home</title>

    <%--Bootstrap CSS--%>
    <link href="~/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <%-- Bootstrap Theme CSS--%>
    <link href="~/css/freelancer.min.css" rel="stylesheet" />

    <%--Fonts--%>
    <link href="~/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
</head>
<body id="page-top" class="index">
    <form id="form1" runat="server">
        <div id="wrapper">
            <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
                <div class="container-fluid">
                    <div class="navbar-header page-scroll">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle Navigation</span> Menu <i class="fa fa-bars"></i>
                        </button>
                        <a class="navbar-brand" href="#">Smart Busing</a>
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

            <div id="body">
                <header>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="intro-text">
                                    <span class="name">Smart Busing</span>
                                    <span class="skills">Next Stop, Smart Busing</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>

                <nav class="navbar navbar-custom" id="afterHeader">
                    <div class="container-fluid">
                        <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>--%>
                        <div class="row">
                            <div class="col-md-3">
                                <img src="Images/busIcon.png" alt="Bus Icon" />
                            </div>
                            <div class="col-md-3">
                                <asp:Button ID="loginButton" runat="server" CssClass="btn btn-success" Text="Login" OnClick="loginButton_Click" />
                                <%--<!-- ModalPopupExtender -->
                                <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="loginButton"
                                    CancelControlID="btnClose" BackgroundCssClass="modalBackground">
                                </cc1:ModalPopupExtender>
                                <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" Style="display: none">
                                    This is an ASP.Net AJAX ModalPopupExtender Example<br />
                                    <asp:Button ID="btnClose" runat="server" Text="Close" />
                                </asp:Panel>--%>

                            </div>
                            <div class="col-md-3">
                                <asp:Button ID="registerButton" runat="server" CssClass="btn btn-success" Text="Register" OnClick="registerButton_Click" />
                            </div>
                            <div class="col-md-3" style="position: relative; left: 9em;">
                                <img src="Images/busIcon.png" alt="Bus Icon" />
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
            <footer class="text-center">
                <div class="footer-above">
                    <div class="container">
                        <div class="row">
                            <div class="footer-col col-md-4">
                                <h3>Location</h3>
                                <p>
                                    1101 W Liberty St
                            <br />
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
                </div>
                <div class="footer-below">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                Copyright &copy; Smart Busing 2017
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </form>



    <%--jquery--%>
    <script src="~/vendor/jquery/jquery.min.js"></script>

    <%--Bootstrap JavaScript--%>
    <script src="~/vendor/bootstrap/js/bootstrap.min.js"></script>

    <%--Plugin JavaScript--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

    <%--JavaScript Theme--%>
    <script src="~/js/freelancer.min.js"></script>

</body>
</html>
