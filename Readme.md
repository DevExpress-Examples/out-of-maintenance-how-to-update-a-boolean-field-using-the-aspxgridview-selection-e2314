<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128543225/13.1.4%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E2314)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [MyObject.cs](./CS/WebSite/App_Code/MyObject.cs) (VB: [MyObject.vb](./VB/WebSite/App_Code/MyObject.vb))
* [XpoHelper.cs](./CS/WebSite/App_Code/XpoHelper.cs) (VB: [XpoHelper.vb](./VB/WebSite/App_Code/XpoHelper.vb))
* [Default.aspx](./CS/WebSite/Default.aspx) (VB: [Default.aspx](./VB/WebSite/Default.aspx))
* [Default.aspx.cs](./CS/WebSite/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/WebSite/Default.aspx.vb))
<!-- default file list end -->
# How to update a Boolean field using the ASPxGridView selection
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/e2314/)**
<!-- run online end -->


<p>The example demonstrates how to bind a Boolean field with the ASPxGridView selection.</p><p>The complex OnSelectionChanged event is used to prevent the grid from sending two simultaneous callbacks when the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewASPxGridViewBehaviorSettings_AllowMultiSelectiontopic">ASPxGridViewBehaviorSettings.AllowMultiSelection</a> property is used. There are two callbacks in this case:<br />
1. Deselect all rows;<br />
2. Select the single row.</p><p><strong>See Also:</strong><br />
<a href="https://www.devexpress.com/Support/Center/p/E1405">Instant editing of boolean field value using two columns</a><br />
<a href="https://www.devexpress.com/Support/Center/p/E2313">How to update a Boolean field using the ASPxCheckBox in a DataItem template</a></p>

<br/>


