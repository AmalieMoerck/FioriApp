@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for stock'
@Metadata.ignorePropagatedAnnotations: true


define root view entity ZR_SPAC101_STOCK as select from zspac101_stock
association [0..1] to ZR_SPAC101_WRHOUSE as _Warehouse on $projection.WarehouseId = _Warehouse.WarehouseId
association [0..1] to ZR_SPAC101_PROD as _Product on $projection.ProductId = _Product.ProductId

{


  key warehouse_id as WarehouseId,


  key product_id as ProductId,

  amount as Amount,

  local_created_by as CreatedBy,
  local_created_at as CreatedAt,
  last_changed_at as LastChangedAt,
  local_last_changed_at as LocalLastChangedAt,

  _Product.ProductName as ProductName,


  _Product.ProductDescription as ProductDescription,

  @Semantics.amount.currencyCode : 'Currency'
  _Product.ProductPrice as ProductPrice,
  
  _Product.Currency as Currency,
  

  _Warehouse.WarehouseName as WarehouseName,


  _Warehouse.WarehouseAdress as WarehouseAdress,

  _Warehouse.WarehouseCity as WarehouseCity,

  _Warehouse.WarehousePostcode as WarehousePostcode,
       
  _Warehouse,
  _Product
}


//  @UI.facet: [ 
//  { id: 'StockDetails',
//  purpose: #STANDARD,
//  type: #IDENTIFICATION_REFERENCE,
//  label: 'Stock Details',
//  position: 10 } ]
//
//
//  key warehouse_id as WarehouseId,
//
//
//  key product_id as ProductId,
//
//  @EndUserText.label: 'Amount'
//  @UI.lineItem: [{ position: 60 }]
//  @UI.identification: [{ position: 30 }]
//  amount as Amount,
//
//  local_created_by as CreatedBy,
//  local_created_at as CreatedAt,
//  last_changed_at as LastChangedAt,
//  local_last_changed_at as LocalLastChangedAt,
//
//  @EndUserText.label: 'Product Name'
//  @UI.lineItem: [{ position: 10 }]
//  @UI.identification: [{ position: 40 }]
//  _Product.ProductName as ProductName,
//
//  @EndUserText.label: 'Product Description'
//  @UI.lineItem: [{ position: 20 }]
//  @UI.identification: [{ position: 50 }]
//  _Product.ProductDescription as ProductDescription,
//
//  @EndUserText.label: 'Price'
//  @Semantics.amount.currencyCode : 'Currency'
//  _Product.ProductPrice as ProductPrice,
//  _Product.Currency as Currency,
//  
//  @EndUserText.label: 'Warehouse Name'
//  @UI.lineItem: [{ position: 30 }]
//  @UI.identification: [{ position: 60 }]
//  _Warehouse.WarehouseName as WarehouseName,
//
//  @EndUserText.label: 'Address'
//  _Warehouse.WarehouseAdress as WarehouseAdress,
//
//  @EndUserText.label: 'City'
//  @UI.lineItem: [{ position: 40 }]
//  _Warehouse.WarehouseCity as WarehouseCity,
//
//  @EndUserText.label: 'Post code'
//  @UI.lineItem: [{ position: 50 }]
//  _Warehouse.WarehousePostcode as WarehousePostcode,
//       
//  _Warehouse,
//  _Product
//}
