<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineAuctionSystem.autentication.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 80px;
        }
        .auto-style3 {
            width: 1088px;
        }
        .auto-style6 {
            width: 590px;
        }
        .auto-style7 {
            height: 31px;
        }
        .auto-style9 {
            height: 31px;
            width: 146px;
        }
        .auto-style10 {
            width: 146px;
        }
        .auto-style11 {
            width: 100%;
            margin-left: 0px;
        }
        .auto-style12 {
            width: 256px;
        }
        .auto-style13 {
            height: 32px;
        }
    </style>
    <script>
        function ShowPassword(checkBox) {
            let passwordtb = document.getElementById('passwordTextBox');
            let confirmPasswordtb = document.getElementById('confirmPasswordTextBox');
            if (checkBox.checked) {
                passwordtb.type = 'text';
                confirmPasswordtb.type = 'text';
            }else{
                passwordtb.type = 'password';
                confirmPasswordtb.type = 'password';
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="2" class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <table cellpadding="3" cellspacing="3" class="auto-style1">
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style12">&nbsp;</td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" ForeColor="Blue" Text="Login"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <table cellpadding="3" cellspacing="3" class="auto-style1">
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td class="auto-style6">
                                    <table cellpadding="3" cellspacing="3" class="auto-style11">
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="usernameId" runat="server" Font-Bold="True" Font-Size="Medium" Text="Email"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="emailTextBox" runat="server" Height="30px" Width="245px" TextMode="Email"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Please enter a username" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter a email</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style9">
                                                <asp:Label ID="passwordId" runat="server" Font-Bold="True" Font-Size="Medium" Text="Password"></asp:Label>
                                            </td>
                                            <td class="auto-style7">
                                                <asp:TextBox ID="passwordTextBox" runat="server" Height="30px" TextMode="Password" Width="245px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="passwordTextBox" ErrorMessage="Please enter a password" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter a password</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="passwordTextBox" Display="Dynamic" ErrorMessage="Password must contain atleast 8 character,  Uppercase, LowerCase, Digit and Special Character." ForeColor="Red" ValidationExpression="(?=^.{8,}$)((?=.*\d)|(?=.*\w+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" Font-Bold="True" SetFocusOnError="True">Password must contain atleast 8 character,  Uppercase, LowerCase, Digit and Special Character.</asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style13" colspan="2">
                                                <input id="checkboxsp" type="checkbox" onclick="ShowPassword(this)"/><label for="checkboxsp"><b>Show Password</b></label>
                                                &nbsp;</td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:CheckBox ID="remembermeCheckBox" runat="server" Font-Bold="True" ForeColor="Black" Text="Remember me for a month" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Button ID="loginBtn" runat="server" BackColor="#4CAF50" BorderColor="Silver" BorderStyle="Groove" Font-Bold="True" Font-Size="Medium" Height="40px" Text="Login" Width="410px" OnClick="loginBtn_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Don&#39;t have an account?
                                                <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" NavigateUrl="~/authentication/SignUp.aspx">SignUp</asp:HyperLink>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
