using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

/// <summary>
/// Summary description for wsPrescriptions
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class wsPrescriptions : System.Web.Services.WebService {

    public wsPrescriptions () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string getPrescription(string appointmentId) {
        clsPrescriptions objPres = new clsPrescriptions();
        sp_SearchPatientPrescriptionResult data = new sp_SearchPatientPrescriptionResult();
        List<sp_SearchPatientPrescriptionResult> presc = objPres.getPatientPrescription(appointmentId);
        if(presc.Count()>0){
            foreach (sp_SearchPatientPrescriptionResult ob in presc)
            {
                data = ob;
            }
        } 
        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();

        return js.Serialize(data);
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    //public List<brdhc_PrescriptionDetail> getPresDetails(string prescriptionId)
    public string getPresDetails(string prescriptionId)
    {
        clsPrescriptions objPres = new clsPrescriptions();
        List<sp_SearchPrescriptionDetailsResult> presc = objPres.getPrescriptionDetails(Convert.ToInt32(prescriptionId));
        System.Web.Script.Serialization.JavaScriptSerializer js = new System.Web.Script.Serialization.JavaScriptSerializer();
        return js.Serialize(presc);
    }
    

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public string savePrescription(string prescriptionId, string appointmentId, string repeat, string presDate)
    {
        clsPrescriptions objPres = new clsPrescriptions();
        string strResult = "0";
        if (prescriptionId != "0")
        {
            strResult = objPres.updatePrescription(Convert.ToInt32(prescriptionId), Convert.ToInt32(appointmentId), Convert.ToInt32(repeat), Convert.ToDateTime(presDate));
        }
        else {
            try
            {
                strResult = objPres.savePrescription(Convert.ToInt32(appointmentId), Convert.ToInt32(repeat), Convert.ToDateTime(presDate));
            }
            catch (Exception ex)
            {
                clsCommon.saveError(ex);
                strResult = "0";
            }
        }
        return strResult;
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
   // public string savePrescription(string appointmentId, string repeat, string presDate, List<brdhc_PrescriptionDetail> medDetails)
    public string savePresDetails(List<brdhc_PrescriptionDetail> medDetails)
    {
        clsPrescriptions objPres = new clsPrescriptions();
        string strResult = "";
        if (medDetails.Count>0)
        {
            try
            {
                objPres.deletePresDetails(medDetails[0].PrescriptionId);
                foreach (brdhc_PrescriptionDetail objDet in medDetails)
                {
                    objPres.savePrescriptionDetails(Convert.ToInt32(objDet.PrescriptionId), objDet.Medicine.ToString(), objDet.Timings.ToString(), Convert.ToInt32(objDet.Days), Convert.ToInt32(objDet.Quantity));
                }

                strResult = "pass";
            }
            catch (Exception ex)
            {
                clsCommon.saveError(ex);
                strResult = ex.ToString();
            }
        }

        return strResult;
    }

    [WebMethod]
    public string deletePrescription(string prescriptionId)
    {
        clsPrescriptions objPres = new clsPrescriptions();
        string strResult = "0";
        try
        {
            objPres.deletePresDetails(Convert.ToInt32(prescriptionId));
            objPres.deletePres(Convert.ToInt32(prescriptionId));
            strResult = "1";
        }
        catch (Exception ex)
        {
            clsCommon.saveError(ex);
            strResult = "0";
        }
        return strResult;
    }

}
