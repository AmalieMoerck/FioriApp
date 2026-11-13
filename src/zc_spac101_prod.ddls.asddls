@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product projection view'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@UI: {
  headerInfo: {
    typeName: 'Produkt',
    typeNamePlural: 'Produkter',
    title: { type: #STANDARD, value: 'ProductName' },
    description: { type: #STANDARD, value: 'ProductId' }
  }
}
define root view entity ZC_SPAC101_PROD
  provider contract transactional_query
  as projection on ZR_SPAC101_PROD
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

  @EndUserText.label: 'Product ID'
  @UI.lineItem: [ { position: 10, label: 'Produkt-ID' } ]
  @UI.identification: [ { position: 10, label: 'Produkt-ID' } ]
  key ProductId,

  @EndUserText.label: 'Product Name'
  @UI.lineItem: [ { position: 20, label: 'Produktnavn' } ]
  @UI.identification: [ { position: 20, label: 'Produktnavn' } ]
  ProductName,

  @UI.lineItem: [ { position: 30, label: 'Beskrivelse' } ]
  @UI.identification: [ { position: 30, label: 'Beskrivelse' } ]
  ProductDescription,

  @UI.lineItem: [ { position: 40, label: 'Pris' } ]
  @UI.identification: [ { position: 40, label: 'Pris' } ]
  @Semantics.amount.currencyCode : 'Currency'
  ProductPrice,

  @UI.identification: [ { position: 50, label: 'Valuta' } ]
  Currency,
  
  CreatedBy,
  CreatedAt,
  LastChangedAt,
  LocalLastChangedAt
}
