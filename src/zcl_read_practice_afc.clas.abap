CLASS zcl_read_practice_afc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_read_practice_afc IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    "sort form read
*    READ ENTITY zi_travel_afc_m
*    FROM VALUE #(  ( %key-TravelId = '00004259'
*                     %control = VALUE #( AgencyId = if_abap_behv=>mk-on
*                                         CustomerId = if_abap_behv=>mk-on
*                                         BeginDate = if_abap_behv=>mk-on
*                      )
*    )
*     )
*    RESULT DATA(lt_result_data_short)
*    FAILED DATA(lt_failed_data_short).
*
*    IF ( lt_failed_data_short IS NOT INITIAL ).
*      out->write( ' Lectura falló' ).
*    ELSE.
*      out->write( lt_result_data_short ).
*    ENDIF.

    "otra forma de read
*    READ ENTITY zi_travel_afc_m
*    by \_Booking
*    all FIELDS
*    WITH VALUE #(  ( %key-TravelId = '00004165' )
*                   ( %key-TravelId = '00004166' )
*     )
*    RESULT DATA(lt_result_data_short)
*    FAILED DATA(lt_failed_data_short).
*
*    IF ( lt_failed_data_short IS NOT INITIAL ).
*      out->write( ' Lectura falló' ).
*    ELSE.
*      out->write( lt_result_data_short ).
*    ENDIF.

    "forma larga de read
*    READ ENTITIES OF zi_travel_afc_m
*    ENTITY zi_travel_afc_m
*    ALL FIELDS
*    WITH VALUE #(  ( %key-TravelId = '00004165' )
*                   ( %key-TravelId = '00004166' )
*     )
*    RESULT DATA(lt_result_data_travel)
*
*    ENTITY zi_booking_afc_m
*    ALL FIELDS
*    WITH VALUE #(  ( %key-TravelId = '00004165'
*                     %key-BookingId = '0003' )
*     )
*    RESULT DATA(lt_result_data_booking)
*
*
*    FAILED DATA(lt_failed_data_short).
*
*    IF ( lt_failed_data_short IS NOT INITIAL ).
*      out->write( ' Lectura falló' ).
*    ELSE.
*      out->write( lt_result_data_travel ).
*      out->write( lt_result_data_booking ).
*    ENDIF.


    "forma dinámica
    DATA: it_optab         TYPE abp_behv_retrievals_tab,
          it_travel        TYPE TABLE FOR READ IMPORT zi_travel_afc_m,
          it_travel_result TYPE TABLE FOR READ RESULT zi_travel_afc_m.

    it_travel = VALUE #(  ( %key-TravelId = '00004259'
                            %control = VALUE #( AgencyId = if_abap_behv=>mk-on
                                                CustomerId = if_abap_behv=>mk-on
                                                BeginDate = if_abap_behv=>mk-on
                )
) ).

    it_optab = VALUE #( ( op = if_abap_behv=>op-r
                          entity_name = 'ZI_TRAVEL_AFC_M'
                          instances = REF #( it_travel )
                          results = REF #( it_travel_result )
                           ) ).

    READ ENTITIES
    OPERATIONS  it_optab
    FAILED DATA(lt_failed_dy).

    IF ( lt_failed_dy IS NOT INITIAL ).
      out->write( ' Lectura falló' ).
    ELSE.
      out->write( it_travel_result ).
*      out->write( lt_result_data_booking ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
