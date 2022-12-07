using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Xpo;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {
    Session session = XpoHelper.GetNewSession();

    protected void Page_Init(object sender, EventArgs e) {
        xds.Session = session;
    }

    protected void cb_Callback(object source, DevExpress.Web.CallbackEventArgs e) {
        String[] p = e.Parameter.Split('|');

        Boolean active = Convert.ToBoolean(p[1]);

        // if e.isAllRecordsOnPage is true (perform batch update)
        if (p[0] == "null") {
            UnitOfWork uow = XpoHelper.GetNewUnitOfWork();
            XPCollection<MyObject> collection = new XPCollection<MyObject>(uow);

            foreach (MyObject obj in collection)
                obj.Active = active;

            uow.Save(collection);
            uow.CommitChanges();
        }
        else {
            MyObject obj = session.GetObjectByKey<MyObject>(Convert.ToInt32(p[0])); // get the record from the Session
            obj.Active = active;

            obj.Save();
        }
    }
    protected void grid_DataBound(object sender, EventArgs e) {
        ASPxGridView grid = sender as ASPxGridView;

        for (Int32 i = 0; i < grid.VisibleRowCount; i++)
            grid.Selection.SetSelection(i, Convert.ToBoolean(grid.GetRowValues(i, "Active")));
    }
}
