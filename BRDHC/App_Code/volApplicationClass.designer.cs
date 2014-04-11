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
public partial class volApplicationClassDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Insertbrdhc_volunteerApp(brdhc_volunteerApp instance);
  partial void Updatebrdhc_volunteerApp(brdhc_volunteerApp instance);
  partial void Deletebrdhc_volunteerApp(brdhc_volunteerApp instance);
  #endregion
	
	public volApplicationClassDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["myCon"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public volApplicationClassDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public volApplicationClassDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public volApplicationClassDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public volApplicationClassDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<brdhc_volunteerApp> brdhc_volunteerApps
	{
		get
		{
			return this.GetTable<brdhc_volunteerApp>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.brdhc_volunteerApp")]
public partial class brdhc_volunteerApp : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private System.Guid _AppId;
	
	private string _firstName;
	
	private string _lastName;
	
	private string _phone;
	
	private string _email;
	
	private string _address;
	
	private string _occupation;
	
	private string _student;
	
	private string _prevExp;
	
	private string _whyVol;
	
	private string _reviewed;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnAppIdChanging(System.Guid value);
    partial void OnAppIdChanged();
    partial void OnfirstNameChanging(string value);
    partial void OnfirstNameChanged();
    partial void OnlastNameChanging(string value);
    partial void OnlastNameChanged();
    partial void OnphoneChanging(string value);
    partial void OnphoneChanged();
    partial void OnemailChanging(string value);
    partial void OnemailChanged();
    partial void OnaddressChanging(string value);
    partial void OnaddressChanged();
    partial void OnoccupationChanging(string value);
    partial void OnoccupationChanged();
    partial void OnstudentChanging(string value);
    partial void OnstudentChanged();
    partial void OnprevExpChanging(string value);
    partial void OnprevExpChanged();
    partial void OnwhyVolChanging(string value);
    partial void OnwhyVolChanged();
    partial void OnreviewedChanging(string value);
    partial void OnreviewedChanged();
    #endregion
	
	public brdhc_volunteerApp()
	{
		OnCreated();
	}

    [global::System.Data.Linq.Mapping.ColumnAttribute(AutoSync = AutoSync.OnInsert, IsDbGenerated = true, Storage = "_AppId", DbType = "UniqueIdentifier NOT NULL", IsPrimaryKey = true)]
	public System.Guid AppId
	{
		get
		{
			return this._AppId;
		}
		set
		{
			if ((this._AppId != value))
			{
				this.OnAppIdChanging(value);
				this.SendPropertyChanging();
				this._AppId = value;
				this.SendPropertyChanged("AppId");
				this.OnAppIdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_firstName", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
	public string firstName
	{
		get
		{
			return this._firstName;
		}
		set
		{
			if ((this._firstName != value))
			{
				this.OnfirstNameChanging(value);
				this.SendPropertyChanging();
				this._firstName = value;
				this.SendPropertyChanged("firstName");
				this.OnfirstNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_lastName", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
	public string lastName
	{
		get
		{
			return this._lastName;
		}
		set
		{
			if ((this._lastName != value))
			{
				this.OnlastNameChanging(value);
				this.SendPropertyChanging();
				this._lastName = value;
				this.SendPropertyChanged("lastName");
				this.OnlastNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_phone", DbType="VarChar(15) NOT NULL", CanBeNull=false)]
	public string phone
	{
		get
		{
			return this._phone;
		}
		set
		{
			if ((this._phone != value))
			{
				this.OnphoneChanging(value);
				this.SendPropertyChanging();
				this._phone = value;
				this.SendPropertyChanged("phone");
				this.OnphoneChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_email", DbType="VarChar(50)")]
	public string email
	{
		get
		{
			return this._email;
		}
		set
		{
			if ((this._email != value))
			{
				this.OnemailChanging(value);
				this.SendPropertyChanging();
				this._email = value;
				this.SendPropertyChanged("email");
				this.OnemailChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_address", DbType="VarChar(200) NOT NULL", CanBeNull=false)]
	public string address
	{
		get
		{
			return this._address;
		}
		set
		{
			if ((this._address != value))
			{
				this.OnaddressChanging(value);
				this.SendPropertyChanging();
				this._address = value;
				this.SendPropertyChanged("address");
				this.OnaddressChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_occupation", DbType="VarChar(100)")]
	public string occupation
	{
		get
		{
			return this._occupation;
		}
		set
		{
			if ((this._occupation != value))
			{
				this.OnoccupationChanging(value);
				this.SendPropertyChanging();
				this._occupation = value;
				this.SendPropertyChanged("occupation");
				this.OnoccupationChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_student", DbType="VarChar(50)")]
	public string student
	{
		get
		{
			return this._student;
		}
		set
		{
			if ((this._student != value))
			{
				this.OnstudentChanging(value);
				this.SendPropertyChanging();
				this._student = value;
				this.SendPropertyChanged("student");
				this.OnstudentChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_prevExp", DbType="Text NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
	public string prevExp
	{
		get
		{
			return this._prevExp;
		}
		set
		{
			if ((this._prevExp != value))
			{
				this.OnprevExpChanging(value);
				this.SendPropertyChanging();
				this._prevExp = value;
				this.SendPropertyChanged("prevExp");
				this.OnprevExpChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_whyVol", DbType="Text NOT NULL", CanBeNull=false, UpdateCheck=UpdateCheck.Never)]
	public string whyVol
	{
		get
		{
			return this._whyVol;
		}
		set
		{
			if ((this._whyVol != value))
			{
				this.OnwhyVolChanging(value);
				this.SendPropertyChanging();
				this._whyVol = value;
				this.SendPropertyChanged("whyVol");
				this.OnwhyVolChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_reviewed", DbType="VarChar(10)")]
	public string reviewed
	{
		get
		{
			return this._reviewed;
		}
		set
		{
			if ((this._reviewed != value))
			{
				this.OnreviewedChanging(value);
				this.SendPropertyChanging();
				this._reviewed = value;
				this.SendPropertyChanged("reviewed");
				this.OnreviewedChanged();
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
