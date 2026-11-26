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
      label: 'Product Details',
      position: 10
    }
  ]

  @EndUserText.label: 'Product ID'
  @UI.lineItem: [ { position: 10, label: 'Product ID' } ]
  @UI.identification: [ { position: 10, label: 'Product ID' } ]
  key ProductId,

  @EndUserText.label: 'Product Name'
  @UI.lineItem: [ { position: 20, label: 'Product Name' } ]
  @UI.identification: [ { position: 20, label: 'Product Name' } ]
  ProductName,

  @UI.lineItem: [ { position: 30, label: 'Description' } ]
  @UI.identification: [ { position: 30, label: 'Description' } ]
  ProductDescription,

  @UI.lineItem: [ { position: 40, label: 'Price' } ]
  @UI.identification: [ { position: 40, label: 'Price' } ]
  @Semantics.amount.currencyCode : 'Currency'
  ProductPrice,

  @UI.identification: [ { position: 50, label: 'Currency' } ]
  Currency,
  
  @UI.hidden: true
  CreatedBy,
  @UI.hidden: true
  CreatedAt,
  @UI.hidden: true
  LastChangedAt,
  @UI.hidden: true
  LocalLastChangedAt
}
