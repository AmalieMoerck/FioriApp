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
      id: 'ProductDetails',
      purpose: #STANDARD,
      type: #IDENTIFICATION_REFERENCE,
      label: 'Produktdetaljer',
      position: 10
    }
  ]
  @EndUserText.label: 'Warehouse ID'
  @UI.lineItem: [ { position: 10, label: 'Lager-ID' } ]
  @UI.identification: [ { position: 10, label: 'Lager-ID' } ]
  key WarehouseId,

  @EndUserText.label: 'Warehouse Name'
  @UI.lineItem: [ { position: 20, label: 'Lager navn' } ]
  @UI.identification: [ { position: 20, label: 'Lager navn' } ]
  WarehouseName,

  @EndUserText.label: 'Warehouse Address'
  @UI.lineItem: [ { position: 30, label: 'Lager adresse' } ]
  @UI.identification: [ { position: 30, label: 'Lager Adresse' } ]
  WarehouseAdress,

  @EndUserText.label: 'Warehouse City'
  @UI.lineItem: [ { position: 40, label: 'By' } ]
  @UI.identification: [ { position: 40, label: 'By' } ]
  WarehouseCity,

  @EndUserText.label: 'Warehouse Postcode'
  @UI.lineItem: [ { position: 50, label: 'Postnummer' } ]
  @UI.identification: [ { position: 50, label: 'Postnummer' } ]
  WarehousePostcode
}


