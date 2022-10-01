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

        .auto-style7 {
            width: 16px;
            height: 29px;
        }

        .auto-style8 {
            width: 1201px;
            height: 29px;
        }

        .auto-style9 {
            height: 29px;
        }

        .auto-style10 {
            width: 104px;
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
                                    <asp:ImageButton ID="profileImageBtn" runat="server" BorderColor="Blue" Height="46px" ImageUrl="~/FileUpload/images/DefaultImages/default.png" Width="61px" OnClick="profileImageBtn_Click" />
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
                    <td class="auto-style7"></td>
                    <td class="auto-style8">
                        <table cellpadding="2" class="auto-style1">
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td>
                                    <asp:Label ID="webName0" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Green" Text="Currently Active Bidding"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td>
                                    <%--OnRowCommand="ActiveBidding_RowCommand"--%>
                                    <asp:GridView ID="ActiveBiddingGridView" runat="server" AutoGenerateColumns="False"
                                        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"
                                        CellPadding="4" DataKeyNames="id">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Image">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image1" ImageUrl='<%# Bind("image") %>' runat="server" Width="70" Height="70" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Product Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Start Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("startingdate","{0:d}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Start Time">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("startingtime") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="End Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("endingdate","{0:d}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="End Time">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("endingtime") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="View Details">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Bind("Id", "~/Pages/Product.aspx?Id={0}") %>'>View details</asp:HyperLink>
                                                    <%--<asp:Button ID="viewDetailsButton" runat="server" Text="View Details" CommandName="viewDetails" CommandArgument='<%# Bind("Id") %>' />--%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                        <RowStyle BackColor="White" ForeColor="#003399" />
                                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                        <SortedDescendingHeaderStyle BackColor="#002876" />
                                    </asp:GridView>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td>
                                    <asp:Label ID="webName1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="Green" Text="Featured Bidding"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">&nbsp;</td>
                                <td>
                                    <%--OnRowCommand="FutureBidding_RowCommand"--%> 
                                    <asp:GridView ID="FutureBiddingGridView" runat="server" AutoGenerateColumns="False"
                                        BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px"
                                        CellPadding="4" DataKeyNames="id">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Image">
                                                <ItemTemplate>
                                                    <asp:Image ID="Image2" ImageUrl='<%# Bind("image") %>' runat="server" Width="70" Height="70" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Product Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="FutureLabel1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Start Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="FutureLabel2" runat="server" Text='<%# Bind("startingdate","{0:d}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Start Time">
                                                <ItemTemplate>
                                                    <asp:Label ID="FutureLabel3" runat="server" Text='<%# Bind("startingtime") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="End Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="FutureLabel4" runat="server" Text='<%# Bind("endingdate","{0:d}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="End Time">
                                                <ItemTemplate>
                                                    <asp:Label ID="FutureLabel5" runat="server" Text='<%# Bind("endingtime") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="View Details">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="FutureHyperLink" runat="server" NavigateUrl='<%# Bind("Id", "~/Pages/Product.aspx?Id={0}") %>'>View details</asp:HyperLink>
                                                    <%--<asp:Button ID="viewDetailsButton" runat="server" Text="View Details" CommandName="viewDetails" CommandArgument='<%# Bind("Id") %>' />--%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                        <RowStyle BackColor="White" ForeColor="#003399" />
                                        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                        <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                        <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                        <SortedDescendingHeaderStyle BackColor="#002876" />
                                    </asp:GridView>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td class="auto-style9"></td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
