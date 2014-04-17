using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Patients_find_a_doctor : System.Web.UI.Page
{

    //objects of class clsCommon and clsUserDetails
    clsUserDetails objUDet = new clsUserDetails();
    clsCommon objCommon = new clsCommon();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) //If page is not post back
        {   
            //binding the dropdownlist with doctornames
            //From all the roles in hospital we are only binding the doctors
            ddl_name.DataSource = objCommon.getUsersByRole("doctors");
            ddl_name.DataTextField = "FullName";
            ddl_name.DataValueField = "UserId";
            ddl_name.DataBind();
            ddl_name.Items.Insert(0, new ListItem("--- Select doctor by name---"));
            ddl_name.SelectedIndex = 0;

            //binding the dropdownlist with doctor speciality
            ddl_speciality.DataSource = objUDet.getDoctorsBySpeciality();
            ddl_speciality.DataTextField = "Speciality";
            ddl_speciality.DataValueField = "SpecialityId";
            ddl_speciality.DataBind();
            ddl_speciality.Items.Insert(0, new ListItem("----Select doctor by speciality---"));
            ddl_speciality.SelectedIndex = 0;

            loadDoctorInformation();//calling the load doctor function to bind data with repeater
        }

    }

    protected void ddlNameIndex(object sender, EventArgs e)
    {
        //checking the index of dropdowns. if one is greater then zero other is made zero.
        if (ddl_name.SelectedIndex > 0)
        {
            subLoadSelectedDoctor();
            ddl_speciality.SelectedIndex = 0;
        }

        else
        {
            loadDoctorInformation();
        }


    }

    protected void ddlSpecialityIndex(object sender, EventArgs e)
    {
        if (ddl_speciality.SelectedIndex > 0)
        {
            ddl_name.SelectedIndex = 0;
            subLoadSpeciality();
        }
        else
        {
            loadDoctorInformation();
        }

    }

    private void subLoadSelectedDoctor()
    {
        if (Page.IsPostBack)
        {
            //using the stored procedure sp_SearchUsersByParam to get the data from different tables of database
            string name = ddl_name.SelectedItem.Text;
            rptUserDetails.DataSource = objUDet.getDoctors("/brdhc", "doctors", name);
            rptUserDetails.DataBind();
            pnlRPT.Visible = true;
        }
            
       
    }

    private void subLoadSpeciality()
    {
        if (Page.IsPostBack)
        {
            //using the stored procedure sp_SearchDoctorsBySpeciality to get the data based on speciality
            string speciality = ddl_speciality.SelectedItem.Text;
            rptUserDetails.DataSource = objUDet.getDocBySpe("/brdhc", speciality);
            rptUserDetails.DataBind();
            pnlRPT.Visible = true;
            
        }
            
    }


    private void loadDoctorInformation()
    {
        //passing the rolename i.e doctors to load all the doctors
        string appName = WebConfigurationManager.AppSettings["appName"].ToString();
        string roleName;
        roleName = "doctors";
        rptUserDetails.DataSource = objUDet.getUserDetails(appName, roleName);
        rptUserDetails.DataBind();
    }

    protected void rptUserDetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {


        if (e.Item.ItemType == ListItemType.Item)
        {

            Label lblDep = (Label)(e.Item as RepeaterItem).FindControl("lblDep");
            if (((Object)(DataBinder.Eval(e.Item.DataItem, "Department"))) == null)
            {
                lblDep.Text = "N/A";
            }
            else if ((DataBinder.Eval(e.Item.DataItem, "Department")).ToString() == string.Empty)
            {
                lblDep.Text = "N/A";
            }

        }




    }
}