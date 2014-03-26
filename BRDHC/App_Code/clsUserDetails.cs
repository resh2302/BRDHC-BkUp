////////////////////////////////////////////////////////////////////
// AUTHOR:           JAGSIR
// LAST MODIFIED BY: JAGSIR
// DATE MODIFIED: -  22 FEB 2014
// DESCRIPTION:      CLASS FOR REGISTRATION FUNCTIONALITY
///////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsRegistration
/// </summary>
public class clsUserDetails
{
    public clsUserDetails()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public int lockUser(string userId)
    {
        UserDetailsDataContext obj = new UserDetailsDataContext();
        return obj.sp_LockUser(new Guid(userId));
    }

    public List<sp_SearchUsersResult> getUserDetails(string applicationName, string roleName)
    {
        List<sp_SearchUsersResult> myList = new List<sp_SearchUsersResult>();
        UserDetailsDataContext obj = new UserDetailsDataContext();
        return obj.sp_SearchUsers(applicationName, roleName).ToList();
    }

    public List<sp_SearchUsersByIdResult> getDocById(Guid userId)
    {
        List<sp_SearchUsersResult> myList = new List<sp_SearchUsersResult>();
        UserDetailsDataContext obj = new UserDetailsDataContext();
        return obj.sp_SearchUsersById(userId).ToList();
    }

    public List<sp_SearchUsersByIdResult> getUserDetailsById(string userId)
    {
        List<sp_SearchUsersByIdResult> myList = new List<sp_SearchUsersByIdResult>();
        UserDetailsDataContext obj = new UserDetailsDataContext();
        return obj.sp_SearchUsersById(new Guid(userId)).ToList();
    }

    public IQueryable<brdhc_DoctorSpeciality> getDoctorsBySpeciality()
    {
        UserDetailsDataContext udObj = new UserDetailsDataContext();
        var doctors =
            from d in udObj.brdhc_DoctorSpecialities
            orderby d.Speciality
            select d;
        return doctors;
    }


    public List<sp_SearchUsersByParamResult> getDoctors(string applicationName, string roleName, string name)
    {
        List<sp_SearchUsersByParamResult> myList = new List<sp_SearchUsersByParamResult>();
        UserDetailsDataContext objdoc = new UserDetailsDataContext();
        return objdoc.sp_SearchUsersByParam(applicationName, roleName, name).ToList();
    }

    public List<sp_SearchDoctorsBySpecialityResult> getDocBySpe(string applicationName , string speciality)
    {
        List<sp_SearchDoctorsBySpecialityResult> myList = new List<sp_SearchDoctorsBySpecialityResult>();
        UserDetailsDataContext objdoc = new UserDetailsDataContext();
        return objdoc.sp_SearchDoctorsBySpeciality(applicationName,speciality).ToList();
    }

    public List<brdhc_UserBasicInfo> getPatient(string identification)
    {
        UserDetailsDataContext objDet = new UserDetailsDataContext();
        var user =
            from u in objDet.brdhc_UserBasicInfos
            where u.Identification == identification
            select u;
        return user.Cast<brdhc_UserBasicInfo>().ToList();
    }

    public void saveUserBasicInfo(string userId, string firstName, string lastName, string dob, string gender, string identification, string address, string cityId, string stateId, string postalCode, string phone, string fax, string familyDoctor, string department, string joinDate, string speciality, string communityName) // save new record into databse
    {
        // create a new table with one row and this table is similar in schema with the table in database
        brdhc_UserBasicInfo svTable = new brdhc_UserBasicInfo()
        {
            UserId = new Guid(userId),
            FirstName = firstName.Trim(),
            LastName = lastName.Trim(),
            DOB = Convert.ToDateTime(dob),
            Gender = Convert.ToChar(gender),
            Identification = identification,
            Address = address,
            CityId = new Guid(cityId),
            StateId = new Guid(stateId),
            PostalCode = postalCode,
            Phone = phone,
            Fax = fax,
            FamilyDoctor = familyDoctor,
            Department = department,
            JoinDate = Convert.ToDateTime(joinDate),
            Speciality = new Guid(speciality),
            CommunityGroupName = communityName
        };
        UserDetailsDataContext objReg = new UserDetailsDataContext();
        // call the function to save the row into actual database table
        objReg.brdhc_UserBasicInfos.InsertOnSubmit(svTable);
        objReg.SubmitChanges();
    }

    public void updateUserBasicInfo(string userBasicInfoId, string firstName, string lastName, string dob, string gender, string identification, string address, string cityId, string stateId, string postalCode, string phone, string fax, string familyDoctor, string department, string joinDate, string speciality, string communityName) // save update record into databse
    {
        // create a new table with one row and this table is similar in schema with the table in database
     
        UserDetailsDataContext objReg = new UserDetailsDataContext();
        var user = objReg.brdhc_UserBasicInfos.Single(u => u.UserBasicInfoId == new Guid(userBasicInfoId));       
        // make the changes

        user.FirstName = firstName;
        user.LastName = lastName;
        user.DOB = DateTime.Parse(dob);
        user.Gender = Char.Parse(gender);
        user.Identification = identification;
        user.Address = address;
        user.CityId = Guid.Parse(cityId);
        user.StateId = Guid.Parse(stateId);
        user.PostalCode = postalCode;
        user.Phone = phone;
        user.Fax = fax;
        user.FamilyDoctor = familyDoctor;
        user.Department = department;
        user.JoinDate = DateTime.Parse(joinDate);
        if (speciality != string.Empty)
            user.Speciality = new Guid(speciality);
        user.CommunityGroupName = communityName;

        // update the datebase table with new values
        objReg.SubmitChanges();
    }

}