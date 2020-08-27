<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Xpo.v13.1.Web, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Xpo" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to update a Boolean field using the ASPxGridView selection</title>

    <script type="text/javascript">
        var all = false;
        var nextArgument = "";
        function OnSelectionChanged (s, e) {
            if (!e.isChangedOnServer) {
                var key = s.GetRowKey (e.visibleIndex);
                
                if (all)
                  nextArgument = key + '|' + e.isSelected;
                else
                  cb.PerformCallback(key + '|' + e.isSelected);            
                
                if (e.isAllRecordsOnPage)
                    all = true;                                
            }
        }
        
        function OnCallbackComplete (s, e) {
           if (all) {
               all = false;
               s.PerformCallback(nextArgument);
           }
           // the block below for the demo only
           else {
               grid1.Refresh();
               grid2.Refresh();
           }
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <b>AllowMultiSelection="true"</b>
            <dx:ASPxGridView ID="grid1" runat="server" AutoGenerateColumns="False" DataSourceID="xds"
                KeyFieldName="Oid" OnDataBound="grid_DataBound" EnableRowsCache="false" ClientInstanceName="grid1">
                <Columns>
                    <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="Oid" ReadOnly="True" VisibleIndex="1" SortOrder="Ascending"
                        SortIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsLoadingPanel Mode="Disabled" />
                <SettingsBehavior ProcessSelectionChangedOnServer="false" AllowMultiSelection="true" />
                <ClientSideEvents SelectionChanged="OnSelectionChanged" />
            </dx:ASPxGridView>
            <br />
            <br />
            <b>AllowMultiSelection="false"</b>
            <dx:ASPxGridView ID="grid2" runat="server" AutoGenerateColumns="False" DataSourceID="xds"
                KeyFieldName="Oid" OnDataBound="grid_DataBound" EnableRowsCache="false" ClientInstanceName="grid2">
                <Columns>
                    <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="Oid" ReadOnly="True" VisibleIndex="1" SortOrder="Ascending"
                        SortIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsLoadingPanel Mode="Disabled" />
                <SettingsBehavior ProcessSelectionChangedOnServer="false" AllowMultiSelection="false" />
                <ClientSideEvents SelectionChanged="OnSelectionChanged" />
            </dx:ASPxGridView>
        </div>
        <dx:XpoDataSource ID="xds" runat="server" TypeName="MyObject">
        </dx:XpoDataSource>
        <dx:ASPxCallback ID="cb" runat="server" ClientInstanceName="cb" OnCallback="cb_Callback">
            <ClientSideEvents CallbackComplete="OnCallbackComplete" />
        </dx:ASPxCallback>
    </form>
</body>
</html>
