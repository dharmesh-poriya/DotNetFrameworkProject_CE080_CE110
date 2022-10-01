<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="OnlineAuctionSystem.Pages.AddProduct" %>

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
        .auto-style4 {
            width: 87px;
        }
        .auto-style6 {
            width: 719px;
        }
        .auto-style11 {
            width: 105%;
            margin-left: 0px;
        }
        .auto-style10 {
            width: 181px;
        }
        .auto-style14 {
            width: 427px;
        }
        .auto-style15 {
            width: 138px;
        }
        .auto-style16 {
            width: 116px;
        }
        .auto-style17 {
            margin-left: 31px;
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
                                <td class="auto-style15">
                                    <asp:HyperLink ID="HyperLink1" runat="server" CssClass="auto-style17" Height="50px" ImageHeight="50px" ImageUrl="~/FileUpload/images/DefaultImages/home.png" ImageWidth="70px" NavigateUrl="~/Default.aspx" Width="70px">HyperLink</asp:HyperLink>
                                </td>
                                <td class="auto-style16">&nbsp;</td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" ForeColor="Gray" Text="Add Product"></asp:Label>
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
                                                <asp:Label ID="imageId" runat="server" Font-Bold="True" Font-Size="Medium" Text="Product Image"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:FileUpload ID="productImageFileUpload" runat="server" BackColor="White" ForeColor="Blue" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="productImageFileUpload" ErrorMessage="RequiredFieldValidator" Font-Bold="True" ForeColor="Red" Display="Dynamic" SetFocusOnError="True">Please select file</asp:RequiredFieldValidator>
                                                <br />
                                                <asp:Label ID="messageLabel" runat="server" Text="Label" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="lastnameLabel0" runat="server" Font-Bold="True" Font-Size="Medium" Text="Product Name"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="productNameTextBox" runat="server" Height="30px" Width="245px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="productNameTextBox" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter product name</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="lastnameLabel" runat="server" Font-Bold="True" Font-Size="Medium" Text="Description"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="productDescriptionTextBox" runat="server" Height="30px" Width="245px"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="productDescriptionTextBox" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter description</asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="basepriceLbl" runat="server" Font-Bold="True" Font-Size="Medium" Text="Base Price"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <asp:TextBox ID="basePriceTextBox" runat="server" Height="30px" Width="245px" TextMode="Number"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="basePriceTextBox" ErrorMessage="Please enter a base price" Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Display="Dynamic">Please enter a base price</asp:RequiredFieldValidator>
                                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="basePriceTextBox" Display="Dynamic" ErrorMessage="RangeValidator" Font-Bold="True" ForeColor="Red" MaximumValue="1000000" MinimumValue="1" SetFocusOnError="True" Type="Integer">base price not be 0</asp:RangeValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="startdateLbl" runat="server" Font-Bold="True" Font-Size="Medium" Text="Starting Date-Time"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <input type="date" runat="server" id="startDate" value="" name="startDateName" required="required" autofocus="autofocus"/>
                                                <input type="time" runat="server" id="startTime" value="" name="startTimeName" required="required" autofocus="autofocus"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style10">
                                                <asp:Label ID="gender" runat="server" Font-Bold="True" Font-Size="Medium" Text="Ending Date-Time"></asp:Label>
                                            </td>
                                            <td class="auto-style14">
                                                <input type="date" runat="server" id="endDate" value="" name="endDateName" required="required" autofocus="autofocus"/>
                                                <input type="time" runat="server" id="endTime" value="" name="endTimeName" required="required" autofocus="autofocus"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Button ID="addProductButton" runat="server" BackColor="#4CAF50" BorderColor="Silver" BorderStyle="Groove" Font-Bold="True" Font-Size="Medium" Height="40px" Text="Add Product" Width="455px" OnClick="addProductButton_Click" />
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>    

    <script>
        
        /*var toCheck = Date.now();
        var msToCheck = toCheck.getTime();
        var msNow = Date.now();*/
        $("#startDate").change(function () {
            var startDate = document.getElementById("startDate").value;
            /*console.log(startDate);*/
            let currentDate = new Date().toJSON().slice(0, 10);
            
            if ((Date.parse(currentDate) >= Date.parse(startDate))) {
                alert("start date must be greater than Current date");
                document.getElementById("startDate").value = "";
            }
        });

        $("#endDate").change(function () {
            /*console.log("hello!!");*/
            var startDate = document.getElementById("startDate").value;
            var endDate = document.getElementById("endDate").value;

            if ((Date.parse(endDate) < Date.parse(startDate))) {
                alert("End date should be greater than Start date");
                document.getElementById("endDate").value = "";
            }
        });
    </script>
</body>
</html>
