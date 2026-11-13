@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Product data definition'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_SPAC101_PROD as select from zspac101_prod

{
  key product_id as ProductId,
  product_name as ProductName,
  product_description as ProductDescription,
  @Semantics.amount.currencyCode : 'Currency'
  product_price as ProductPrice,
  currency as Currency,
  local_created_by as CreatedBy,
  local_created_at as CreatedAt,
  last_changed_at as LastChangedAt,
  local_last_changed_at as LocalLastChangedAt
  
}
