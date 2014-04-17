////////////////////////////////////////////////////////////////////
// AUTHOR:           RESHMA MATHEW
// DESCRIPTION:      CLASS FOR EMERGENCY DEPARTMENT ACTIVITIES
///////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class clsEmergency
{
	
    // get all Records
    public IQueryable<brdhc_Emergency> getEmergencyRecords() {
        EmergencyDataContext objRecord = new EmergencyDataContext();
        var allRecords = objRecord.brdhc_Emergencies.Select(x => x).OrderByDescending(x => x.AddedOn);
        return allRecords;
    }

    //get Record by ID
    public IQueryable<brdhc_Emergency> getRecordByID(Guid id)
    {
        EmergencyDataContext objRecord = new EmergencyDataContext();
        var singleRecord = objRecord.brdhc_Emergencies.Where(x => x.EmergencyID == id).Select(x => x);
        return singleRecord;
    }

    // insert new wait time
    public bool insertWaitTime(Guid id, TimeSpan _time, DateTime _addedOn, string _updateBy)
    {
        EmergencyDataContext objRecord = new EmergencyDataContext();
        using (objRecord){
            brdhc_Emergency objNewRecord = new brdhc_Emergency();
            objNewRecord.EmergencyID = id;
            objNewRecord.WaitTime = _time;
            objNewRecord.AddedOn = _addedOn;
            objNewRecord.UpdatedBy = _updateBy;
            objRecord.brdhc_Emergencies.InsertOnSubmit(objNewRecord);
            objRecord.SubmitChanges();
            return true;
        }
    }

    // update wait time
    public bool updateWaitTime(Guid id, TimeSpan time, string updateBy)
    {
        EmergencyDataContext objRecord = new EmergencyDataContext();
        using(objRecord)
        {
            var objUpRecord = objRecord.brdhc_Emergencies.Single(x=>x.EmergencyID == id);
            objUpRecord.WaitTime = time;
            objUpRecord.UpdatedBy = updateBy;
            objRecord.SubmitChanges();
            return true;
        }
    }

    //delete wait time record
    public bool deleteWaitTime(Guid id)
    {
        EmergencyDataContext objRecord = new EmergencyDataContext();
        using (objRecord) 
        {
            var objDelRecord = objRecord.brdhc_Emergencies.Single(x => x.EmergencyID == id);
            objRecord.brdhc_Emergencies.DeleteOnSubmit(objDelRecord);
            objRecord.SubmitChanges();
            return true;
        }        
    }

    public IQueryable<brdhc_Emergency> getCurrentWaitTime()
    {
        EmergencyDataContext obj = new EmergencyDataContext();
        var objCurrent = obj.brdhc_Emergencies.OrderByDescending(x => x.AddedOn).Take(1);
        return objCurrent;        
    }

    

}