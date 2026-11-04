@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_SPAC101_STOCK
  provider contract transactional_query as projection on ZR_SPAC101_STOCK
{
  key WarehouseId,
  key ProductId,
  Amount
}
