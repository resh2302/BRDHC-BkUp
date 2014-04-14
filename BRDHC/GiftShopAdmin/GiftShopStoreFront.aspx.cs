using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GiftShopAdmin_GiftShopStoreFront : System.Web.UI.Page
{

    //creating a new instance of the giftShopStore class
    giftShopStoreClass objBou = new giftShopStoreClass();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //overriding the master dashboard heading
            Label lblDashboard = Master.dashboardHeading;
            lblDashboard.Text = "ADMIN DASHBOARD : GIFT SHOP";
            //binding data on pageload
            _subRebind();
        }
    }

    //binding data to the repeater
    private void _subRebind()
    {
        rpt_all.DataSource = objBou.getBouquets();
        rpt_all.DataBind();
    }

    //fileupload
    protected void UploadButton_Click(object sender, EventArgs e)
    {
        if (FileUploadPhoto.HasFile)
        {
            try
            {
                //checking the file type
                if (FileUploadPhoto.PostedFile.ContentType == "image/jpeg")
                {
                   //checking the file size, equale to 700 kb
                    if (FileUploadPhoto.PostedFile.ContentLength < 716800)
                    {
                        string filename = FileUploadPhoto.PostedFile.FileName;
                        FileUploadPhoto.SaveAs(Server.MapPath("~/App_Themes/HealthTools/images/giftShop/") + filename);
                        UploadStatusLabel.Text = "Upload status: File uploaded!";
                    }
                    else
                        UploadStatusLabel.Text = "Upload status: The file has to be less than 700 kb.";
                }
                else
                    UploadStatusLabel.Text = "Upload status: Only JPEG files are accepted!";
            }
            catch (Exception ex)
            {
                UploadStatusLabel.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
            }
        }

    }

    //inserting a new bouquet
    protected void subInsert(object sender, CommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Insert":
                _strMes(objBou.commitInsert(txt_nameI.Text, txt_pictureI.Text, txt_priceI.Text), "insert");
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }

    //success or failure message
    private void _strMes(bool flag, string str)
    {
        if (flag)
        {
            lbl_mes.Text = "Bouquet " + str + " was successful";
        }
        else
        {
            lbl_mes.Text = "Sorry, unable to " + str + " bouquet";
        }
    }

    //update, delete, cancel
    protected void subUpDel(object sender, RepeaterCommandEventArgs e)
    {
        switch (e.CommandName)
        {
            case "Update":
                TextBox txtName = (TextBox)e.Item.FindControl("txt_name");
                TextBox txtPicture = (TextBox)e.Item.FindControl("txt_picutre");
                TextBox txtPrice = (TextBox)e.Item.FindControl("txt_price");
                HiddenField hdfID = (HiddenField)e.Item.FindControl("hdf_idU");
                Guid BouquetID = Guid.Parse(hdfID.Value.ToString());
                _strMes(objBou.commitUpdate(BouquetID, txtName.Text, txtPicture.Text, txtPrice.Text), "update");
                _subRebind();
                break;
            case "Delete":
                Guid _BouquetID = Guid.Parse(((HiddenField)e.Item.FindControl("hdf_idU")).Value);
                _strMes(objBou.commitDelete(_BouquetID), "delete");
                _subRebind();
                break;
            case "Cancel":
                _subRebind();
                break;
        }
    }

}