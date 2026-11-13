CLASS lhc_STOCK DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      keys REQUEST requested_authorizations FOR stock RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      REQUEST requested_authorizations FOR stock RESULT result.

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



*  METHOD get_instance_authorizations.
*  ENDMETHOD.
*
*  METHOD get_global_authorizations.
*  ENDMETHOD.

ENDCLASS.
