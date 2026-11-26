@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for stock'
@ObjectModel.resultSet.sizeCategory: #XS
@Metadata.ignorePropagatedAnnotations: true


define root view entity ZR_SPAC101_STOCK as select from zspac101_stock
association [0..1] to ZR_SPAC101_WRHOUSE as _Warehouse on $projection.WarehouseId = _Warehouse.WarehouseId
association [0..1] to ZR_SPAC101_PROD as _Product on $projection.ProductId = _Product.ProductId


{

  @ObjectModel.text.element: ['WarehouseName']
  key warehouse_id   as WarehouseId,

  key product_id as ProductId,

  amount as Amount,
  
  case
    when amount = 0 then 'Out of stock'
    when amount <= 5 then 'Low stock'
    else 'In stock'
  end as StockStatus,
  
  case
    when amount = 0 then 1
    when amount <= 5 then 2
    else 3
  end as StockStatusCriticality, 

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
