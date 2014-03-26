﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18444
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
public partial class AppointmentsDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Insertbrdhc_PatientAppointment(brdhc_PatientAppointment instance);
  partial void Updatebrdhc_PatientAppointment(brdhc_PatientAppointment instance);
  partial void Deletebrdhc_PatientAppointment(brdhc_PatientAppointment instance);
  #endregion
	
	public AppointmentsDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["myCon"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public AppointmentsDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public AppointmentsDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public AppointmentsDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public AppointmentsDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<brdhc_PatientAppointment> brdhc_PatientAppointments
	{
		get
		{
			return this.GetTable<brdhc_PatientAppointment>();
		}
	}
	
	[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.sp_SearchAppsByPatientName")]
	public ISingleResult<sp_SearchAppsByPatientNameResult> sp_SearchAppsByPatientName([global::System.Data.Linq.Mapping.ParameterAttribute(Name="ApplicationName", DbType="NVarChar(256)")] string applicationName, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="Name", DbType="NVarChar(256)")] string name)
	{
		IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), applicationName, name);
		return ((ISingleResult<sp_SearchAppsByPatientNameResult>)(result.ReturnValue));
	}
	
	[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.sp_GetBookedTime")]
	public ISingleResult<sp_GetBookedTimeResult> sp_GetBookedTime([global::System.Data.Linq.Mapping.ParameterAttribute(Name="DoctorUserId", DbType="UniqueIdentifier")] System.Nullable<System.Guid> doctorUserId, [global::System.Data.Linq.Mapping.ParameterAttribute(Name="AppointmentDate", DbType="Date")] System.Nullable<System.DateTime> appointmentDate)
	{
		IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), doctorUserId, appointmentDate);
		return ((ISingleResult<sp_GetBookedTimeResult>)(result.ReturnValue));
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.brdhc_PatientAppointments")]
public partial class brdhc_PatientAppointment : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private System.Guid _AppointmentId;
	
	private System.Guid _PatientUserId;
	
	private System.Guid _DoctorUserId;
	
	private System.DateTime _AppointmentDate;
	
	private string _AppointmentTime;
	
	private string _Reason;
	
	private bool _IsApproved;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnAppointmentIdChanging(System.Guid value);
    partial void OnAppointmentIdChanged();
    partial void OnPatientUserIdChanging(System.Guid value);
    partial void OnPatientUserIdChanged();
    partial void OnDoctorUserIdChanging(System.Guid value);
    partial void OnDoctorUserIdChanged();
    partial void OnAppointmentDateChanging(System.DateTime value);
    partial void OnAppointmentDateChanged();
    partial void OnAppointmentTimeChanging(string value);
    partial void OnAppointmentTimeChanged();
    partial void OnReasonChanging(string value);
    partial void OnReasonChanged();
    partial void OnIsApprovedChanging(bool value);
    partial void OnIsApprovedChanged();
    #endregion
	
	public brdhc_PatientAppointment()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(IsDbGenerated=true,AutoSync=AutoSync.OnInsert, Storage="_AppointmentId", DbType="UniqueIdentifier NOT NULL", IsPrimaryKey=true)]
	public System.Guid AppointmentId
	{
		get
		{
			return this._AppointmentId;
		}
		set
		{
			if ((this._AppointmentId != value))
			{
				this.OnAppointmentIdChanging(value);
				this.SendPropertyChanging();
				this._AppointmentId = value;
				this.SendPropertyChanged("AppointmentId");
				this.OnAppointmentIdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_PatientUserId", DbType="UniqueIdentifier NOT NULL")]
	public System.Guid PatientUserId
	{
		get
		{
			return this._PatientUserId;
		}
		set
		{
			if ((this._PatientUserId != value))
			{
				this.OnPatientUserIdChanging(value);
				this.SendPropertyChanging();
				this._PatientUserId = value;
				this.SendPropertyChanged("PatientUserId");
				this.OnPatientUserIdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DoctorUserId", DbType="UniqueIdentifier NOT NULL")]
	public System.Guid DoctorUserId
	{
		get
		{
			return this._DoctorUserId;
		}
		set
		{
			if ((this._DoctorUserId != value))
			{
				this.OnDoctorUserIdChanging(value);
				this.SendPropertyChanging();
				this._DoctorUserId = value;
				this.SendPropertyChanged("DoctorUserId");
				this.OnDoctorUserIdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AppointmentDate", DbType="Date NOT NULL")]
	public System.DateTime AppointmentDate
	{
		get
		{
			return this._AppointmentDate;
		}
		set
		{
			if ((this._AppointmentDate != value))
			{
				this.OnAppointmentDateChanging(value);
				this.SendPropertyChanging();
				this._AppointmentDate = value;
				this.SendPropertyChanged("AppointmentDate");
				this.OnAppointmentDateChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AppointmentTime", DbType="VarChar(10) NOT NULL", CanBeNull=false)]
	public string AppointmentTime
	{
		get
		{
			return this._AppointmentTime;
		}
		set
		{
			if ((this._AppointmentTime != value))
			{
				this.OnAppointmentTimeChanging(value);
				this.SendPropertyChanging();
				this._AppointmentTime = value;
				this.SendPropertyChanged("AppointmentTime");
				this.OnAppointmentTimeChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Reason", DbType="VarChar(MAX) NOT NULL", CanBeNull=false)]
	public string Reason
	{
		get
		{
			return this._Reason;
		}
		set
		{
			if ((this._Reason != value))
			{
				this.OnReasonChanging(value);
				this.SendPropertyChanging();
				this._Reason = value;
				this.SendPropertyChanged("Reason");
				this.OnReasonChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IsApproved", DbType="Bit NOT NULL")]
	public bool IsApproved
	{
		get
		{
			return this._IsApproved;
		}
		set
		{
			if ((this._IsApproved != value))
			{
				this.OnIsApprovedChanging(value);
				this.SendPropertyChanging();
				this._IsApproved = value;
				this.SendPropertyChanged("IsApproved");
				this.OnIsApprovedChanged();
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

public partial class sp_SearchAppsByPatientNameResult
{
	
	private string _DoctorName;
	
	private System.Guid _AppointmentId;
	
	private System.Guid _PatientUserId;
	
	private System.Guid _DoctorUserId;
	
	private string _PatientName;
	
	private string _Reason;
	
	private string _AppointmentDate;
	
	private string _AppointmentTime;
	
	private string _Status;
	
	public sp_SearchAppsByPatientNameResult()
	{
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DoctorName", DbType="VarChar(101) NOT NULL", CanBeNull=false)]
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
				this._DoctorName = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AppointmentId", DbType="UniqueIdentifier NOT NULL")]
	public System.Guid AppointmentId
	{
		get
		{
			return this._AppointmentId;
		}
		set
		{
			if ((this._AppointmentId != value))
			{
				this._AppointmentId = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_PatientUserId", DbType="UniqueIdentifier NOT NULL")]
	public System.Guid PatientUserId
	{
		get
		{
			return this._PatientUserId;
		}
		set
		{
			if ((this._PatientUserId != value))
			{
				this._PatientUserId = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DoctorUserId", DbType="UniqueIdentifier NOT NULL")]
	public System.Guid DoctorUserId
	{
		get
		{
			return this._DoctorUserId;
		}
		set
		{
			if ((this._DoctorUserId != value))
			{
				this._DoctorUserId = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_PatientName", DbType="VarChar(101) NOT NULL", CanBeNull=false)]
	public string PatientName
	{
		get
		{
			return this._PatientName;
		}
		set
		{
			if ((this._PatientName != value))
			{
				this._PatientName = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Reason", DbType="VarChar(MAX) NOT NULL", CanBeNull=false)]
	public string Reason
	{
		get
		{
			return this._Reason;
		}
		set
		{
			if ((this._Reason != value))
			{
				this._Reason = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AppointmentDate", DbType="VarChar(10)")]
	public string AppointmentDate
	{
		get
		{
			return this._AppointmentDate;
		}
		set
		{
			if ((this._AppointmentDate != value))
			{
				this._AppointmentDate = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AppointmentTime", DbType="VarChar(10) NOT NULL", CanBeNull=false)]
	public string AppointmentTime
	{
		get
		{
			return this._AppointmentTime;
		}
		set
		{
			if ((this._AppointmentTime != value))
			{
				this._AppointmentTime = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Status", DbType="VarChar(8) NOT NULL", CanBeNull=false)]
	public string Status
	{
		get
		{
			return this._Status;
		}
		set
		{
			if ((this._Status != value))
			{
				this._Status = value;
			}
		}
	}
}

public partial class sp_GetBookedTimeResult
{
	
	private string _AppointmentTime;
	
	public sp_GetBookedTimeResult()
	{
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AppointmentTime", DbType="VarChar(10) NOT NULL", CanBeNull=false)]
	public string AppointmentTime
	{
		get
		{
			return this._AppointmentTime;
		}
		set
		{
			if ((this._AppointmentTime != value))
			{
				this._AppointmentTime = value;
			}
		}
	}
}
#pragma warning restore 1591
