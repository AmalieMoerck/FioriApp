@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for Stock'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@UI: {
  headerInfo: {
    typeName: 'Inventory',
    typeNamePlural: 'Inventory',
    title: { type: #STANDARD, value: 'ProductName' },
    description: { type: #STANDARD, value: 'WarehouseName' }
  }
}
define root view entity ZC_SPAC101_STOCK 
provider contract transactional_query as projection on ZR_SPAC101_STOCK
{

  @UI.facet: [ 
  { id: 'StockDetails',
  purpose: #STANDARD,
  type: #IDENTIFICATION_REFERENCE,
  label: 'Inventory information',
  position: 10 },
  
  { id: 'ProductDetails',
  purpose: #STANDARD,
  type: #FIELDGROUP_REFERENCE,
  targetQualifier: 'Product',
  label: 'Product details',
  position: 20 },
   { id: 'WarehouseDetails',
  purpose: #STANDARD,
  type: #FIELDGROUP_REFERENCE,
  targetQualifier: 'Warehouse',
  label: 'Warehouse details',
  position: 30 }
  ]


  @EndUserText.label: 'Warehouse ID'
  @UI.lineItem: [{position: 10}]
  @UI.identification: [{ position: 10 }]
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SPAC101_WRHOUSE', element: 'WarehouseId' } }]
  key WarehouseId,

  @EndUserText.label: 'Product ID'
  @UI.lineItem: [{position: 20}]
  @UI.identification: [{ position: 20 }]
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SPAC101_PROD', element: 'ProductId' } }]
  key ProductId,

  @EndUserText.label: 'Quantity'
  @UI.lineItem: [{ position: 30 }]
//  @UI.identification: [{ position: 30 }]
  @UI.fieldGroup: [{ qualifier: 'Product', position: 10  }]
  Amount,
  
  @EndUserText.label: 'Stock Status'
  @UI.lineItem: [{ position: 35, criticality: 'StockStatusCriticality' }]
  @UI.identification: [{ position: 35, criticality: 'StockStatusCriticality' }]
  StockStatus,

  @UI.hidden: true
  StockStatusCriticality,

  @UI.hidden: true
  CreatedBy,
  @UI.hidden: true
  CreatedAt,
  @UI.hidden: true
  LastChangedAt,
  @UI.hidden: true
  LocalLastChangedAt,

  @EndUserText.label: 'Product Name'
  @UI.lineItem: [{ position: 40 }]
//  @UI.identification: [{ position: 40 }]
  @UI.fieldGroup: [{ qualifier: 'Product', position: 20  }]
//  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SPAC101_PROD', element: 'ProductName' } }]
  ProductName,

  @EndUserText.label: 'Product Description'
//  @UI.lineItem: [{ position: 50 }]
//  @UI.identification: [{ position: 50 }]
  @UI.fieldGroup: [{ qualifier: 'Product', position: 30  }]
  ProductDescription,

  @EndUserText.label: 'Price'
//  @UI.lineItem: [{ position: 60 }]
  @UI.fieldGroup: [{ qualifier: 'Product', position: 40 }]
  @Semantics.amount.currencyCode : 'Currency'
  ProductPrice,
  Currency,
  
  @EndUserText.label: 'Warehouse Name'
  @UI.lineItem: [{ position: 50 }]
//  @UI.identification: [{ position: 70 }]
  @UI.fieldGroup: [{ qualifier: 'Warehouse', position: 10 }]
//  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SPAC101_WRHOUSE', element: 'WarehouseName' } }]
  WarehouseName,

  @EndUserText.label: 'Address'
  @UI.fieldGroup: [{ qualifier: 'Warehouse', position: 20 }]
  WarehouseAdress,

  @EndUserText.label: 'City'
  @UI.fieldGroup: [{ qualifier: 'Warehouse', position: 30 }]
//  @UI.lineItem: [{ position: 80 }]
  _Warehouse.WarehouseCity as WarehouseCity,

  @EndUserText.label: 'Post code'
  @UI.fieldGroup: [{ qualifier: 'Warehouse', position: 40  }]
//  @UI.lineItem: [{ position: 90 }]
  WarehousePostcode,
 
       
  _Warehouse,
  _Product
}


