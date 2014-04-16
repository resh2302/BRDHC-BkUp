using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsHealthAlerts
/// </summary>
public class clsHealthAlerts
{
    public clsHealthAlerts()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public List<sp_SearchHealthAlertsByNameResult> getHealthAlerts(string applicationName, string healthAlertTitle)
    {
        List<sp_SearchHealthAlertsByNameResult> myList = new List<sp_SearchHealthAlertsByNameResult>();
        HealthAlertsDataContext obj = new HealthAlertsDataContext();
        return obj.sp_SearchHealthAlertsByName(applicationName, healthAlertTitle).ToList();
    }

    public IQueryable<brdhc_HealthAlert> getLatestAlert()
    {
        HealthAlertsDataContext objCommon = new HealthAlertsDataContext();

        return objCommon.brdhc_HealthAlerts.Where(alert => alert.Published == true);

    }

    public IQueryable<brdhc_HealthAlert> getAlertById(Guid alertId)
    {
        HealthAlertsDataContext objCommon = new HealthAlertsDataContext();
        var alerts =
            from c in objCommon.brdhc_HealthAlerts
            where (c.HealthAlertId == alertId) && (c.Published == true)
            select c;
        return alerts;
    }

    public void saveHealthAlert(Guid healthAlertId, string healthAlertTitle, string healthAlertDescription, DateTime alertDate, string userId, bool published) // save new record into databse
    {
        try
        {
            // create a new table with one row and this table is similar in schema with the table in database
            brdhc_HealthAlert svTable = new brdhc_HealthAlert()
            {
                HealthAlertId = healthAlertId,
                HealthAlertTitle = healthAlertTitle,
                HealthAlertDescription = healthAlertDescription,
                AlertDate = alertDate,
                UserId = new Guid(userId),
                Published = published
            };
            HealthAlertsDataContext objDataContext = new HealthAlertsDataContext();
            // call the function to save the row into actual database table
            objDataContext.brdhc_HealthAlerts.InsertOnSubmit(svTable);
            objDataContext.SubmitChanges();
        }        
        catch (Exception ex)
        {
            clsCommon.saveError(ex);
        }
    }

    public void updateHealthAlert(Guid healthAlertId, string healthAlertTitle, string healthAlertDescription, DateTime alertDate, string userId, bool published)
    {
        try
        {
            HealthAlertsDataContext objDataContext = new HealthAlertsDataContext();
            // select that particular row that is to be updated
            var tblRecords = objDataContext.brdhc_HealthAlerts.Single(p => p.HealthAlertId == healthAlertId);
            // make the changes     
            tblRecords.HealthAlertTitle = healthAlertTitle;
            tblRecords.HealthAlertDescription = healthAlertDescription;
            tblRecords.AlertDate = alertDate;
            tblRecords.UserId = new Guid(userId);
            tblRecords.Published = published;
            // update the datebase table with new values
            objDataContext.SubmitChanges();
        }
        catch (Exception ex)
        {
            clsCommon.saveError(ex);
        }
    }

    public void deleteHealthAlert(Guid healthAlertId)
    {
        try
        {
            HealthAlertsDataContext objDataContext = new HealthAlertsDataContext();
            // select the particular records from databse table and delete it
            var tblRecords =
                from a in objDataContext.brdhc_HealthAlerts
                where (a.HealthAlertId == healthAlertId)
                select a;
            // call the function to delete it and submit the changes
            objDataContext.brdhc_HealthAlerts.DeleteAllOnSubmit(tblRecords);
            objDataContext.SubmitChanges();
        }
        catch (Exception ex)
        {
            clsCommon.saveError(ex);
        }
    }

    public void resetForPublish()
    {
        using (var db = new HealthAlertsDataContext())
        {
            db.brdhc_HealthAlerts
              .Where(x => x.Published == true)
              .ToList()
              .ForEach(a => a.Published = false);

            db.SubmitChanges();
        }
    }

    public static void unsubscribe(Guid userId)
    {
        try
        {
            HealthAlertsDataContext objDataContext = new HealthAlertsDataContext();
            // select the particular records from databse table and delete it
            var tblRecords =
                from a in objDataContext.brdhc_AlertSubscribers
                where (a.UserId == userId)
                select a;
            // call the function to delete it and submit the changes
            objDataContext.brdhc_AlertSubscribers.DeleteAllOnSubmit(tblRecords);
            objDataContext.SubmitChanges();
        }
        catch (Exception ex)
        {
            clsCommon.saveError(ex);
        }
    }
}