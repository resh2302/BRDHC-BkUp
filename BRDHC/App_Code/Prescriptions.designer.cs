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
public partial class prescriptionsDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Insertbrdhc_PatientPrescription(brdhc_PatientPrescription instance);
  partial void Updatebrdhc_PatientPrescription(brdhc_PatientPrescription instance);
  partial void Deletebrdhc_PatientPrescription(brdhc_PatientPrescription instance);
  #endregion
	
	public prescriptionsDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["myCon"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public prescriptionsDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public prescriptionsDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public prescriptionsDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public prescriptionsDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<brdhc_PatientPrescription> brdhc_PatientPrescriptions
	{
		get
		{
			return this.GetTable<brdhc_PatientPrescription>();
		}
	}
	
	public System.Data.Linq.Table<brdhc_PrescriptionDetail> brdhc_PrescriptionDetails
	{
		get
		{
			return this.GetTable<brdhc_PrescriptionDetail>();
		}
	}
	
	[global::System.Data.Linq.Mapping.FunctionAttribute(Name="dbo.sp_SearchPatientPrescription")]
	public ISingleResult<sp_SearchPatientPrescriptionResult> sp_SearchPatientPrescription([global::System.Data.Linq.Mapping.ParameterAttribute(Name="AppointmentId", DbType="Int")] System.Nullable<int> appointmentId)
	{
		IExecuteResult result = this.ExecuteMethodCall(this, ((MethodInfo)(MethodInfo.GetCurrentMethod())), appointmentId);
		return ((ISingleResult<sp_SearchPatientPrescriptionResult>)(result.ReturnValue));
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.brdhc_PatientPrescriptions")]
public partial class brdhc_PatientPrescription : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private int _PrescriptionId;
	
	private int _AppointmentId;
	
	private int _Repeat;
	
	private System.DateTime _DateWritten;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnPrescriptionIdChanging(int value);
    partial void OnPrescriptionIdChanged();
    partial void OnAppointmentIdChanging(int value);
    partial void OnAppointmentIdChanged();
    partial void OnRepeatChanging(int value);
    partial void OnRepeatChanged();
    partial void OnDateWrittenChanging(System.DateTime value);
    partial void OnDateWrittenChanged();
    #endregion
	
	public brdhc_PatientPrescription()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_PrescriptionId", AutoSync=AutoSync.OnInsert, DbType="Int NOT NULL IDENTITY", IsPrimaryKey=true, IsDbGenerated=true)]
	public int PrescriptionId
	{
		get
		{
			return this._PrescriptionId;
		}
		set
		{
			if ((this._PrescriptionId != value))
			{
				this.OnPrescriptionIdChanging(value);
				this.SendPropertyChanging();
				this._PrescriptionId = value;
				this.SendPropertyChanged("PrescriptionId");
				this.OnPrescriptionIdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AppointmentId", DbType="Int NOT NULL")]
	public int AppointmentId
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
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Repeat", DbType="Int NOT NULL")]
	public int Repeat
	{
		get
		{
			return this._Repeat;
		}
		set
		{
			if ((this._Repeat != value))
			{
				this.OnRepeatChanging(value);
				this.SendPropertyChanging();
				this._Repeat = value;
				this.SendPropertyChanged("Repeat");
				this.OnRepeatChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DateWritten", DbType="Date NOT NULL")]
	public System.DateTime DateWritten
	{
		get
		{
			return this._DateWritten;
		}
		set
		{
			if ((this._DateWritten != value))
			{
				this.OnDateWrittenChanging(value);
				this.SendPropertyChanging();
				this._DateWritten = value;
				this.SendPropertyChanged("DateWritten");
				this.OnDateWrittenChanged();
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

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.brdhc_PrescriptionDetails")]
public partial class brdhc_PrescriptionDetail
{
	
	private int _PrescriptionId;
	
	private string _Medicine;
	
	private string _Timings;
	
	private System.Nullable<int> _Days;
	
	private System.Nullable<int> _Quantity;
	
	public brdhc_PrescriptionDetail()
	{
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_PrescriptionId", DbType="Int NOT NULL")]
	public int PrescriptionId
	{
		get
		{
			return this._PrescriptionId;
		}
		set
		{
			if ((this._PrescriptionId != value))
			{
				this._PrescriptionId = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Medicine", DbType="VarChar(100) NOT NULL", CanBeNull=false)]
	public string Medicine
	{
		get
		{
			return this._Medicine;
		}
		set
		{
			if ((this._Medicine != value))
			{
				this._Medicine = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Timings", DbType="VarChar(100)")]
	public string Timings
	{
		get
		{
			return this._Timings;
		}
		set
		{
			if ((this._Timings != value))
			{
				this._Timings = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Days", DbType="Int")]
	public System.Nullable<int> Days
	{
		get
		{
			return this._Days;
		}
		set
		{
			if ((this._Days != value))
			{
				this._Days = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Quantity", DbType="Int")]
	public System.Nullable<int> Quantity
	{
		get
		{
			return this._Quantity;
		}
		set
		{
			if ((this._Quantity != value))
			{
				this._Quantity = value;
			}
		}
	}
}

public partial class sp_SearchPatientPrescriptionResult
{
	
	private int _AppointmentId;
	
	private string _PatientName;
	
	private string _HealthCard;
	
	private string _DoctorName;
	
	private System.Nullable<int> _PrescriptionId;
	
	private System.Nullable<int> _Repeat;
	
	private System.Nullable<System.DateTime> _DateWritten;
	
	public sp_SearchPatientPrescriptionResult()
	{
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AppointmentId", DbType="Int NOT NULL")]
	public int AppointmentId
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
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_HealthCard", DbType="VarChar(20) NOT NULL", CanBeNull=false)]
	public string HealthCard
	{
		get
		{
			return this._HealthCard;
		}
		set
		{
			if ((this._HealthCard != value))
			{
				this._HealthCard = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DoctorName", DbType="VarChar(101)")]
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
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_PrescriptionId", DbType="Int")]
	public System.Nullable<int> PrescriptionId
	{
		get
		{
			return this._PrescriptionId;
		}
		set
		{
			if ((this._PrescriptionId != value))
			{
				this._PrescriptionId = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Repeat", DbType="Int")]
	public System.Nullable<int> Repeat
	{
		get
		{
			return this._Repeat;
		}
		set
		{
			if ((this._Repeat != value))
			{
				this._Repeat = value;
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_DateWritten", DbType="Date")]
	public System.Nullable<System.DateTime> DateWritten
	{
		get
		{
			return this._DateWritten;
		}
		set
		{
			if ((this._DateWritten != value))
			{
				this._DateWritten = value;
			}
		}
	}
}
#pragma warning restore 1591
