﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;



[global::System.Data.Linq.Mapping.DatabaseAttribute(Name="DB_65818_brdhc")]
public partial class giftShopStoreClassDataContext : System.Data.Linq.DataContext
{
	
	private static System.Data.Linq.Mapping.MappingSource mappingSource = new AttributeMappingSource();
	
  #region Extensibility Method Definitions
  partial void OnCreated();
  partial void Insertbrdhc_GiftShopStore(brdhc_GiftShopStore instance);
  partial void Updatebrdhc_GiftShopStore(brdhc_GiftShopStore instance);
  partial void Deletebrdhc_GiftShopStore(brdhc_GiftShopStore instance);
  #endregion
	
	public giftShopStoreClassDataContext() : 
			base(global::System.Configuration.ConfigurationManager.ConnectionStrings["myCon"].ConnectionString, mappingSource)
	{
		OnCreated();
	}
	
	public giftShopStoreClassDataContext(string connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public giftShopStoreClassDataContext(System.Data.IDbConnection connection) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public giftShopStoreClassDataContext(string connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public giftShopStoreClassDataContext(System.Data.IDbConnection connection, System.Data.Linq.Mapping.MappingSource mappingSource) : 
			base(connection, mappingSource)
	{
		OnCreated();
	}
	
	public System.Data.Linq.Table<brdhc_GiftShopStore> brdhc_GiftShopStores
	{
		get
		{
			return this.GetTable<brdhc_GiftShopStore>();
		}
	}
}

[global::System.Data.Linq.Mapping.TableAttribute(Name="dbo.brdhc_GiftShopStore")]
public partial class brdhc_GiftShopStore : INotifyPropertyChanging, INotifyPropertyChanged
{
	
	private static PropertyChangingEventArgs emptyChangingEventArgs = new PropertyChangingEventArgs(String.Empty);
	
	private System.Guid _BouquetID;
	
	private string _Name;
	
	private string _Picture;
	
	private string _Price;
	
    #region Extensibility Method Definitions
    partial void OnLoaded();
    partial void OnValidate(System.Data.Linq.ChangeAction action);
    partial void OnCreated();
    partial void OnBouquetIDChanging(System.Guid value);
    partial void OnBouquetIDChanged();
    partial void OnNameChanging(string value);
    partial void OnNameChanged();
    partial void OnPictureChanging(string value);
    partial void OnPictureChanged();
    partial void OnPriceChanging(string value);
    partial void OnPriceChanged();
    #endregion
	
	public brdhc_GiftShopStore()
	{
		OnCreated();
	}

    [global::System.Data.Linq.Mapping.ColumnAttribute(IsDbGenerated = true, AutoSync = AutoSync.OnInsert, Storage = "_BouquetID", DbType = "UniqueIdentifier NOT NULL", IsPrimaryKey = true)]
	public System.Guid BouquetID
	{
		get
		{
			return this._BouquetID;
		}
		set
		{
			if ((this._BouquetID != value))
			{
				this.OnBouquetIDChanging(value);
				this.SendPropertyChanging();
				this._BouquetID = value;
				this.SendPropertyChanged("BouquetID");
				this.OnBouquetIDChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Name", DbType="VarChar(50) NOT NULL", CanBeNull=false)]
	public string Name
	{
		get
		{
			return this._Name;
		}
		set
		{
			if ((this._Name != value))
			{
				this.OnNameChanging(value);
				this.SendPropertyChanging();
				this._Name = value;
				this.SendPropertyChanged("Name");
				this.OnNameChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Picture", DbType="VarChar(100) NOT NULL", CanBeNull=false)]
	public string Picture
	{
		get
		{
			return this._Picture;
		}
		set
		{
			if ((this._Picture != value))
			{
				this.OnPictureChanging(value);
				this.SendPropertyChanging();
				this._Picture = value;
				this.SendPropertyChanged("Picture");
				this.OnPictureChanged();
			}
		}
	}
	
	[global::System.Data.Linq.Mapping.ColumnAttribute(Storage="_Price", DbType="VarChar(20) NOT NULL", CanBeNull=false)]
	public string Price
	{
		get
		{
			return this._Price;
		}
		set
		{
			if ((this._Price != value))
			{
				this.OnPriceChanging(value);
				this.SendPropertyChanging();
				this._Price = value;
				this.SendPropertyChanged("Price");
				this.OnPriceChanged();
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