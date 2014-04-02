﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.34011
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;



[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="DB_65818_brdhc")]
public partial class DoctorinfoDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Insertbrdhc_Doctor(brdhc_Doctor instance);
  partial void Updatebrdhc_Doctor(brdhc_Doctor instance);
  partial void Deletebrdhc_Doctor(brdhc_Doctor instance);
  #endregion
	
	public DoctorinfoDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["myCon"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public DoctorinfoDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public DoctorinfoDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public DoctorinfoDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public DoctorinfoDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<brdhc_Doctor> brdhc_Doctors
	{
		get
		{
			return this.GetTable<brdhc_Doctor>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.brdhc_Doctors")]
public partial class brdhc_Doctor : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private System.Guid _DoctorId;
	
	private string _DoctorName;
	
	private System.DateTime _DOB;
	
	private string _Qualification;
	
	private string _Specificiality;
	
	private System.DateTime _JoiningDate;
	
	private System.Data.Linq.Binary _Image;
	
	private string _Department;
	
	private string _Awards_Achievements;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnDoctorIdChanging(System.Guid value);
    partial void OnDoctorIdChanged();
    partial void OnDoctorNameChanging(string value);
    partial void OnDoctorNameChanged();
    partial void OnDOBChanging(System.DateTime value);
    partial void OnDOBChanged();
    partial void OnQualificationChanging(string value);
    partial void OnQualificationChanged();
    partial void OnSpecificialityChanging(string value);
    partial void OnSpecificialityChanged();
    partial void OnJoiningDateChanging(System.DateTime value);
    partial void OnJoiningDateChanged();
    partial void OnImageChanging(System.Data.Linq.Binary value);
    partial void OnImageChanged();
    partial void OnDepartmentChanging(string value);
    partial void OnDepartmentChanged();
    partial void OnAwards_AchievementsChanging(string value);
    partial void OnAwards_AchievementsChanged();
    #endregion
	
	public brdhc_Doctor()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DoctorId", DbType="UniqueIdentifier NOT NULL", IsPrimaryKey=true)]
	public System.Guid DoctorId
	{
		get
		{
			return this._DoctorId;
		}
		set
		{
			if ((this._DoctorId != value))
			{
				this.OnDoctorIdChanging(value);
				this.SendPropertyChanging();
				this._DoctorId = value;
				this.SendPropertyChanged("DoctorId");
				this.OnDoctorIdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DoctorName", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
	public string DoctorName
	{
		get
		{
			return this._DoctorName;
		}
		set
		{
			if ((this._DoctorName != value))
			{
				this.OnDoctorNameChanging(value);
				this.SendPropertyChanging();
				this._DoctorName = value;
				this.SendPropertyChanged("DoctorName");
				this.OnDoctorNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DOB", DbType="Date NOT NULL")]
	public System.DateTime DOB
	{
		get
		{
			return this._DOB;
		}
		set
		{
			if ((this._DOB != value))
			{
				this.OnDOBChanging(value);
				this.SendPropertyChanging();
				this._DOB = value;
				this.SendPropertyChanged("DOB");
				this.OnDOBChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Qualification", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
	public string Qualification
	{
		get
		{
			return this._Qualification;
		}
		set
		{
			if ((this._Qualification != value))
			{
				this.OnQualificationChanging(value);
				this.SendPropertyChanging();
				this._Qualification = value;
				this.SendPropertyChanged("Qualification");
				this.OnQualificationChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Specificiality", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
	public string Specificiality
	{
		get
		{
			return this._Specificiality;
		}
		set
		{
			if ((this._Specificiality != value))
			{
				this.OnSpecificialityChanging(value);
				this.SendPropertyChanging();
				this._Specificiality = value;
				this.SendPropertyChanged("Specificiality");
				this.OnSpecificialityChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_JoiningDate", DbType="Date NOT NULL")]
	public System.DateTime JoiningDate
	{
		get
		{
			return this._JoiningDate;
		}
		set
		{
			if ((this._JoiningDate != value))
			{
				this.OnJoiningDateChanging(value);
				this.SendPropertyChanging();
				this._JoiningDate = value;
				this.SendPropertyChanged("JoiningDate");
				this.OnJoiningDateChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Image", DbType="Image", CanBeNull=true, UpdateCheck=UpdateCheck.Never)]
	public System.Data.Linq.Binary Image
	{
		get
		{
			return this._Image;
		}
		set
		{
			if ((this._Image != value))
			{
				this.OnImageChanging(value);
				this.SendPropertyChanging();
				this._Image = value;
				this.SendPropertyChanged("Image");
				this.OnImageChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Department", DbType="VarChar(50)")]
	public string Department
	{
		get
		{
			return this._Department;
		}
		set
		{
			if ((this._Department != value))
			{
				this.OnDepartmentChanging(value);
				this.SendPropertyChanging();
				this._Department = value;
				this.SendPropertyChanged("Department");
				this.OnDepartmentChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Awards_Achievements", DbType="VarChar(MAX)")]
	public string Awards_Achievements
	{
		get
		{
			return this._Awards_Achievements;
		}
		set
		{
			if ((this._Awards_Achievements != value))
			{
				this.OnAwards_AchievementsChanging(value);
				this.SendPropertyChanging();
				this._Awards_Achievements = value;
				this.SendPropertyChanged("Awards_Achievements");
				this.OnAwards_AchievementsChanged();
			}
		}
	}
	
	public event PropertyChangingEventHandler PropertyChanging;
	
	public event PropertyChangedEventHandler PropertyChanged;
	
	protected virtual void SendPropertyChanging()
	{
		if ((this.PropertyChanging != null))
		{
			this.PropertyChanging(this, emptyChangingEventArgs);
		}
	}
	
	protected virtual void SendPropertyChanged(String propertyName)
	{
		if ((this.PropertyChanged != null))
		{
			this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
		}
	}
}
#pragma warning restore 1591