@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@UI: {
  headerInfo: {
    typeName: 'Lager',
    typeNamePlural: 'Lagere',
    title: { type: #STANDARD, value: 'WarehouseName' },
    description: { type: #STANDARD, value: 'WarehouseId' }
  }
}
define root view entity ZC_SPAC101_WRHOUSE 
  provider contract transactional_query as projection on ZR_SPAC101_WRHOUSE
{
  @UI.facet: [
    {
      id: 'WarehouseDetails',
      purpose: #STANDARD,
      type: #IDENTIFICATION_REFERENCE,
      label: 'Warehouse Details',
      position: 10
    }
  ]
  @EndUserText.label: 'Warehouse ID'
  @UI.lineItem: [ { position: 10, label: 'Warehouse ID' } ]
  @UI.identification: [ { position: 10, label: 'Warehouse ID' } ]
  key WarehouseId,

  @EndUserText.label: 'Name'
  @UI.lineItem: [ { position: 20, label: 'Name' } ]
  @UI.identification: [ { position: 20, label: 'Name' } ]
  WarehouseName,

  @EndUserText.label: 'Address'
  @UI.lineItem: [ { position: 30, label: 'Address' } ]
  @UI.identification: [ { position: 30, label: 'Address' } ]
  WarehouseAdress,

  @EndUserText.label: 'City'
  @UI.lineItem: [ { position: 40, label: 'City' } ]
  @UI.identification: [ { position: 40, label: 'City' } ]
  WarehouseCity,

  @EndUserText.label: 'Postcode'
  @UI.lineItem: [ { position: 50, label: 'Postcode' } ]
  @UI.identification: [ { position: 50, label: 'Postcode' } ]
  WarehousePostcode
}


