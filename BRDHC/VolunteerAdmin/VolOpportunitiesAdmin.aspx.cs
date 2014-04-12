using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VolunteerAdmin_VolOpportunitiesAdmin : System.Web.UI.Page
{
        volunteerClass objVol = new volunteerClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                _subRebind();
            }
        }

        private void _subRebind()
        {
            rpt_AdVol.DataSource = objVol.getOpps();
            rpt_AdVol.DataBind();
        }

        protected void rpt_AdVol_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Insert":
                    TextBox txtOppTitle = (TextBox)e.Item.FindControl("txt_oppTitle");
                    TextBox txtSkills = (TextBox)e.Item.FindControl("txt_skills");
                    TextBox txtBenefits = (TextBox)e.Item.FindControl("txt_benefits");
                    TextBox txtOther = (TextBox)e.Item.FindControl("txt_other");
                    TextBox txtHow = (TextBox)e.Item.FindControl("txt_how");
                    TextBox txtWhen = (TextBox)e.Item.FindControl("txt_when");
                    TextBox txtContact = (TextBox)e.Item.FindControl("txt_contact");
                    TextBox txtDepartment = (TextBox)e.Item.FindControl("txt_department");
                    TextBox txtReviewed = (TextBox)e.Item.FindControl("txt_reviewed");
                    _subRebind();
                    _strMes(objVol.commitInsert(txtOppTitle.Text, txtSkills.Text, txtBenefits.Text, txtOther.Text, txtHow.Text, txtWhen.Text, txtContact.Text, txtDepartment.Text, txtReviewed.Text), "insert");
                break;
                case "Update":
                    TextBox txtOppTitleU = (TextBox)e.Item.FindControl("txt_oppTitleU");
                    TextBox txtSkillsU = (TextBox)e.Item.FindControl("txt_skillsU");
                    TextBox txtBenefitsU = (TextBox)e.Item.FindControl("txt_benefitsU");
                    TextBox txtOtherU = (TextBox)e.Item.FindControl("txt_otherU");
                    TextBox txtHowU = (TextBox)e.Item.FindControl("txt_howU");
                    TextBox txtWhenU = (TextBox)e.Item.FindControl("txt_whenU");
                    TextBox txtContactU = (TextBox)e.Item.FindControl("txt_contactU");
                    TextBox txtDepartmentU = (TextBox)e.Item.FindControl("txt_departmentU");
                    TextBox txtReviewedU = (TextBox)e.Item.FindControl("txt_reviewedU");
                    HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idE");
                    Guid OppId = Guid.Parse(hdfID.Value.ToString());
                    _strMes(objVol.commitUpdate(OppId, txtOppTitleU.Text, txtSkillsU.Text, txtBenefitsU.Text, txtOtherU.Text, txtHowU.Text, txtWhenU.Text, txtContactU.Text, txtDepartmentU.Text, txtReviewedU.Text), "update");
                    _subRebind();
                    break;
                case "Delete":
                    Guid _OppId = Guid.Parse(((HiddenField)e.Item.FindControl("hdf_idE")).Value);
                    _strMes(objVol.commitDelete(_OppId), "delete");
                    _subRebind();
                    break;
                case "Cancel":
                    _subRebind();
                    break;
            }
        }


         private void _strMes(bool flag, string str)
        {
            if (flag)
            {
                lbl_mes.Text = "Question " + str + " was successful";
            }
            else
            {
                lbl_mes.Text = "Sorry, unable to " + str + " question";
            }
        }

       
}