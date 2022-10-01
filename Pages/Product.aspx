<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="OnlineAuctionSystem.Pages.Product" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 20px;
        }

        .auto-style3 {
            margin-left: 0px;
        }

        .auto-style4 {
            width: 819px;
        }

        .auto-style5 {
            width: 253px;
        }

        .auto-style6 {
            width: 253px;
            height: 45px;
        }

        .auto-style7 {
            height: 45px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <table cellpadding="2" class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style4">
                                <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" ForeColor="Blue" Text="Product Details"></asp:Label>
                            </td>
                            <td>
                                <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" ImageUrl="~/FileUpload/images/DefaultImages/home.png" PostBackUrl="~/Default.aspx" Width="60px" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <center><asp:Label ID="productOwnerLabel" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Orange" Text="Your Product" Visible="False"></asp:Label></center>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:GridView ID="ProductBiddingGridView" runat="server" OnRowCommand="buttonClick_RowCommand" AutoGenerateColumns="False"
                        CellPadding="3" DataKeyNames="id" CssClass="auto-style3" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
                        <Columns>
                            <asp:TemplateField HeaderText="Image">
                                <ItemTemplate>
                                    <asp:Image ID="productImage" ImageUrl='<%# Eval("image") %>' runat="server" Width="100" Height="100" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Product Name">
                                <ItemTemplate>
                                    <asp:Label ID="productName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description">
                                <ItemTemplate>
                                    <asp:Label ID="productDescription" runat="server" Text='<%# Bind("description") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Base Price">
                                <ItemTemplate>
                                    <asp:Label ID="productbaseprice" runat="server" Text='<%# Bind("baseprice") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start Date">
                                <ItemTemplate>
                                    <asp:Label ID="FutureLabel2" runat="server" Text='<%# Bind("startingdate","{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="75px" />
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
                                <ControlStyle Width="75px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="End Time">
                                <ItemTemplate>
                                    <asp:Label ID="FutureLabel5" runat="server" Text='<%# Bind("endingtime") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Owner">
                                <ItemTemplate>
                                    <asp:Button ID="viewOwnerDetailsButton" runat="server" Text="Owner" CommandName="viewOwnerDetails" CommandArgument='<%# Bind("userid") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#000066" />
                        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                        <RowStyle ForeColor="#000066" />
                        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#007DBB" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#00547E" />
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <hr />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Underline="False" ForeColor="#009900" Text="Current Biddings" Font-Overline="False"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <table class="auto-style1" id="bidValueTable">
                        <tr>
                            <td class="auto-style6">
                                <asp:Label ID="ChangeBidLabel" runat="server" Font-Bold="True" Font-Size="Large" Text="Change Your Bid Value"></asp:Label>
                                &nbsp;
                            </td>
                            <td class="auto-style7">
                                <asp:TextBox ID="changeBidTextBox" runat="server" BackColor="LightGray" Enabled="False" Font-Bold="True" Font-Size="Large" Height="30px" TextMode="Number" Width="300px">0</asp:TextBox>
                                <asp:ImageButton ID="editBidValueImageButton" runat="server" Height="25px" ImageUrl="~/FileUpload/images/DefaultImages/edit.png" OnClick="editBidValueImageButton_Click" Width="25px" />
                                <br />
                                <asp:Label ID="errorMessageBidValueLabel" runat="server" Font-Bold="True" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td>
                                <asp:Button ID="updateBidValueButton" runat="server" BackColor="LightBlue" Font-Bold="True" Font-Size="Medium" Height="35px" Text="Update" Width="150px" OnClick="updateBidValueButton_Click" Enabled="False" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:GridView ID="BiddingGridView" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Bidder Name">
                                <ItemTemplate>
                                    <asp:Label ID="bidderName" runat="server" Text='<%# Bind("firstname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount">
                                <ItemTemplate>
                                    <asp:Label ID="biddingValue" runat="server" Text='<%# Bind("bidvalue") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date">
                                <ItemTemplate>
                                    <asp:Label ID="biddingDate" runat="server" Text='<%# Bind("biddate","{0:d}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Time">
                                <ItemTemplate>
                                    <asp:Label ID="biddingTime" runat="server" Text='<%# Bind("bidtime","{0:t}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>

    </form>
</body>
</html>
