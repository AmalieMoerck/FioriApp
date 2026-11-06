CLASS zcl_spac101_new_data_loader DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS:
      fill_table
        RETURNING VALUE(r_output) TYPE string
        RAISING cx_sy_open_sql_db,
      cleanup
        RETURNING VALUE(r_output) TYPE STRING.

ENDCLASS.


CLASS zcl_spac101_new_data_loader IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    out->write( cleanup(  ) ).

    TRY.
      out->write( fill_table(  ) ).
    CATCH cx_sy_open_sql_db INTO DATA(lx).
      out->write( |Couldn't write entries to table. Error: { lx->get_longtext(  ) }| ).
    ENDTRY.

  ENDMETHOD.


  METHOD fill_table.



    DATA: stock_table TYPE TABLE OF zspac101_stock .
*                                  ^^^^^^^^^^^^^^^^

    stock_table = VALUE #(
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*   Ændr data herunder, når du vil fylde data på andre tabeller
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      ( warehouse_id = 1 product_id = 1 amount =   3 )
      ( warehouse_id = 3 product_id = 4 amount =  42 )
      ( warehouse_id = 2 product_id = 5 amount =   1 )
      ( warehouse_id = 3 product_id = 5 amount = 321 )
      ( warehouse_id = 3 product_id = 1 amount =  20 )
      ( warehouse_id = 1 product_id = 5 amount =   9 )
      ( warehouse_id = 2 product_id = 3 amount =   5 )
      ( warehouse_id = 3 product_id = 2 amount =   4 )
      ( warehouse_id = 1 product_id = 4 amount =   0 )
      ( warehouse_id = 3 product_id = 3 amount =   8 )
      ( warehouse_id = 1 product_id = 3 amount = 100 )
      ( warehouse_id = 1 product_id = 2 amount =   7 )
      ( warehouse_id = 2 product_id = 4 amount =   0 )
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*   Ændr data herover, når du vil fylde data på andre tabeller
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    ).
*                                  ÆNDR TABELNAVNET
*                                  vvvvvvvvvvvvvvvv
    DATA: product_table TYPE TABLE OF zspac101_prod .
*                                  ^^^^^^^^^^^^^^^^

    product_table = VALUE #(
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*   Ændr data herunder, når du vil fylde data på andre tabeller
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      ( product_id = 1 product_name = 'Apple' product_description = 'Fruit' product_price = 12 currency = 'EUR' )
      ( product_id = 2 product_name = 'Pear' product_description = 'Fruit' product_price = 12 currency = 'EUR' )
      ( product_id = 3 product_name = 'Milk' product_description = 'Dairy' product_price = 12 currency = 'EUR' )
      ( product_id = 4 product_name = 'Pork chops' product_description = 'Meat' product_price = 12 currency = 'EUR' )
      ( product_id = 5 product_name = 'Minced Beef' product_description = 'Meat' product_price = 12 currency = 'EUR' )
*      ( product_id = 6 product_name = 'Beer' product_description = 'Alcoholic Beverages' product_price = 12 currency = 'EUR' )
*      ( product_id = 7 product_name = 'White Bread' product_description = 'Grains' product_price = 12 currency = 'EUR' )

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*   Ændr data herover, når du vil fylde data på andre tabeller
*
*  key product_id      : abap.int4 not null;
*  product_name        : abap.char(10);
*  product_description : abap.char(20);
*  @Semantics.amount.currencyCode : 'zspac101_prod.currency'
*  product_price       : abap.curr(10,2);
*  currency            : abap.cuky not null;
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    ).

    DATA: warehouse_table TYPE TABLE OF zspac101_wrhouse .
    warehouse_table = VALUE #(
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*   Ændr data herunder, når du vil fylde data på andre tabeller
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
      ( warehouse_id = 1 warehouse_name = 'Esbjerg-01' warehouse_adress = 'testvej 12' warehouse_city = 'Esbjerg Ø' warehouse_postcode = '6705' )
      ( warehouse_id = 2 warehouse_name = 'København-01' warehouse_adress = 'testvej 45' warehouse_city = 'København Ø' warehouse_postcode = '2100' )
      ( warehouse_id = 3 warehouse_name = 'København-02' warehouse_adress = 'testvej 69' warehouse_city = 'København NV' warehouse_postcode = '2400' )
*      ( warehouse_id = 4 warehouse_name = 'Odense-01' warehouse_adress = 'testvej 890' warehouse_city = 'Odense' warehouse_postcode = '6547' )
*      ( warehouse_id = 5 warehouse_name = 'Ringsted-01' warehouse_adress = 'tetettetetsetvej 48' warehouse_city = 'Ringsted' warehouse_postcode = '9874' )
*      ( warehouse_id = 6 warehouse_name = 'Silkeborg-01' warehouse_adress = 'testvej 7' warehouse_city = 'Silkeborg' warehouse_postcode = '2644' )
*      ( warehouse_id = 7 warehouse_name = 'Aarhus-01' warehouse_adress = 'tets 0' warehouse_city = 'Aalborg' warehouse_postcode = '8000' )

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*   Ændr data herover, når du vil fylde data på andre tabeller
*
*  key client         : abap.clnt not null;
*  key warehouse_id   : abap.int4 not null;
*  warehouse_name     : abap.char(10);
*  warehouse_adress   : abap.char(20);
*  warehouse_city     : abap.char(10);
*  warehouse_postcode : abap.char(10);
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    ).


    TRY.


        INSERT zspac101_stock FROM TABLE @stock_table.
        DATA(lv_stock_count) = sy-dbcnt.

        INSERT zspac101_prod FROM TABLE @product_table.
        DATA(lv_prod_count) = sy-dbcnt.

        INSERT zspac101_wrhouse FROM TABLE @warehouse_table.
        DATA(lv_wrhouse_count) = sy-dbcnt.


      CATCH cx_sy_open_sql_db INTO DATA(lx).
        RAISE EXCEPTION lx.
    ENDTRY.

    r_output = |Successfully inserted { lv_prod_count } products and { lv_wrhouse_count } warehouses and { lv_stock_count } stock.|.

  ENDMETHOD.


  METHOD cleanup.

    DELETE FROM zspac101_stock.
    DATA(lv_deleted_stock) = sy-dbcnt.

    DELETE FROM zspac101_prod.
    DATA(lv_deleted_prod) = sy-dbcnt.

    DELETE FROM zspac101_wrhouse.
    DATA(lv_deleted_wrhouse) = sy-dbcnt.


    r_output = |Cleanup completed. Deleted { lv_deleted_prod } products and { lv_deleted_wrhouse } warehouses and { lv_deleted_stock } stock.|.
  ENDMETHOD.

ENDCLASS.
