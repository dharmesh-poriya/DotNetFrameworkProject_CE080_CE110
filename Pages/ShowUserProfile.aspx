<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowUserProfile.aspx.cs" Inherits="OnlineAuctionSystem.Pages.ShowUserProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 82px;
        }

        .auto-style3 {
            width: 1132px;
        }

        .auto-style12 {
            width: 286px;
        }

        .auto-style15 {
            width: 319px;
        }

        .auto-style16 {
            height: 300px;
        }

        .auto-style6 {
            width: 788px;
        }

        .auto-style11 {
            width: 105%;
            margin-left: 0px;
        }

        .auto-style10 {
            width: 156px;
        }

        .auto-style14 {
            width: 430px;
        }

        .auto-style18 {
            width: 100px;
        }
    
        .auto-style17 {
            margin-left: 0px;
        }

        </style>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <table cellpadding="2" class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <table cellpadding="3" cellspacing="3" class="auto-style1">
                            <tr>
                                <td>
                                    <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" ImageUrl="~/FileUpload/images/DefaultImages/home.png" PostBackUrl="~/Default.aspx" Width="60px" />
                                </td>
                                <td class="auto-style12">
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" ForeColor="Blue" Text="Profile"></asp:Label>
                                </td>
                                <td>&nbsp;</td>
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
                                <td class="auto-style15">
                                    <table cellpadding="2" class="auto-style1">
                                        <tr>
                                            <td class="auto-style16">
                                                <asp:Image ID="userImage" runat="server" Height="80%" Width="99%" />
                                            </td>
                                        </tr>
                                        </table>
                                </td>
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
                                                <asp:TextBox ID="firstnameTextBox" runat="server" Height="30px" Width="245px" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="lastnameLabel" runat="server" Font-Bold="True" Font-Size="Medium" Text="LastName"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="lastnameTextBox" runat="server" Height="30px" Width="245px" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="Agelbl" runat="server" Font-Bold="True" Font-Size="Medium" Text="Age"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="ageTextBox" runat="server" Height="30px" Width="245px" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="usernameId0" runat="server" Font-Bold="True" Font-Size="Medium" Text="Email"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="emailTextBox" runat="server" Height="30px" Width="245px" ReadOnly="True"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="gender" runat="server" Font-Bold="True" Font-Size="Medium" Text="Gender"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:DropDownList ID="genderSelectBox" runat="server" Height="30px" Width="253px" Font-Size="Medium" Enabled="False">
                                                    <asp:ListItem Selected="True">select</asp:ListItem>
                                                    <asp:ListItem>Male</asp:ListItem>
                                                    <asp:ListItem>Female</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="status" runat="server" Font-Bold="True" Font-Size="Medium" Text="Status"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="statusTextBox" runat="server" Height="30px" Width="245px" ReadOnly="True" Enabled="False"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="joiningDate" runat="server" Font-Bold="True" Font-Size="Medium" Text="Registered Date"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="registerDateTextBox" runat="server" Height="30px" Width="245px" ReadOnly="True" Enabled="False"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <table cellpadding="2" class="auto-style1">
                                                    <tr>
                                                        <td class="auto-style18">
                                                            &nbsp;</td>
                                                        <td>
                                                            <asp:Button ID="viewBids" runat="server" BackColor="#555555" BorderColor="Silver" BorderStyle="Groove" Font-Bold="True" Font-Size="Medium" Height="40px" Text="View Bidding Data" Width="321px" ForeColor="White" CssClass="auto-style17" OnClick="viewBids_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
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
                    <td colspan="3">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="productLabel" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Underline="False" ForeColor="#009900" Text="Products" Font-Overline="False" Visible="False"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        
                        <asp:GridView ID="ProductsGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" Visible="False">
                            <Columns>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="productImage" ImageUrl='<%# Eval("Image") %>' runat="server" Width="100" Height="100" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product Name">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="productNameHyperLink" runat="server" NavigateUrl='<%# string.Concat("~/Pages/Product.aspx?id=","",Eval("Id")) %>' ForeColor="DarkBlue" Text='<%# Bind("name") %>'>HyperLink</asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Base Price">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingValue" runat="server" Text='<%# Bind("basePrice") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="starting date">
                                    <ItemTemplate>
                                        <asp:Label ID="startingdate" runat="server" Text='<%# Bind("startingdate","{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ending date">
                                    <ItemTemplate>
                                        <asp:Label ID="endingdate" runat="server" Text='<%# Bind("endingdate","{0:d}") %>'></asp:Label>
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
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="currentActiveLabel" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Underline="False" ForeColor="Purple" Text="Current Active Biddings" Font-Overline="False" Visible="False"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:GridView ID="CurrentActiveBidGridView" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Vertical" ForeColor="Black" Visible="False">
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <Columns>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="productImage" ImageUrl='<%# Eval("Image") %>' runat="server" Width="100" Height="100" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product Name">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="productNameHyperLink" runat="server" NavigateUrl='<%# Bind("Id","~/Pages/Product.aspx?id={0}") %>' ForeColor="DarkBlue" Text='<%# Bind("ProductName") %>'></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Base Price">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingValue" runat="server" Text='<%# Bind("basePrice") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Bidding Value">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingValue0" runat="server" Text='<%# Bind("bidValue") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingDate" runat="server" Text='<%# Bind("Date","{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Time">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingTime" runat="server" Text='<%# Bind("Time") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                        </asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="3">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="pastBiddingLabel" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Underline="False" ForeColor="DarkRed" Text="Past Biddings" Font-Overline="False" Visible="False"></asp:Label>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:GridView ID="PastBiddingGridView" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False" Visible="False">
                            <AlternatingRowStyle BackColor="#F7F7F7" />
                            <Columns>
                                <asp:TemplateField HeaderText="Image">
                                    <ItemTemplate>
                                        <asp:Image ID="productImage0" ImageUrl='<%# Eval("Image") %>' runat="server" Width="100" Height="100" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product Name">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="productNameHyperLink" runat="server" NavigateUrl='<%# Bind("Id","~/Pages/Product.aspx?id={0}") %>' ForeColor="DarkBlue" Text='<%# Bind("ProductName") %>'></asp:HyperLink>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Base Price">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingValue1" runat="server" Text='<%# Bind("basePrice") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Bidding Value">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingValue2" runat="server" Text='<%# Bind("bidValue") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingDate0" runat="server" Text='<%# Bind("Date","{0:d}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Time">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingTime0" runat="server" Text='<%# Bind("Time") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                            <SortedAscendingCellStyle BackColor="#F4F4FD" />
                            <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                            <SortedDescendingCellStyle BackColor="#D8D8F0" />
                            <SortedDescendingHeaderStyle BackColor="#3E3277" />
                        </asp:GridView>
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
