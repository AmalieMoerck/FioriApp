CLASS lhc_Product DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR Product RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR Product RESULT result.

    METHODS get_instance_features FOR INSTANCE FEATURES
      keys REQUEST requested_features FOR Product RESULT result.

ENDCLASS.

CLASS lhc_Product IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD get_instance_features.
    READ ENTITIES OF zr_spac101_prod IN LOCAL MODE
      ENTITY Product
        FIELDS ( ProductId ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_products).

    IF lt_products IS NOT INITIAL.

      SELECT DISTINCT product_id
        FROM zspac101_stock
        FOR ALL ENTRIES IN @lt_products
        WHERE product_id = @lt_products-ProductId
        INTO TABLE @DATA(lt_used_products).
    ENDIF.

    result = VALUE #( FOR ls_product IN lt_products (
      %tky    = ls_product-%tky
      %delete = COND #( WHEN line_exists( lt_used_products[ product_id = ls_product-ProductId ] )
                        THEN if_abap_behv=>fc-o-disabled
                        ELSE if_abap_behv=>fc-o-enabled )
    ) ).
  ENDMETHOD.

ENDCLASS.

