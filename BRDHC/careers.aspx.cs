using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class careers : System.Web.UI.Page
{
    careersClass objCareer = new careersClass();
    careerAppClass objApp = new careerAppClass();

    private void _panelControl(Panel pnl)
    {
        pnl_main.Visible = false;
        pnl_apply.Visible = false;
        pnl.Visible = true;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subRebind();
            _panelControl(pnl_main);
        }
    }

    protected void mainCommands(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Apply":
                showApply(Guid.Parse(e.CommandArgument.ToString()));
                _subRebind();
                break;
            case "Tell a Friend":
                break;
        }
    }

    bool CheckFileType(string fileName)
    {
        return (Path.GetExtension(fileName).ToLower() == ".doc" || Path.GetExtension(fileName).ToLower() == ".docx");
    }

    protected void applyCommands(object sender, RepeaterCommandEventArgs e)
    {
        Guid newApp = Guid.NewGuid();
        Guid jobID = Guid.Parse(((HiddenField)e.Item.FindControl("hdf_id")).Value);
        TextBox fname = (TextBox)e.Item.FindControl("txt_fname");
        TextBox lname = (TextBox)e.Item.FindControl("txt_lname");
        TextBox email = (TextBox)e.Item.FindControl("txt_email");
        TextBox phone = (TextBox)e.Item.FindControl("txt_phone");
        Label message = (Label)e.Item.FindControl("lbl_message");
        FileUpload resume = (FileUpload)e.Item.FindControl("fu_res");


        switch (e.CommandName)
        {
            case "Insert":
                objApp.insertApp(newApp, jobID, fname.Text, lname.Text, email.Text, phone.Text);
                if (resume.HasFile)
                {
                    try
                    {
                        if (CheckFileType(resume.FileName))
                        {
                            if (resume.PostedFile.ContentLength < 100000)
                            {
                                string filename = Path.GetFileName(resume.FileName);
                                resume.SaveAs(Server.MapPath("~/UpResume") + filename);
                                string resumepath = Server.MapPath("~/UpResume") + filename;
                                objApp.uploadResume(newApp, jobID, resumepath); 
                                //StatusLabel.Text = "Upload status: File uploaded!";
                            }
                            else
                                message.Text = "Upload status: The file has to be less than 100 kb!";
                        }
                        else
                            message.Text = "Upload status: Only Word Documents allowed!";
                    }
                    catch (Exception ex)
                    {
                        message.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                    }
                }
                _subRebind();
                break;
            case "Cancel":
                _panelControl(pnl_main);
                _subRebind();
                break;
        }
    }
    //protected void uploadCheck(object sender, RepeaterCommandEventArgs e)
    //{
        
    //    Label message = (Label)e.Item.FindControl("lbl_message");
    //    FileUpload resume = (FileUpload)e.Item.FindControl("fu_res");
    //    if (resume.HasFile)
    //    {
    //        try
    //        {
    //            if (resume.PostedFile.ContentType == "doc/docx")
    //            {
    //                if (resume.PostedFile.ContentLength < 100000)
    //                {
    //                    string filename = Path.GetFileName(resume.FileName);
    //                    resume.SaveAs(Server.MapPath("~/UpResume") + filename);
    //                    string resumepath = Server.MapPath("~/UpResume") + filename;
    //                    //StatusLabel.Text = "Upload status: File uploaded!";
    //                }
    //                else
    //                    message.Text = "Upload status: The file has to be less than 100 kb!";
    //            }
    //            else
    //                message.Text = "Upload status: Word Documents allowed!";
    //        }
    //        catch (Exception ex)
    //        {
    //            message.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
    //        }
    //    }
    //}

    private void _subRebind()
    {
        rpt_careers.DataSource = objCareer.getJobs();
        rpt_careers.DataBind();
    }

    protected void showApply(Guid id)
    {
        _panelControl(pnl_apply);
        rpt_apply.DataSource = objCareer.getJobByID(id);
        rpt_apply.DataBind();
    }

}