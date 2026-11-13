@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Warehouse table data definition'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SPAC101_WRHOUSE as select from zspac101_wrhouse

{
  key warehouse_id as WarehouseId,
  warehouse_name as WarehouseName,
  warehouse_adress as WarehouseAdress,
  warehouse_city as WarehouseCity,
  warehouse_postcode as WarehousePostcode,
  local_created_by as CreatedBy,
  local_created_at as CreatedAt,
  last_changed_at as LastChangedAt,
  local_last_changed_at as LocalLastChangedAt
}
