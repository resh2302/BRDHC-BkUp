using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class volAppClass
{
    public IQueryable<brdhc_volunteerApp> getApps()
    {
        //creating an instance of our LINQ object
        //creating an anonymous variable with its value being the instance of the LINQ object
        //var allApps = from x in objProd.products select x;

        volApplicationClassDataContext objApp = new volApplicationClassDataContext();
        var allApps = objApp.brdhc_volunteerApps.Select(x => x);
        return allApps;
    }

    //public string getwhyVol(Guid _AppId)
    //{
    //    volApplicationClassDataContext objApp = new volApplicationClassDataContext();
    //    var ans = objApp.brdhc_volunteerApps.Single(x => x.AppId == _AppId);
    //    return ans.FIELD;
    //}

    public IQueryable<brdhc_volunteerApp> getAppById(Guid _AppId)
    {
        volApplicationClassDataContext objApp = new volApplicationClassDataContext();
        var allApps = objApp.brdhc_volunteerApps.Where(x => x.AppId == _AppId).Select(x => x);
        return allApps;
        //x into x, select all columns from the table
        //x.Id to access a specific column in the table
    }

    //THIS IS AN INSERT
    public bool commitInsert(string _firstName, string _lastName, string _phone, string _email, string _address, string _occupation, string _student, string _prevExp, string _whyVol, string _reviewed)
    {
        volApplicationClassDataContext objApp = new volApplicationClassDataContext();
        using (objApp)
        {
            brdhc_volunteerApp objNewApp = new brdhc_volunteerApp();
            objNewApp.firstName = _firstName;
            objNewApp.lastName = _lastName;
            objNewApp.phone = _phone;
            objNewApp.email = _email;
            objNewApp.address = _address;
            objNewApp.occupation = _lastName;
            objNewApp.student = _student;
            objNewApp.prevExp = _prevExp;
            objNewApp.whyVol = _whyVol;
            objNewApp.reviewed = _reviewed;
            objApp.brdhc_volunteerApps.InsertOnSubmit(objNewApp);
            objApp.SubmitChanges(); //this will commit the changes
            return true; //boolean
        }
    }

    //THIS IS AN UPDATE
    public bool commitUpdate(Guid _AppId, string _firstName, string _lastName, string _phone, string _email, string _address, string _occupation, string _student, string _prevExp, string _whyVol, string _reviewed)
    {
        volApplicationClassDataContext objApp = new volApplicationClassDataContext();
        using (objApp)
        {
            //updating a single row at a time which row depends on the _id
            var objUpVol = objApp.brdhc_volunteerApps.Single(x => x.AppId == _AppId);
            objUpVol.firstName = _firstName; //Up for update
            objUpVol.lastName = _lastName;
            objUpVol.phone = _phone;
            objUpVol.email = _email;
            objUpVol.address = _address;
            objUpVol.occupation = _occupation;
            objUpVol.student = _student;
            objUpVol.prevExp = _prevExp;
            objUpVol.whyVol = _whyVol;
            objUpVol.reviewed = _reviewed;
            objApp.SubmitChanges(); //on submit use objApp
            return true;
        }
    }

    //THIS IS A DELETE
    public bool commitDelete(Guid _AppId)
    {
        volApplicationClassDataContext objApp = new volApplicationClassDataContext();
        using (objApp)
        {
            var objDelApp = objApp.brdhc_volunteerApps.Single(x => x.AppId == _AppId);
            objApp.brdhc_volunteerApps.DeleteOnSubmit(objDelApp); //if you want to delete all best to drop the table
            objApp.SubmitChanges();
            return true;
        }
    }
}