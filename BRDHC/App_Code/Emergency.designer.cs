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
public partial class EmergencyDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Insertbrdhc_Emergency(brdhc_Emergency instance);
  partial void Updatebrdhc_Emergency(brdhc_Emergency instance);
  partial void Deletebrdhc_Emergency(brdhc_Emergency instance);
  #endregion
	
	public EmergencyDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["myCon"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public EmergencyDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public EmergencyDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public EmergencyDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public EmergencyDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<brdhc_Emergency> brdhc_Emergencies
	{
		get
		{
			return this.GetTable<brdhc_Emergency>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.brdhc_Emergency")]
public partial class brdhc_Emergency : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private System.Guid _EmergencyID;
	
	private System.TimeSpan _WaitTime;
	
	private System.DateTime _AddedOn;
	
	private string _UpdatedBy;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnEmergencyIDChanging(System.Guid value);
    partial void OnEmergencyIDChanged();
    partial void OnWaitTimeChanging(System.TimeSpan value);
    partial void OnWaitTimeChanged();
    partial void OnAddedOnChanging(System.DateTime value);
    partial void OnAddedOnChanged();
    partial void OnUpdatedByChanging(string value);
    partial void OnUpdatedByChanged();
    #endregion
	
	public brdhc_Emergency()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_EmergencyID", DbType="UniqueIdentifier NOT NULL", IsPrimaryKey=true)]
	public System.Guid EmergencyID
	{
		get
		{
			return this._EmergencyID;
		}
		set
		{
			if ((this._EmergencyID != value))
			{
				this.OnEmergencyIDChanging(value);
				this.SendPropertyChanging();
				this._EmergencyID = value;
				this.SendPropertyChanged("EmergencyID");
				this.OnEmergencyIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_WaitTime", DbType="Time NOT NULL")]
	public System.TimeSpan WaitTime
	{
		get
		{
			return this._WaitTime;
		}
		set
		{
			if ((this._WaitTime != value))
			{
				this.OnWaitTimeChanging(value);
				this.SendPropertyChanging();
				this._WaitTime = value;
				this.SendPropertyChanged("WaitTime");
				this.OnWaitTimeChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AddedOn", DbType="DateTime NOT NULL")]
	public System.DateTime AddedOn
	{
		get
		{
			return this._AddedOn;
		}
		set
		{
			if ((this._AddedOn != value))
			{
				this.OnAddedOnChanging(value);
				this.SendPropertyChanging();
				this._AddedOn = value;
				this.SendPropertyChanged("AddedOn");
				this.OnAddedOnChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_UpdatedBy", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
	public string UpdatedBy
	{
		get
		{
			return this._UpdatedBy;
		}
		set
		{
			if ((this._UpdatedBy != value))
			{
				this.OnUpdatedByChanging(value);
				this.SendPropertyChanging();
				this._UpdatedBy = value;
				this.SendPropertyChanged("UpdatedBy");
				this.OnUpdatedByChanged();
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
=======
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
public partial class EmergencyDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Insertbrdhc_Emergency(brdhc_Emergency instance);
  partial void Updatebrdhc_Emergency(brdhc_Emergency instance);
  partial void Deletebrdhc_Emergency(brdhc_Emergency instance);
  #endregion
	
	public EmergencyDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["myCon"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public EmergencyDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public EmergencyDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public EmergencyDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public EmergencyDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<brdhc_Emergency> brdhc_Emergencies
	{
		get
		{
			return this.GetTable<brdhc_Emergency>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.brdhc_Emergency")]
public partial class brdhc_Emergency : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private System.Guid _EmergencyID;
	
	private System.TimeSpan _WaitTime;
	
	private System.DateTime _AddedOn;
	
	private string _UpdatedBy;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnEmergencyIDChanging(System.Guid value);
    partial void OnEmergencyIDChanged();
    partial void OnWaitTimeChanging(System.TimeSpan value);
    partial void OnWaitTimeChanged();
    partial void OnAddedOnChanging(System.DateTime value);
    partial void OnAddedOnChanged();
    partial void OnUpdatedByChanging(string value);
    partial void OnUpdatedByChanged();
    #endregion
	
	public brdhc_Emergency()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_EmergencyID", DbType="UniqueIdentifier NOT NULL", IsPrimaryKey=true)]
	public System.Guid EmergencyID
	{
		get
		{
			return this._EmergencyID;
		}
		set
		{
			if ((this._EmergencyID != value))
			{
				this.OnEmergencyIDChanging(value);
				this.SendPropertyChanging();
				this._EmergencyID = value;
				this.SendPropertyChanged("EmergencyID");
				this.OnEmergencyIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_WaitTime", DbType="Time NOT NULL")]
	public System.TimeSpan WaitTime
	{
		get
		{
			return this._WaitTime;
		}
		set
		{
			if ((this._WaitTime != value))
			{
				this.OnWaitTimeChanging(value);
				this.SendPropertyChanging();
				this._WaitTime = value;
				this.SendPropertyChanged("WaitTime");
				this.OnWaitTimeChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_AddedOn", DbType="DateTime NOT NULL")]
	public System.DateTime AddedOn
	{
		get
		{
			return this._AddedOn;
		}
		set
		{
			if ((this._AddedOn != value))
			{
				this.OnAddedOnChanging(value);
				this.SendPropertyChanging();
				this._AddedOn = value;
				this.SendPropertyChanged("AddedOn");
				this.OnAddedOnChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_UpdatedBy", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
	public string UpdatedBy
	{
		get
		{
			return this._UpdatedBy;
		}
		set
		{
			if ((this._UpdatedBy != value))
			{
				this.OnUpdatedByChanging(value);
				this.SendPropertyChanging();
				this._UpdatedBy = value;
				this.SendPropertyChanged("UpdatedBy");
				this.OnUpdatedByChanged();
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