Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Xpo
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private session As Session = XpoHelper.GetNewSession()

	Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs)
		xds.Session = session
	End Sub

	Protected Sub cb_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
		Dim p() As String = e.Parameter.Split("|"c)

		Dim active As Boolean = Convert.ToBoolean(p(1))

		' if e.isAllRecordsOnPage is true (perform batch update)
		If p(0) = "null" Then
			Dim uow As UnitOfWork = XpoHelper.GetNewUnitOfWork()
			Dim collection As XPCollection(Of MyObject) = New XPCollection(Of MyObject)(uow)

			For Each obj As MyObject In collection
				obj.Active = active
			Next obj

			uow.Save(collection)
			uow.CommitChanges()
		Else
			Dim obj As MyObject = session.GetObjectByKey(Of MyObject)(Convert.ToInt32(p(0))) ' get the record from the Session
			obj.Active = active

			obj.Save()
		End If
	End Sub
	Protected Sub grid_DataBound(ByVal sender As Object, ByVal e As EventArgs)
		Dim grid As ASPxGridView = TryCast(sender, ASPxGridView)

		For i As Int32 = 0 To grid.VisibleRowCount - 1
			grid.Selection.SetSelection(i, Convert.ToBoolean(grid.GetRowValues(i, "Active")))
		Next i
	End Sub
End Class
