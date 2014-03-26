using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class brdhcControls_dashboardMenu : System.Web.UI.UserControl
{
    clsCommon objCommon = new clsCommon();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            populateMenuItem();
        }
      //  MenuItem
    }

    private void populateMenuItem()
    {
        MembershipUser user = Membership.GetUser();
        if (user != null)
        {
            //DataTable menuData = (DataTable)objCommon.getMenusByRoleName("administration");
            string[] roles = Roles.GetRolesForUser(user.UserName.ToString());
            DataTable menuData = (DataTable)objCommon.getMenusByRoleName(roles[0].ToString());
            AddTopMenuItems(menuData);
        }
        else
        {
            Response.Redirect("../Login.aspx");
        }
    }
    /// Filter the data to get only the rows that have a
    /// null ParentID (This will come on the top-level menu items)

    private void AddTopMenuItems(DataTable menuData)
    {
        DataView view = new DataView(menuData);
        view.RowFilter = "ParentId = 0";
        foreach (DataRowView row in view)
        {
            MenuItem newMenuItem = new MenuItem(row["MenuTitle"].ToString(), row["MenuId"].ToString());
            newMenuItem.NavigateUrl = ResolveUrl(row["MenuUrl"].ToString());
            //if (row["MenuTitle"].ToString().ToLower() == "profile")
            //    newMenuItem.Selected = true;
            //else
            //    newMenuItem.Selected = false;
            mnuLeft.Items.Add(newMenuItem);
            AddChildMenuItems(menuData, newMenuItem);
        }

    }
    //This code is used to recursively add child menu items by filtering by ParentID

    private void AddChildMenuItems(DataTable menuData, MenuItem parentMenuItem)
    {
        DataView view = new DataView(menuData);
        view.RowFilter = "ParentId=" + parentMenuItem.Value;
        foreach (DataRowView row in view)
        {
            MenuItem newMenuItem = new MenuItem(row["MenuTitle"].ToString(), row["MenuId"].ToString());
            parentMenuItem.ChildItems.Add(newMenuItem);
            AddChildMenuItems(menuData, newMenuItem);
        }
    }

}