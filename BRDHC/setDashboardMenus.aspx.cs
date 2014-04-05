using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_setDashboradMenus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void subCommand(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "doInsert":
                subInsert(e);
                break;
            case "doUpdate":
                subUpdate(e);
                break;
            case "doDelete":
                subdelete(e);
                break;
        }
    }
    protected void subUpdate(RepeaterCommandEventArgs e)
    {
        Label lbl_idE = (Label)e.Item.FindControl("lbl_idE");
        TextBox txt_Title = (TextBox)e.Item.FindControl("txt_Title");
        TextBox txt_MenuUrl = (TextBox)e.Item.FindControl("txt_MenuUrl");
        TextBox txt_RoelName = (TextBox)e.Item.FindControl("txt_RoelName");
        TextBox txt_ParentId = (TextBox)e.Item.FindControl("txt_ParentId");
        CheckBox chk_status = (CheckBox)e.Item.FindControl("chk_status");

        sds_main.UpdateParameters["MenuTitle"].DefaultValue = txt_Title.Text;
        sds_main.UpdateParameters["MenuUrl"].DefaultValue = txt_MenuUrl.Text;
        sds_main.UpdateParameters["RoleName"].DefaultValue = txt_RoelName.Text;
        sds_main.UpdateParameters["Status"].DefaultValue = chk_status.Checked.ToString();
        sds_main.UpdateParameters["MenuId"].DefaultValue = lbl_idE.Text;
        sds_main.UpdateParameters["ParentId"].DefaultValue = txt_ParentId.Text;

        sds_main.Update();

    }

    protected void subdelete(RepeaterCommandEventArgs e)
    {
        Label lbl_idE = (Label)e.Item.FindControl("lbl_idE");
        sds_main.DeleteParameters["MenuId"].DefaultValue = lbl_idE.Text;
        sds_main.Delete();

    }

    protected void subInsert(RepeaterCommandEventArgs e)
    {
        TextBox txt_menuTitlei = (TextBox)e.Item.FindControl("txt_menuTitlei");
        TextBox txt_MenuUrli = (TextBox)e.Item.FindControl("txt_MenuUrli");
        TextBox txt_ParentIdi = (TextBox)e.Item.FindControl("txt_ParentIdi");
        DropDownList ddlroles = (DropDownList)e.Item.FindControl("ddlroles");
        CheckBox chkStatus = (CheckBox)e.Item.FindControl("chkStatus");

        sds_main.InsertParameters["MenuTitle"].DefaultValue = txt_menuTitlei.Text;
        sds_main.InsertParameters["MenuUrl"].DefaultValue = txt_MenuUrli.Text;
        sds_main.InsertParameters["RoleName"].DefaultValue = ddlroles.SelectedItem.Text;
        sds_main.InsertParameters["ParentId"].DefaultValue = txt_ParentIdi.Text;
        sds_main.InsertParameters["Status"].DefaultValue = chkStatus.Checked.ToString();

        sds_main.Insert();

    }

    protected void rpt_main_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Footer)
        {
            DropDownList ddl = (DropDownList)e.Item.FindControl("ddlroles");
            if (ddl != null)
            {
                ddl.DataSource = Roles.GetAllRoles();
                ddl.DataBind();
                ddl.Items.Insert(0, "Administration");
            }
        }
    }
}