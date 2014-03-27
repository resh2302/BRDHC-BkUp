using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class healthToolsQuizQues : System.Web.UI.Page
{
    public static int score = 0;
    public static int pageIndex = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            _subBind();
        }
    }

    protected void grid_page(object sender, GridViewPageEventArgs e)
    {
        grid_quiz.PageIndex = pageIndex;
        _subBind();
    }

    protected void grid_quiz_PreRender(object sender, EventArgs e)
    {
        grid_quiz.PageIndex = pageIndex;
    }

    protected void btnThis_Click(object sender, EventArgs e)
    {

        
        //HiddenField hdfThisAns = ((HiddenField)grid_quiz.SelectedRow.Cells[1].FindControl("hdf_thisAns"));
        //Guid QuestionID = Guid.Parse( hdfThisAns.Value);

        //quizClass objLinq = new quizClass();
        //string Answer = objLinq.getAnswer(QuestionID).ToString();
        //grid_quiz.DataBind();

        //if (Answer == "THIS")
        //{
        //    Label lbl_this = ((Label)grid_quiz.FindControl("lbl_this"));
        //    lbl_this.Text = "Correct!";
        //    //score += 1;
        //}
        //else
        //{
        //    Label lbl_this = ((Label)grid_quiz.FindControl("lbl_this"));
        //    lbl_this.Text = "Sorry!";

        int row = ((GridViewRow)((Control)sender).NamingContainer).RowIndex;

        Panel PnlMpeThis = (Panel)grid_quiz.Rows[row].FindControl("pnl_mpeThis");
        HiddenField hdfThisAns = (HiddenField)PnlMpeThis.FindControl("hdf_thisAns");
        PnlMpeThis.Visible = true;

        Guid QuestionID = Guid.Parse(hdfThisAns.Value.ToString());

        quizClass objLinq = new quizClass();
        string Answer = objLinq.getAnswer(QuestionID).ToString();

        if (Answer == "THIS")
        {
            Label lbl_ans = (Label)PnlMpeThis.FindControl("lbl_ans");
            lbl_ans.Text = "Correct!";
            score += 1;
        }
        else
        {
            Label lbl_ans = (Label)PnlMpeThis.FindControl("lbl_ans");
            lbl_ans.Text = "Sorry!";

        }
    }

    protected void btnThat_Click(object sender, EventArgs e)
    {
        int row = ((GridViewRow)((Control)sender).NamingContainer).RowIndex;

        Panel PnlMpeThis = (Panel)grid_quiz.Rows[row].FindControl("pnl_mpeThis");
        HiddenField hdfThisAns = (HiddenField)PnlMpeThis.FindControl("hdf_thisAns");
        PnlMpeThis.Visible = true;

        Guid QuestionID = Guid.Parse(hdfThisAns.Value.ToString());

        quizClass objLinq = new quizClass();
        string Answer = objLinq.getAnswer(QuestionID).ToString();

        if (Answer == "THAT")
        {
            Label lbl_ans = (Label)PnlMpeThis.FindControl("lbl_ans");
            lbl_ans.Text = "Correct!";
            score += 1;
        }
        else
        {
            Label lbl_ans = (Label)PnlMpeThis.FindControl("lbl_ans");
            lbl_ans.Text = "Sorry!";
        }
    }


        //lblO.Text = "Index : "; //+ grid_quiz.PageIndex + "Count : " + grid_quiz.PageCount ;
        // if (grid_quiz.PageIndex < grid_quiz.PageCount)
        //{
        //    grid_quiz.PageIndex ++;
        //    //_subBind();
             
        //}
        //else {
        //    Response.Redirect("~/healthToolsQuizScore.aspx?");
        //}
         

    protected void btnOK_Click(object sender, EventArgs e)
    {
        //if (grid_quiz.PageIndex <= (grid_quiz.PageCount - 1))
        if (grid_quiz.PageIndex < 10)
        {
            pnlContainer.Visible = true;
            pnlResults.Visible = false;
            pageIndex++;
            _subBind();
        }
        else
        {
            pnlContainer.Visible = false;
            pnlResults.Visible = true;
            lblResults.Text = "Your Score is: " + score.ToString();
        }

    }

    protected void _subBind()
    {
        quizClass objLinq = new quizClass();
        grid_quiz.DataSource = objLinq.getQues();
        grid_quiz.DataBind();
    }

}

    /*protected void grid_quiz_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "showResult")
        {

            int row = ((GridViewRow)((Control)sender).NamingContainer).RowIndex;

            Panel PnlMpeThis = (Panel)grid_quiz.Rows[row].FindControl("pnl_mpeThis");
            HiddenField hdfThisAns = (HiddenField)PnlMpeThis.FindControl("hdf_thisAns");
       
        }
    }*/

