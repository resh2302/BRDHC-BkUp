﻿#pragma warning disable 1591
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.18408
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
public partial class healthToolsDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Insertbrdhc_HealthTools_Quiz(brdhc_HealthTools_Quiz instance);
  partial void Updatebrdhc_HealthTools_Quiz(brdhc_HealthTools_Quiz instance);
  partial void Deletebrdhc_HealthTools_Quiz(brdhc_HealthTools_Quiz instance);
  #endregion
	
	public healthToolsDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["myCon"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public healthToolsDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public healthToolsDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public healthToolsDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public healthToolsDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<brdhc_HealthTools_Quiz> brdhc_HealthTools_Quizs
	{
		get
		{
			return this.GetTable<brdhc_HealthTools_Quiz>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.brdhc_HealthTools_Quiz")]
public partial class brdhc_HealthTools_Quiz : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private System.Guid _QuestionID;
	
	private string _THISname;
	
	private string _THISimage;
	
	private int _THIScalories;
	
	private int _THISfat;
	
	private string _THATname;
	
	private string _THATimage;
	
	private int _THATcalories;
	
	private int _THATfat;
	
	private string _Answer;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnQuestionIDChanging(System.Guid value);
    partial void OnQuestionIDChanged();
    partial void OnTHISnameChanging(string value);
    partial void OnTHISnameChanged();
    partial void OnTHISimageChanging(string value);
    partial void OnTHISimageChanged();
    partial void OnTHIScaloriesChanging(int value);
    partial void OnTHIScaloriesChanged();
    partial void OnTHISfatChanging(int value);
    partial void OnTHISfatChanged();
    partial void OnTHATnameChanging(string value);
    partial void OnTHATnameChanged();
    partial void OnTHATimageChanging(string value);
    partial void OnTHATimageChanged();
    partial void OnTHATcaloriesChanging(int value);
    partial void OnTHATcaloriesChanged();
    partial void OnTHATfatChanging(int value);
    partial void OnTHATfatChanged();
    partial void OnAnswerChanging(string value);
    partial void OnAnswerChanged();
    #endregion
	
	public brdhc_HealthTools_Quiz()
	{
		OnCreated();
	}

    [global::System.Data.Linq.Mapping.ColumnAttribute(AutoSync = AutoSync.OnInsert, IsDbGenerated = true, Storage = "_QuestionID", DbType = "UniqueIdentifier NOT NULL", IsPrimaryKey = true)]
	public System.Guid QuestionID
	{
		get
		{
			return this._QuestionID;
		}
		set
		{
			if ((this._QuestionID != value))
			{
				this.OnQuestionIDChanging(value);
				this.SendPropertyChanging();
				this._QuestionID = value;
				this.SendPropertyChanged("QuestionID");
				this.OnQuestionIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_THISname", DbType="VarChar(100) NOT NULL", CanBeNull=false)]
	public string THISname
	{
		get
		{
			return this._THISname;
		}
		set
		{
			if ((this._THISname != value))
			{
				this.OnTHISnameChanging(value);
				this.SendPropertyChanging();
				this._THISname = value;
				this.SendPropertyChanged("THISname");
				this.OnTHISnameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_THISimage", DbType="VarChar(100) NOT NULL", CanBeNull=false)]
	public string THISimage
	{
		get
		{
			return this._THISimage;
		}
		set
		{
			if ((this._THISimage != value))
			{
				this.OnTHISimageChanging(value);
				this.SendPropertyChanging();
				this._THISimage = value;
				this.SendPropertyChanged("THISimage");
				this.OnTHISimageChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_THIScalories", DbType="Int NOT NULL")]
	public int THIScalories
	{
		get
		{
			return this._THIScalories;
		}
		set
		{
			if ((this._THIScalories != value))
			{
				this.OnTHIScaloriesChanging(value);
				this.SendPropertyChanging();
				this._THIScalories = value;
				this.SendPropertyChanged("THIScalories");
				this.OnTHIScaloriesChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_THISfat", DbType="Int NOT NULL")]
	public int THISfat
	{
		get
		{
			return this._THISfat;
		}
		set
		{
			if ((this._THISfat != value))
			{
				this.OnTHISfatChanging(value);
				this.SendPropertyChanging();
				this._THISfat = value;
				this.SendPropertyChanged("THISfat");
				this.OnTHISfatChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_THATname", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
	public string THATname
	{
		get
		{
			return this._THATname;
		}
		set
		{
			if ((this._THATname != value))
			{
				this.OnTHATnameChanging(value);
				this.SendPropertyChanging();
				this._THATname = value;
				this.SendPropertyChanged("THATname");
				this.OnTHATnameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_THATimage", DbType="VarChar(100) NOT NULL", CanBeNull=false)]
	public string THATimage
	{
		get
		{
			return this._THATimage;
		}
		set
		{
			if ((this._THATimage != value))
			{
				this.OnTHATimageChanging(value);
				this.SendPropertyChanging();
				this._THATimage = value;
				this.SendPropertyChanged("THATimage");
				this.OnTHATimageChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_THATcalories", DbType="Int NOT NULL")]
	public int THATcalories
	{
		get
		{
			return this._THATcalories;
		}
		set
		{
			if ((this._THATcalories != value))
			{
				this.OnTHATcaloriesChanging(value);
				this.SendPropertyChanging();
				this._THATcalories = value;
				this.SendPropertyChanged("THATcalories");
				this.OnTHATcaloriesChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_THATfat", DbType="Int NOT NULL")]
	public int THATfat
	{
		get
		{
			return this._THATfat;
		}
		set
		{
			if ((this._THATfat != value))
			{
				this.OnTHATfatChanging(value);
				this.SendPropertyChanging();
				this._THATfat = value;
				this.SendPropertyChanged("THATfat");
				this.OnTHATfatChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Answer", DbType="VarChar(100) NOT NULL", CanBeNull=false)]
	public string Answer
	{
		get
		{
			return this._Answer;
		}
		set
		{
			if ((this._Answer != value))
			{
				this.OnAnswerChanging(value);
				this.SendPropertyChanging();
				this._Answer = value;
				this.SendPropertyChanged("Answer");
				this.OnAnswerChanged();
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
