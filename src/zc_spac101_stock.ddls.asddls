@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for Stock'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_SPAC101_STOCK as projection on ZR_SPAC101_STOCK
{
  key WarehouseId,
  key ProductId,
  Amount,
  
  ProductName,
  
  _Warehouse : redirected to parent ZC_SPAC101_WRHOUSE
}
