<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SmartBusing - Admin</title>

    <%--Bootstrap CSS--%>
    <link href="~/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <%-- Bootstrap Theme CSS--%>
    <link href="~/css/freelancer.min.css" rel="stylesheet" />

    <%--Fonts--%>
    <link href="~/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />

    <%--Scripts--%>
    <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.blockUI.js"></script>
    <script type="text/javascript">
        function BlockUI(elementID) {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(function () {
                $("#" + elementID).block({
                    message: '<table align = "center"><tr><td>' +
                        '<img src="Images/loadingAnim.gif"/></td></tr></table>',
                    css: {},
                    overlayCSS: { backgroundColor: '#000000', opacity: 0.6, border: '3px solid #63B2EB' }
                });
            });
            prm.add_endRequest(function () {
                $("#" + elementID).unblock();
            });
        }
        $(document).ready(function () {
            BlockUI("dvGrid");
        });

    </script>

    <style type="text/css">
        .wrapper {
            height: 100%;
        }

        #form1 {
            text-align: center;
            background-color: gray;
            position: absolute;
            top: 0;
            right: 0;
            left: 0;
            bottom: 0;
            padding-top: 10em;
        }

        #footer {
            position: absolute;
            bottom: 0;
            right: 0;
            left: 0;
        }

        #showOptions p {
            font-size: 2em;
            padding-right: 1.5em;
        }

        #showAll {
            padding-left: 2.5em;
        }

        #districtList {
            position: relative;
            right: 2.3em;
            width: 10em;
        }

        .rowStyle {
            cursor: pointer;
        }
        #dvGrid{
            width: 60%;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }
    </style>

</head>
<body id="page-top" class="index">
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
                        <a href="Defaul2.apsx"></a>
                    </li>
                    <li>
                        <a href="#">Products</a>
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
        <div style="clear: both"></div>
        </div>

        
        <form id="form1" runat="server">
            <div id="content">
            <div id="main" class="container-fluid">
                <div>
                    <div class="row">

                        <div class="col-md-12">
                            <h2>Show students</h2>

                            <div id="showOptions">
                                <p style="display: inline-block">By District</p>

                                <asp:DropDownList ID="districtList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="districtList_SelectedIndexChanged" TabIndex="0"></asp:DropDownList>
                                <asp:CheckBox ID="showAll" runat="server" Text="Show All" Font-Size="2em" />
                            </div>

                            <asp:ScriptManager ID="ScriptManager1" runat="server">
                            </asp:ScriptManager>
                            <div id="dvGrid">
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:GridView ID="GridView1" runat="server" Width="100%"
                                            AutoGenerateColumns="false" Font-Names="Arial"
                                            Font-Size="11pt" AlternatingRowStyle-BackColor="#C2D69B"
                                            HeaderStyle-BackColor="green" AllowPaging="true" ShowFooter="true"
                                            OnPageIndexChanging="OnPaging" OnRowEditing="EditUser"
                                            OnRowUpdating="UpdateUser" OnRowCancelingEdit="CancelEdit"
                                            PageSize="10" >
                                            <Columns>
                                                <asp:TemplateField ItemStyle-Width="10%" HeaderText="User ID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUserID" runat="server"
                                                            Text='<%# Eval("User_ID")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <%--<FooterTemplate>
                                                        <asp:TextBox ID="txtUserID" Width="40px"
                                                            MaxLength="5" runat="server"></asp:TextBox>
                                                    </FooterTemplate>--%>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="25%" HeaderText="Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblName" runat="server"
                                                            Text='<%# Eval("FirstName")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtName" runat="server"
                                                            Text='<%# Eval("FirstName")%>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="25%" HeaderText="User Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblUserName" runat="server"
                                                            Text='<%# Eval("UserName")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtUserName" runat="server"
                                                            Text='<%# Eval("UserName")%>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="25%" HeaderText="Password">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblPassword" runat="server"
                                                            Text='<%# Eval("Password")%>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtPassword" runat="server"
                                                            Text='<%# Eval("Password")%>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lnkRemove" runat="server"
                                                            CommandArgument='<%# Eval("User_ID")%>'
                                                            OnClientClick="return confirm('Do you want to delete?')"
                                                            Text="Delete" OnClick="DeleteUser"></asp:LinkButton>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Button ID="btnAdd" runat="server" Text="Add"
                                                            OnClick="AddNewUser" />
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:CommandField ShowEditButton="True" />
                                            </Columns>
                                            <AlternatingRowStyle BackColor="#C2D69B" />
                                        </asp:GridView>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="GridView1" />
                                    </Triggers>
                                </asp:UpdatePanel>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            </div>

            <div id="footer">
            <footer class="text-center">
                <div class="footer-above">
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


    
</body>
</html>
