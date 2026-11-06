@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product table'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SPAC101_PROD as select from zspac101_prod
//composition of target_data_source_name as _association_name
{
  key product_id as ProductId,
  key product_name as ProductName,
  product_description as ProductDescription,
  @Semantics.amount.currencyCode: 'Currency'
  product_price as ProductPrice,
  currency as Currency
  //_association_name // Make association public
}
