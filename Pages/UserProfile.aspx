<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="OnlineAuctionSystem.Pages.UserProfile" %>

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

        .auto-style15 {
            width: 319px;
        }

        .auto-style16 {
            height: 300px;
        }

        .auto-style17 {
            margin-left: 0px;
        }

        .auto-style18 {
            width: 260px;
        }
    </style>
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
                                                <asp:Image ID="userImage" runat="server" Height="80%" Width="89%" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:FileUpload ID="profilePhotoFileUpload" runat="server" Enabled="False" Width="224px" />
                                                <asp:ImageButton ID="editPhotoImageButton0" runat="server" Height="25px" ImageUrl="~/FileUpload/images/DefaultImages/edit.png" OnClick="editProfilePicImageButton_Click" Width="25px" />
                                                <br />
                                                <asp:Label ID="messageLabel" runat="server" Text="Label" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="updateButton" runat="server" BackColor="#008CBA" BorderColor="Silver" BorderStyle="Groove" Font-Bold="True" Font-Size="Medium" ForeColor="White" Height="40px" Text="Update" Width="248px" OnClick="updateButton_Click" />
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
                                                <asp:ImageButton ID="editFirstNameImageButton" runat="server" Height="25px" ImageUrl="~/FileUpload/images/DefaultImages/edit.png" OnClick="editFirstNameImageButton_Click" Width="25px" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="firstnameTextBox" ErrorMessage="Please enter a firstname" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter a firstname</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="lastnameLabel" runat="server" Font-Bold="True" Font-Size="Medium" Text="LastName"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="lastnameTextBox" runat="server" Height="30px" Width="245px" ReadOnly="True"></asp:TextBox>
                                                <asp:ImageButton ID="editLastNameImageButton" runat="server" Height="25px" ImageUrl="~/FileUpload/images/DefaultImages/edit.png" OnClick="editLastNameImageButton_Click" Width="25px" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lastnameTextBox" ErrorMessage="Please enter a lastname" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter a lastname</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="Agelbl" runat="server" Font-Bold="True" Font-Size="Medium" Text="Age"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="ageTextBox" runat="server" Height="30px" Width="245px" TextMode="Number" ReadOnly="True"></asp:TextBox>
                                                <asp:ImageButton ID="editAgeImageButton" runat="server" Height="25px" ImageUrl="~/FileUpload/images/DefaultImages/edit.png" OnClick="editAgeImageButton_Click" Width="25px" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ageTextBox" ErrorMessage="Please enter a age" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter a age</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="ageTextBox" Display="Dynamic" ErrorMessage="RangeValidator" Font-Bold="True" ForeColor="Red" MaximumValue="95" MinimumValue="18" SetFocusOnError="True">Age must be greater than 18</asp:RangeValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="usernameId0" runat="server" Font-Bold="True" Font-Size="Medium" Text="Email"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="emailTextBox" runat="server" Height="30px" Width="245px" ReadOnly="True"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="emailTextBox" ErrorMessage="Please enter a email" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter a email</asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="Please enter valid email" Font-Bold="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
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
                                                <asp:ImageButton ID="editGenderImageButton" runat="server" Height="25px" ImageUrl="~/FileUpload/images/DefaultImages/edit.png" OnClick="editGenderImageButton_Click" Width="25px" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="genderSelectBox" Display="Dynamic" ErrorMessage="Please Select Gender" Font-Bold="True" ForeColor="Red" InitialValue="select" SetFocusOnError="True">Please select gender</asp:RequiredFieldValidator>
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
                                                            <asp:Button ID="updateDetailButton" runat="server" BackColor="#E7E7E7" BorderColor="Silver" BorderStyle="Groove" Font-Bold="True" Font-Size="Medium" ForeColor="Black" Height="40px" Text="Update Details" Width="211px" OnClick="updateButton0_Click" />
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="viewYourBids" runat="server" BackColor="#555555" BorderColor="Silver" BorderStyle="Groove" Font-Bold="True" Font-Size="Medium" Height="40px" Text="View Your Bids" Width="197px" ForeColor="White" CssClass="auto-style17" OnClick="viewYourBids_Click" />
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
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="currentActiveLabel" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Underline="False" ForeColor="#009900" Text="Current Active Biddings" Font-Overline="False" Visible="False"></asp:Label>
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
                                        <asp:Label ID="productName" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Base Price">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingValue" runat="server" Text='<%# Bind("basePrice") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Bidding Value">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingValue" runat="server" Text='<%# Bind("bidValue") %>'></asp:Label>
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
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style3">
                        <asp:Label ID="pastBiddingLabel" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Underline="False" ForeColor="#009900" Text="Past Biddings" Font-Overline="False" Visible="False"></asp:Label>
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
                                        <asp:Image ID="productImage" ImageUrl='<%# Eval("Image") %>' runat="server" Width="100" Height="100" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product Name">
                                    <ItemTemplate>
                                        <asp:Label ID="productName" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Base Price">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingValue" runat="server" Text='<%# Bind("basePrice") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Bidding Value">
                                    <ItemTemplate>
                                        <asp:Label ID="biddingValue" runat="server" Text='<%# Bind("bidValue") %>'></asp:Label>
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
