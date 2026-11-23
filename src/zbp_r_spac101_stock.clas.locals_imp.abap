CLASS lhc_STOCK DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR stock RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR stock RESULT result.
    METHODS precheck_create FOR PRECHECK
      IMPORTING entities FOR CREATE stock.

*    METHODS validateproductid FOR VALIDATE ON SAVE
*      keys FOR stock~validateproductid.

    METHODS validateAmount FOR VALIDATE ON SAVE
      keys FOR stock~validateAmount.

ENDCLASS.

CLASS lhc_STOCK IMPLEMENTATION.

  METHOD get_global_authorizations.
    IF requested_authorizations-%create = if_abap_behv=>mk-on.
      result-%create = if_abap_behv=>auth-allowed.
    ENDIF.
    IF requested_authorizations-%update = if_abap_behv=>mk-on.
      result-%update = if_abap_behv=>auth-allowed.
    ENDIF.
    IF requested_authorizations-%delete = if_abap_behv=>mk-on.
      result-%delete = if_abap_behv=>auth-allowed.
    ENDIF.
  ENDMETHOD.

  METHOD get_instance_authorizations.
    READ ENTITIES OF zr_spac101_stock IN LOCAL MODE
      ENTITY stock
        ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(lt_stocks).

    LOOP AT lt_stocks INTO DATA(ls_stock).
      APPEND VALUE #(
        %tky    = ls_stock-%tky
        %update = if_abap_behv=>auth-allowed
        %delete = if_abap_behv=>auth-allowed
      ) TO result.
    ENDLOOP.
  ENDMETHOD.


  METHOD precheck_create.
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<entity>).

      SELECT SINGLE @abap_true
        FROM zspac101_stock
        WHERE warehouse_id = @<entity>-WarehouseId
          AND product_id = @<entity>-ProductId
        INTO @DATA(lv_exsists).
     IF sy-subrc = 0.

            APPEND VALUE #( %cid = <entity>-%cid )
        TO failed-stock.

      APPEND VALUE #(
        %cid = <entity>-%cid
        %msg = new_message_with_text(
          severity = if_abap_behv_message=>severity-error
          text = 'A stock entry for this product already exsists in the selected warehouse.'
        )
      ) TO reported-stock.

    ENDIF.

  ENDLOOP.
  ENDMETHOD.

*
*  METHOD validateProductId.
*  READ ENTITIES OF ZR_SPAC101_STOCK IN LOCAL MODE
*    ENTITY Stock
*    FIELDS ( WarehouseId ProductId )
*    WITH CORRESPONDING #( keys )
*    RESULT DATA(lt_stock).
*
*  LOOP AT lt_stock ASSIGNING FIELD-SYMBOL(<stock>).
*
*    SELECT SINGLE @abap_true
*      FROM zspac101_stock
*      WHERE warehouse_id = @<stock>-WarehouseId
*        AND product_id = @<stock>-ProductId
*      INTO @DATA(lv_warehouse_id).
*
*    IF sy-subrc = 0.
*
*      APPEND VALUE #( %tky = <stock>-%tky )
*        TO failed-stock.
*
*      APPEND VALUE #(
*        %tky = <stock>-%tky
*        %msg = new_message_with_text(
*          severity = if_abap_behv_message=>severity-error
*          text = 'Product already exists in this warehouse.'
*        )
*      ) TO reported-stock.
*
*    ENDIF.

*  ENDLOOP.
*  ENDMETHOD.
  METHOD validateAmount.
  READ ENTITIES OF ZR_SPAC101_STOCK IN LOCAL MODE
    ENTITY Stock
    FIELDS ( Amount )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_stock).

  LOOP AT lt_stock ASSIGNING FIELD-SYMBOL(<stock>).

    IF <stock>-amount < 0.

      APPEND VALUE #( %tky = <stock>-%tky )
        TO failed-stock.

      APPEND VALUE #(
        %tky = <stock>-%tky
        %msg = new_message_with_text(
          severity = if_abap_behv_message=>severity-error
          text = 'Amount cannot be Negative.'
        )
      ) TO reported-stock.

    ENDIF.

  ENDLOOP.
  ENDMETHOD.



ENDCLASS.
