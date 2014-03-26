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
public partial class contactUsDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Insertbrdhc_ContactUs(brdhc_ContactUs instance);
  partial void Updatebrdhc_ContactUs(brdhc_ContactUs instance);
  partial void Deletebrdhc_ContactUs(brdhc_ContactUs instance);
  #endregion
	
	public contactUsDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["myCon"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public contactUsDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public contactUsDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public contactUsDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public contactUsDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<brdhc_ContactUs> brdhc_ContactUs
	{
		get
		{
			return this.GetTable<brdhc_ContactUs>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.brdhc_ContactUs")]
public partial class brdhc_ContactUs : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private System.Guid _ContactMessageId;
	
	private string _FirstName;
	
	private string _LastName;
	
	private string _Email;
	
	private string _Phone;
	
	private string _Message;
	
	private string _Subject;
	
	private bool _IsChecked;
	
	private System.DateTime _ContactDate;
	
	private System.Nullable<System.DateTime> _ReplyDate;
	
	private string _ReplyMessage;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnContactMessageIdChanging(System.Guid value);
    partial void OnContactMessageIdChanged();
    partial void OnFirstNameChanging(string value);
    partial void OnFirstNameChanged();
    partial void OnLastNameChanging(string value);
    partial void OnLastNameChanged();
    partial void OnEmailChanging(string value);
    partial void OnEmailChanged();
    partial void OnPhoneChanging(string value);
    partial void OnPhoneChanged();
    partial void OnMessageChanging(string value);
    partial void OnMessageChanged();
    partial void OnSubjectChanging(string value);
    partial void OnSubjectChanged();
    partial void OnIsCheckedChanging(bool value);
    partial void OnIsCheckedChanged();
    partial void OnContactDateChanging(System.DateTime value);
    partial void OnContactDateChanged();
    partial void OnReplyDateChanging(System.Nullable<System.DateTime> value);
    partial void OnReplyDateChanged();
    partial void OnReplyMessageChanging(string value);
    partial void OnReplyMessageChanged();
    #endregion
	
	public brdhc_ContactUs()
	{
		OnCreated();
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ContactMessageId", DbType="UniqueIdentifier NOT NULL", IsPrimaryKey=true)]
	public System.Guid ContactMessageId
	{
		get
		{
			return this._ContactMessageId;
		}
		set
		{
			if ((this._ContactMessageId != value))
			{
				this.OnContactMessageIdChanging(value);
				this.SendPropertyChanging();
				this._ContactMessageId = value;
				this.SendPropertyChanged("ContactMessageId");
				this.OnContactMessageIdChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_FirstName", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
	public string FirstName
	{
		get
		{
			return this._FirstName;
		}
		set
		{
			if ((this._FirstName != value))
			{
				this.OnFirstNameChanging(value);
				this.SendPropertyChanging();
				this._FirstName = value;
				this.SendPropertyChanged("FirstName");
				this.OnFirstNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_LastName", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
	public string LastName
	{
		get
		{
			return this._LastName;
		}
		set
		{
			if ((this._LastName != value))
			{
				this.OnLastNameChanging(value);
				this.SendPropertyChanging();
				this._LastName = value;
				this.SendPropertyChanged("LastName");
				this.OnLastNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Email", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
	public string Email
	{
		get
		{
			return this._Email;
		}
		set
		{
			if ((this._Email != value))
			{
				this.OnEmailChanging(value);
				this.SendPropertyChanging();
				this._Email = value;
				this.SendPropertyChanged("Email");
				this.OnEmailChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Phone", DbType="VarChar(15) NOT NULL", CanBeNull=false)]
	public string Phone
	{
		get
		{
			return this._Phone;
		}
		set
		{
			if ((this._Phone != value))
			{
				this.OnPhoneChanging(value);
				this.SendPropertyChanging();
				this._Phone = value;
				this.SendPropertyChanged("Phone");
				this.OnPhoneChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Message", DbType="VarChar(MAX) NOT NULL", CanBeNull=false)]
	public string Message
	{
		get
		{
			return this._Message;
		}
		set
		{
			if ((this._Message != value))
			{
				this.OnMessageChanging(value);
				this.SendPropertyChanging();
				this._Message = value;
				this.SendPropertyChanged("Message");
				this.OnMessageChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Subject", DbType="VarChar(100) NOT NULL", CanBeNull=false)]
	public string Subject
	{
		get
		{
			return this._Subject;
		}
		set
		{
			if ((this._Subject != value))
			{
				this.OnSubjectChanging(value);
				this.SendPropertyChanging();
				this._Subject = value;
				this.SendPropertyChanged("Subject");
				this.OnSubjectChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_IsChecked", DbType="Bit NOT NULL")]
	public bool IsChecked
	{
		get
		{
			return this._IsChecked;
		}
		set
		{
			if ((this._IsChecked != value))
			{
				this.OnIsCheckedChanging(value);
				this.SendPropertyChanging();
				this._IsChecked = value;
				this.SendPropertyChanged("IsChecked");
				this.OnIsCheckedChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ContactDate", DbType="DateTime NOT NULL")]
	public System.DateTime ContactDate
	{
		get
		{
			return this._ContactDate;
		}
		set
		{
			if ((this._ContactDate != value))
			{
				this.OnContactDateChanging(value);
				this.SendPropertyChanging();
				this._ContactDate = value;
				this.SendPropertyChanged("ContactDate");
				this.OnContactDateChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ReplyDate", DbType="DateTime")]
	public System.Nullable<System.DateTime> ReplyDate
	{
		get
		{
			return this._ReplyDate;
		}
		set
		{
			if ((this._ReplyDate != value))
			{
				this.OnReplyDateChanging(value);
				this.SendPropertyChanging();
				this._ReplyDate = value;
				this.SendPropertyChanged("ReplyDate");
				this.OnReplyDateChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_ReplyMessage", DbType="VarChar(MAX)")]
	public string ReplyMessage
	{
		get
		{
			return this._ReplyMessage;
		}
		set
		{
			if ((this._ReplyMessage != value))
			{
				this.OnReplyMessageChanging(value);
				this.SendPropertyChanging();
				this._ReplyMessage = value;
				this.SendPropertyChanged("ReplyMessage");
				this.OnReplyMessageChanged();
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
