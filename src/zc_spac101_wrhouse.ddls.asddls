@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Warehouse table projection view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_SPAC101_WRHOUSE
  provider contract transactional_query as projection on ZR_SPAC101_WRHOUSE
{
  key WarehouseId,
  WarehouseName,
  WarehouseAdress,
  WarehouseCity,
  WarehousePostcode,
  
  _Stock : redirected to composition child ZC_SPAC101_STOCK 
}

