<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="OnlineAuctionSystem.autentication.SignUp" %>

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
        .auto-style12 {
            width: 299px;
        }
        .auto-style4 {
            width: 126px;
        }
        .auto-style6 {
            width: 719px;
        }
        .auto-style11 {
            width: 105%;
            margin-left: 0px;
        }
        .auto-style10 {
            width: 156px;
        }
        .auto-style9 {
            height: 31px;
            width: 156px;
        }
        .auto-style7 {
            height: 31px;
            width: 427px;
        }
        .auto-style13 {
            height: 32px;
        }
        .auto-style14 {
            width: 427px;
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
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" ForeColor="Blue" Text="SignUp"></asp:Label>
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
                                <td class="auto-style4">&nbsp;</td>
                                <td class="auto-style6">
                                    <table cellpadding="3" cellspacing="3" class="auto-style11">
                                        <tr>
                                            <td colspan="2"></td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="usernameId" runat="server" Font-Bold="True" Font-Size="Medium" Text="FirstName"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="firstnameTextBox" runat="server" Height="30px" Width="245px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="firstnameTextBox" ErrorMessage="Please enter a firstname" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter a firstname</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="lastnameLabel" runat="server" Font-Bold="True" Font-Size="Medium" Text="LastName"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="lastnameTextBox" runat="server" Height="30px" Width="245px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lastnameTextBox" ErrorMessage="Please enter a lastname" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter a lastname</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="Agelbl" runat="server" Font-Bold="True" Font-Size="Medium" Text="Age"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="ageTextBox" runat="server" Height="30px" Width="245px" TextMode="Number"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ageTextBox" ErrorMessage="Please enter a age" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter a age</asp:RequiredFieldValidator>
                                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="ageTextBox" Display="Dynamic" ErrorMessage="RangeValidator" Font-Bold="True" ForeColor="Red" MaximumValue="95" MinimumValue="18" SetFocusOnError="True">Age must be greater than 18</asp:RangeValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="usernameId0" runat="server" Font-Bold="True" Font-Size="Medium" Text="Email"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="emailTextBox" runat="server" Height="30px" Width="245px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Please enter a email" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter a email</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="Please enter valid email" Font-Bold="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="gender" runat="server" Font-Bold="True" Font-Size="Medium" Text="Gender"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:DropDownList ID="genderSelectBox" runat="server" Height="30px" Width="253px" Font-Size="Medium">
                                                    <asp:ListItem Selected="True" >select</asp:ListItem>
                                                    <asp:ListItem>Male</asp:ListItem>
                                                    <asp:ListItem>Female</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="genderSelectBox" Display="Dynamic" ErrorMessage="Please Select Gender" Font-Bold="True" ForeColor="Red" InitialValue="select" SetFocusOnError="True">Please select gender</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="usernameId1" runat="server" Font-Bold="True" Font-Size="Medium" Text="Pancard"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:FileUpload ID="documentFileUpload" runat="server" BackColor="White" ForeColor="Blue" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="documentFileUpload" ErrorMessage="RequiredFieldValidator" Font-Bold="True" ForeColor="Red" Display="Dynamic">Please select file</asp:RequiredFieldValidator>
                                                <asp:Label ID="fileLabel" runat="server" Text="Label" Visible="False"></asp:Label>
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
                                            <td class="auto-style9">
                                                <asp:Label ID="cpasswordId" runat="server" Font-Bold="True" Font-Size="Medium" Text="Confirm Password"></asp:Label>
                                            </td>
                                            <td class="auto-style7">
                                                <asp:TextBox ID="confirmPasswordTextBox" runat="server" Height="30px" TextMode="Password" Width="245px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="confirmPasswordTextBox" ErrorMessage="Please enter a password" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter a password</asp:RequiredFieldValidator>
                                                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="passwordTextBox" ControlToValidate="confirmPasswordTextBox" Display="Dynamic" Font-Bold="True" ForeColor="Red" SetFocusOnError="True">Password must be same</asp:CompareValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style13" colspan="2">
                                                <input id="checkboxsp" type="checkbox" onclick="ShowPassword(this)"/><label for="checkboxsp"><b>Show Password</b></label>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Button ID="signupBtnId" runat="server" BackColor="#4CAF50" BorderColor="Silver" BorderStyle="Groove" Font-Bold="True" Font-Size="Medium" Height="40px" Text="SignUp" Width="455px" OnClick="signupBtnId_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">Already have an account? <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" NavigateUrl="~/authentication/Login.aspx">Login</asp:HyperLink>
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
