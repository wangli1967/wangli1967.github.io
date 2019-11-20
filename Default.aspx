

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" CodeFile="Default.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Import Namespace="System.Threading" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Guides</title>
</head>
<body>
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="True"
            EnableScriptLocalization="True" ID="ScriptManager1" AllowCustomErrorsRedirect="True" />

        <div style="font-family:'Times New Roman', Times, serif; font-size:15pt">&nbsp;Please have us know how you would like to search the guides</div>
        <table>
            <tr>
                <td style="height: 20px; width: 30px"></td>
            </tr>
        </table>
        <div>
            <table style="background-color:aliceblue; padding:10px 10px 10px 10px; border-color:gainsboro; border-style:ridge; border-radius:10px" >
                <tr>
                    <td>

                        <asp:Label ID="lbSiteID" runat="server" Text="Site ID" Height="24px" Width="120px"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        
                        <%-- Changed to a dropdown list if the data are retrived from a database--%>
                        <asp:TextBox ID="txtSiteID" runat="server" AutoPostBack="true" Width="300px" ValidationGroup="Guides" ></asp:TextBox>
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender5" runat="server"
                            FilterType="Numbers" TargetControlID="txtSiteID">
                        </ajaxToolkit:FilteredTextBoxExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtSiteID" ValidationGroup="Guides" ErrorMessage="Please Enter a Site ID." runat="Server" Font-Size="10pt">
                        </asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbKey" runat="server" Text="Key" Height="24px" Width="120px" OnLoad="lbKey_OnLoad"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    
                        <asp:TextBox ID="txtKey" runat="server" AutoPostBack="true" Width="300px" ValidationGroup="Guides"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtKey" ValidationGroup="Guides" ErrorMessage="Please enter a Key" runat="Server">
                        </asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbSortBy" runat="server" Text="Sort By" Height="24px" Width="120px"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="dwlSortBy" runat="server" Width="300px" AutoPostBack="True" OnTextChanged="dwlSortBy_OnTextChanged">
                            <asp:ListItem Text="Select One" Value="Select One"></asp:ListItem>
                            <asp:ListItem Value="name" Enabled="true" Text="Name - Guide Name"></asp:ListItem>
                            <asp:ListItem Value="count" Enabled="true" Text="Count Hit - Guide  hits since the beginning of the year "></asp:ListItem>
                            <asp:ListItem Value="publish" Enabled="true" Text="Published - Published"></asp:ListItem>
                            <asp:ListItem Value="relevance" Enabled="true" Text="Relevance - Full-text Index"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="updatepnlSortDirection" runat="server" ChildrenAsTriggers="True" UpdateMode="Conditional" RenderMode="Inline" Visible="True">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="dwlSortBy" EventName="TextChanged" />
                            </Triggers>
                            <ContentTemplate>
                                <asp:Panel ID="pnlSortDirection" runat="server" Visible="False">

                                    <asp:Label ID="lbSortDirection" runat="server" Text="Sort Direction" Height="24px" Width="120px"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                
                                    <asp:DropDownList ID="dwlSortDirection" runat="server" Width="300px" AutoPostBack="True">
                                        <asp:ListItem Text="Select One" Value="Select One"></asp:ListItem>
                                        <asp:ListItem Value="1" Enabled="true" Text="Ascending"></asp:ListItem>
                                        <asp:ListItem Value="2" Enabled="true" Text="Descending"></asp:ListItem>
                                    </asp:DropDownList>

                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbCountlist" runat="server" Text="Account IDs" Height="24px" Width="120px"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    
                        <asp:TextBox ID="txtCountlist" runat="server" AutoPostBack="true" Width="300px"></asp:TextBox>

                        <ajaxToolkit:TextBoxWatermarkExtender ID="ajaxCountlist_Watermark" runat="server"
                            TargetControlID="txtCountlist" WatermarkText="Example: 1,2,3..." WatermarkCssClass="watermarked" />
                        <ajaxToolkit:FilteredTextBoxExtender ID="ajaxCountlist_FilteredText" runat="server"
                            FilterType="Custom, Numbers" TargetControlID="txtCountlist" ValidChars=",">
                        </ajaxToolkit:FilteredTextBoxExtender>

                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbGroupID" runat="server" Text="Group IDs" Height="24px" Width="120px"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                   
                        <asp:TextBox ID="txtGroupID" runat="server" AutoPostBack="true" Width="300px"></asp:TextBox>
                        <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender1" runat="server"
                            TargetControlID="txtGroupID" WatermarkText="Example: 1,2,3..." WatermarkCssClass="watermarked" />
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server"
                            FilterType="Custom, Numbers" TargetControlID="txtGroupID" ValidChars=",">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbSubjectID" runat="server" Text="Subject IDs" Height="24px" Width="120px"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                   
                        <asp:TextBox ID="txtSubjectID" runat="server" AutoPostBack="true" Width="300px" OnTextChanged="txtSubjectID_OnTextChanged"></asp:TextBox>
                        <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender2" runat="server"
                            TargetControlID="txtSubjectID" WatermarkText="Example: 1,2,3..." WatermarkCssClass="watermarked" />
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server"
                            FilterType="Custom, Numbers" TargetControlID="txtSubjectID" ValidChars=",">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="updatepanelSubjectLogic" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional" RenderMode="Inline" Visible="True">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="txtSubjectID" EventName="TextChanged" />
                            </Triggers>
                            <ContentTemplate>
                                <asp:Panel ID="pnlSubjectLogic" runat="server" Visible="False">
                                    <asp:Label ID="lbSubjectLogic" runat="server" Text="Subject Logic" Height="24px" Width="120px"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                   
                                <asp:DropDownList ID="dwlSubjectLogic" runat="server" Width="300px" AutoPostBack="True">
                                    <asp:ListItem Text="Select One" Value="Select One"></asp:ListItem>
                                    <asp:ListItem Value="1" Enabled="true" Text="And"></asp:ListItem>
                                    <asp:ListItem Value="2" Enabled="true" Text="Or"></asp:ListItem>
                                </asp:DropDownList>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbTagName" runat="server" Text="Tag Names" Height="24px" Width="120px"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;                   
                        <asp:TextBox ID="txtTagName" runat="server" AutoPostBack="True" Width="300px" OnTextChanged="txtTagName_OnTextChanged"></asp:TextBox>
                        <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender3" runat="server"
                            TargetControlID="txtTagName" WatermarkText="Example: name1,name2,name3..." WatermarkCssClass="watermarked" />
                        <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server"
                            FilterType="Custom,LowercaseLetters,Numbers" TargetControlID="txtTagName" ValidChars=",">
                        </ajaxToolkit:FilteredTextBoxExtender>
                    </td>
                </tr>
                <tr style="width: 500px">
                    <td>
                        <asp:UpdatePanel ID="UpDatePnlTagNameMatch" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional" RenderMode="Inline" Visible="True">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="txtTagName" EventName="TextChanged" />
                            </Triggers>
                            <ContentTemplate>
                                <asp:Panel ID="pnlTagNameMatch" runat="server" Visible="False">

                                    <asp:Label ID="lbTagNameMatch" runat="server" Text="Tag Name Match" Height="24px" Width="120px"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                
                                    <asp:DropDownList ID="dwlTagNameMatch" runat="server" Width="300px" AutoPostBack="True">
                                        <asp:ListItem Text="Select One" Value="Select One"></asp:ListItem>
                                        <asp:ListItem Value="1" Enabled="true" Text="Exact Match"></asp:ListItem>
                                        <asp:ListItem Value="2" Enabled="true" Text="Contains"></asp:ListItem>
                                    </asp:DropDownList>

                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="updatepanelStatus" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional" RenderMode="Inline" Visible="True">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="dwlSortBy" EventName="TextChanged" />
                            </Triggers>
                            <ContentTemplate>
                                <asp:Panel ID="pnlStatus" runat="server" Visible="False">

                                    <asp:Label ID="lbStatus" runat="server" Text="Status" Height="24px" Width="120px"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                               
                                    <asp:DropDownList ID="dwlStatus" runat="server" Width="300px" AutoPostBack="True">
                                        <asp:ListItem Text="Select One" Value="Select One"></asp:ListItem>
                                        <asp:ListItem Value="1" Enabled="true" Text="Unpublished"></asp:ListItem>
                                        <asp:ListItem Value="2" Enabled="true" Text="Published"></asp:ListItem>
                                        <asp:ListItem Value="3" Enabled="true" Text="Private"></asp:ListItem>
                                        <asp:ListItem Value="4" Enabled="true" Text="Submit for Review"></asp:ListItem>
                                    </asp:DropDownList>

                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbUpdateType" runat="server" Text="Update Type" Height="24px" Width="120px"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;  
                        <asp:DropDownList ID="dwlUpdateType" runat="server" Width="300px" AutoPostBack="True" OnTextChanged="dwlUpdateType_OnTextChanged">
                            <asp:ListItem Text="Select One" Value="Select One"></asp:ListItem>
                            <asp:ListItem Value="last" Enabled="true" Text="Last"></asp:ListItem>
                            <asp:ListItem Value="since" Enabled="true" Text="Since"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="updatepanelLastUpdate" runat="server" ChildrenAsTriggers="True" UpdateMode="Conditional" RenderMode="Inline" Visible="True">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="dwlUpdateType" EventName="TextChanged" />
                            </Triggers>
                            <ContentTemplate>
                                <asp:Panel ID="pnlLastUpdate" runat="server" Visible="false">
                                    <asp:Label ID="lbLastUpdateLast" runat="server" Text="Last Update" Height="24px" Width="120px"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;                               
                                    <asp:TextBox ID="txtLastUpdateLast" runat="server" AutoPostBack="true" Width="300px"></asp:TextBox>
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server"
                                        FilterType="Custom,Numbers" TargetControlID="txtLastUpdateLast" ValidChars="">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                    <asp:TextBox ID="txtLastUpdateSince" runat="server" AutoPostBack="true" Width="300px"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="defaultCalendarExtender" runat="server" TargetControlID="txtLastUpdateSince" />
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbSearch_Terms" runat="server" Text="Search Terms" Height="24px" Width="120px"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;   
                        <asp:TextBox ID="txtSearchTerms" runat="server" AutoPostBack="true" Width="300px"></asp:TextBox>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional" RenderMode="Inline" Visible="True">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />                              
                            </Triggers>
                            <ContentTemplate>
                                <asp:Label ID="lbError" runat="server" Text="Please Enter a Search Term." AutoPostBack="true" Width="250px" Visible="false" ForeColor="Red" Font-Size="10pt"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="updataepanelSearchMatch" runat="server" ChildrenAsTriggers="True" UpdateMode="Conditional" RenderMode="Inline" Visible="True">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="dwlSortBy" EventName="TextChanged" />
                            </Triggers>
                            <ContentTemplate>
                                <asp:Panel ID="pnlSearchMatch" runat="server" Visible="false">
                                    <asp:Label ID="lbSearchMatch" runat="server" Text="Search Match" Height="24px" Width="120px"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;                               
                                    <asp:DropDownList ID="dwlSearchMatch" runat="server" Width="300px" AutoPostBack="True">
                                        <asp:ListItem Text="Select One" Value="Select One"></asp:ListItem>
                                        <asp:ListItem Value="1" Enabled="true" Text="Exact Match"></asp:ListItem>
                                        <asp:ListItem Value="2" Enabled="true" Text="Contains"></asp:ListItem>
                                    </asp:DropDownList>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lbGuideTypes" runat="server" Text="Guide Types" Height="24px" Width="120px"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;                               
                        <asp:DropDownList ID="dwlGuideTypes" runat="server" Width="300px" AutoPostBack="false">
                            <asp:ListItem Text="Select One" Value="Select One"></asp:ListItem>
                            <asp:ListItem Value="1" Enabled="true" Text="General"></asp:ListItem>
                            <asp:ListItem Value="2" Enabled="true" Text="Course"></asp:ListItem>
                            <asp:ListItem Value="3" Enabled="true" Text="Subject"></asp:ListItem>
                            <asp:ListItem Value="4" Enabled="true" Text="Topic"></asp:ListItem>
                            <asp:ListItem Value="5" Enabled="true" Text="Internal"></asp:ListItem>
                            <asp:ListItem Value="6" Enabled="true" Text="Template"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:UpdatePanel ID="UpdatePanel90" runat="server" ChildrenAsTriggers="True" UpdateMode="Conditional" RenderMode="Inline" Visible="True">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="dwlSortBy" EventName="TextChanged" />
                            </Triggers>
                            <ContentTemplate>
                                <asp:Panel ID="pnlMetaData" runat="server" Visible="false">
                                    <asp:Label ID="lbMetaData" runat="server" Text="Meta Data" Height="24px" Width="120px"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;                   
                                     <asp:TextBox ID="txtMetaData" runat="server" AutoPostBack="true" Width="300px"></asp:TextBox>
                                    <ajaxToolkit:TextBoxWatermarkExtender ID="TextBoxWatermarkExtender4" runat="server"
                                        TargetControlID="txtMetaData" WatermarkText="Example: metadata1, metadata2, metadata3..." WatermarkCssClass="watermarked" />
                                    <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender9" runat="server"
                                        FilterType="Custom,LowercaseLetters,UppercaseLetters,Numbers" TargetControlID="txtMetaData" ValidChars=",">
                                    </ajaxToolkit:FilteredTextBoxExtender>
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </td>
                </tr>
                <tr>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lbExpand" runat="server" Text="Expand" Height="24px" Width="120px"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:CheckBox ID="ckbOwner" runat="server" AutoPostBack="false" Text="Owner" Width="105px" />
                                    <asp:CheckBox ID="ckbGroup" runat="server" AutoPostBack="false" Text="Group" Width="105px" />
                                    <asp:CheckBox ID="ckbPages" runat="server" AutoPostBack="false" Text="Pages" Width="105px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="" Height="24px" Width="120px"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:CheckBox ID="ckbPagesBoxes" runat="server" AutoPostBack="false" Text="Pages.Boxes" Width="105px" />
                                    <asp:CheckBox ID="ckbSubjects" runat="server" AutoPostBack="false" Text="Subjects" Width="105px" />
                                    <asp:CheckBox ID="ckbTags" runat="server" AutoPostBack="false" Text="Tags" Width="105px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="" Height="24px" Width="120px"></asp:Label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                     <asp:CheckBox ID="ckbMetaData" runat="server" AutoPostBack="false" Text="Meta Data" Width="105px" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

            </table>
        </div>
       <%-- <asp:UpdatePanel ID="updatepnlTest" runat="server" ChildrenAsTriggers="False" UpdateMode="Conditional" RenderMode="Inline" Visible="True">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="txtSubjectID" EventName="TextChanged" />
            </Triggers>
            <ContentTemplate>
                <asp:Label ID="lbTest" runat="server" Visible="true" AutoPostBack="True" Width="1000px" BackColor="Yellow" Text="1234"> </asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>--%>

        <table style="height: 30px">
            <tr>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
        </table>
        <table style="width: 500px">
            <tr>
                <td style="text-align: center">
                    <asp:Button name="search" ID="btnSearch" Text="Search" runat="server" OnClick="btnSearch_OnClick" ValidationGroup="Guides" CausesValidation="true" Font-Bold="True" BackColor="Maroon" BorderStyle="Outset" BorderWidth="2px" Font-Size="Medium" ForeColor="White" Height="35px" Width="85px" Font-Names="Ms Reference Sans Serif" Font-Underline="False"></asp:Button>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
