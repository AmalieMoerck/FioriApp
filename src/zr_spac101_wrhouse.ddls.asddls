@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Warehouse table data definition'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SPAC101_WRHOUSE as select from zspac101_wrhouse
composition [0..*] of ZR_SPAC101_STOCK as _Stock
{
  key warehouse_id as WarehouseId,
  warehouse_name as WarehouseName,
  warehouse_adress as WarehouseAdress,
  warehouse_city as WarehouseCity,
  warehouse_postcode as WarehousePostcode,
  _Stock // Make association public
}
