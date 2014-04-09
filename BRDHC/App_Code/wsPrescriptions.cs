using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
    
}
