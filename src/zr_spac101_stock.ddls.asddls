@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface view for stock'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_SPAC101_STOCK as select from zspac101_stock
association to parent ZR_SPAC101_WRHOUSE as _Warehouse on $projection.WarehouseId = _Warehouse.WarehouseId
association [1..1] to ZR_SPAC101_PROD as _Product on $projection.ProductId = _Product.ProductId
{
  key warehouse_id as WarehouseId,
  key product_id as ProductId,
  amount as Amount,
  
  _Product.ProductName as ProductName,
  
  _Warehouse,
  _Product
}
