<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineAuctionSystem.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 16px;
        }
        .auto-style3 {
            width: 1201px;
        }
        .auto-style4 {
            width: 39px;
        }
        .auto-style5 {
            width: 59px;
        }
        .auto-style6 {
            width: 118px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="2" cellspacing="3" class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <table class="auto-style1">
                            <tr>
                                <td>
                                    <asp:Label ID="webName" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Blue" Text="OnlineAuctionSystem"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td class="auto-style5">
                        <asp:ImageButton ID="profileImageBtn" runat="server" BorderColor="Blue" Height="46px" ImageUrl="~/images/default.png" Width="61px" OnClick="profileImageBtn_Click" />
                                </td>
                                <td class="auto-style4">
                        <asp:Button ID="logoutBtn" runat="server" Text="LogOut" BackColor="#E7E7E7" BorderColor="Silver" BorderStyle="Groove" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Height="48px" Width="131px" OnClick="logoutBtn_Click" />
                                </td>
                                <td class="auto-style6">
                        <asp:Button ID="loginBtn" runat="server" Text="Login" BackColor="#4CAF50" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="48px" OnClick="loginBtn_Click" Width="131px" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <hr />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Button ID="addProductButton" runat="server" Text="AddProduct" BackColor="Orange" BorderColor="Black" BorderStyle="Groove" BorderWidth="2px" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Height="48px" OnClick="addProductButton_Click" Width="150px" />
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
