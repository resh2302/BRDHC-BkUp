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


    protected void btnThis_Click(object sender, EventArgs e)
    {
        int row = ((GridViewRow)((Control)sender).NamingContainer).RowIndex;

        Panel PnlMpeThis = (Panel)grid_quiz.Rows[row].FindControl("pnl_mpeThis");
        HiddenField hdfThisAns = (HiddenField)PnlMpeThis.FindControl("hdf_thisAns");
        PnlMpeThis.Visible = true;

        Guid QuestionID = Guid.Parse(hdfThisAns.Value.ToString());

        quizClass objLinq = new quizClass();

        if (objLinq.getAnswer(QuestionID).Equals("THIS"))
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

        if (Answer.Equals("THAT"))
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
         

    protected void btnOK_Click(object sender, EventArgs e)
    {
        if (grid_quiz.PageIndex < grid_quiz.PageCount - 1 )
        {
            pnlContainer.Visible = true;
            pnlResults.Visible = false;
            grid_quiz.PageIndex++;
            _subBind();
        }
        else
        {
            pnlContainer.Visible = false;
            pnlResults.Visible = true;
            lblResults.Text = "Thank you for trying the Healthy Eating Quiz!<br /> You got" + score.ToString() + "answers correct.";
        }

    }

    protected void _subBind()
    {
        quizClass objLinq = new quizClass();
        grid_quiz.DataSource = objLinq.getQues();
        grid_quiz.DataBind();
    }

}
