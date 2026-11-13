@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for Stock'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_SPAC101_STOCK 
provider contract transactional_query as projection on ZR_SPAC101_STOCK
{

  @UI.facet: [ 
  { id: 'StockDetails',
  purpose: #STANDARD,
  type: #IDENTIFICATION_REFERENCE,
  label: 'Stock Details',
  position: 10 } ]


  @EndUserText.label: 'Warehouse ID'
  @UI.identification: [{ position: 10 }]
  key WarehouseId,

  @EndUserText.label: 'Product ID'
  @UI.identification: [{ position: 20 }]
  key ProductId,

  @EndUserText.label: 'Amount'
  @UI.lineItem: [{ position: 60 }]
  @UI.identification: [{ position: 30 }]
  Amount,

  CreatedBy,
  CreatedAt,
  LastChangedAt,
  LocalLastChangedAt,

  @EndUserText.label: 'Product Name'
  @UI.lineItem: [{ position: 10 }]
  @UI.identification: [{ position: 40 }]
  ProductName,

  @EndUserText.label: 'Product Description'
  @UI.lineItem: [{ position: 20 }]
  @UI.identification: [{ position: 50 }]
  ProductDescription,

  @EndUserText.label: 'Price'
  @Semantics.amount.currencyCode : 'Currency'
  ProductPrice,
  Currency,
  
  @EndUserText.label: 'Warehouse Name'
  @UI.lineItem: [{ position: 30 }]
  @UI.identification: [{ position: 60 }]
  WarehouseName,

  @EndUserText.label: 'Address'
  WarehouseAdress,

  @EndUserText.label: 'City'
  @UI.lineItem: [{ position: 40 }]
  _Warehouse.WarehouseCity as WarehouseCity,

  @EndUserText.label: 'Post code'
  @UI.lineItem: [{ position: 50 }]
  WarehousePostcode,
       
  _Warehouse,
  _Product
}

//
//  key WarehouseId,
//  key ProductId,
//  Amount,
//  
//  ProductName,
//  ProductDescription,
//  @Semantics.amount.currencyCode: 'Currency'
//  ProductPrice,
//  Currency,
//      
//  WarehouseName,
//  WarehouseAdress,
//  WarehouseCity,
//  WarehousePostcode,
//  
//  CreatedBy,
//  CreatedAt,
//  LastChangedAt,
//  LocalLastChangedAt,
//
//  _Product,
//  _Warehouse
//}
