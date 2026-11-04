@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Data definition'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SPAC101_STOCK as select from zspac101_stock
{
  key warehouse_id as WarehouseId,
  key product_id as ProductId,
  amount as Amount
}
