@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product table projection view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_SPAC101_PROD
  provider contract transactional_query as projection on ZR_SPAC101_PROD
{
  key ProductId,
  key ProductName,
  ProductDescription,
  @Semantics.amount.currencyCode: 'Currency'
  ProductPrice,
  Currency
}
