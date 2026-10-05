CLASS zcl_modify_practice_afc DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_modify_practice_afc IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
* MODIDY ENTITY, ENTITIES, field_spec
*1->... { FROM fields_tab }
*    CREATE, CREATE BY, UPDATE, DELTE, EXECUTE
*    For DELETE, EXECUTE we can use this option only
*    The %control structure must be filled explicitly in the internal table fields_tab for CREATE, CREAT BY and UPDATE
*
*    MODIFY ENTITY zi_travel_afc_m
*    CREATE FROM VALUE #(
*     ( %cid = 'cid1'
*       %data-BeginDate = '20261005'
*       %control-BeginDate = if_abap_behv=>mk-on
*     ) )
*
*         CREATE BY \_Booking
*          FROM VALUE #(
*     ( %cid_ref = 'cid1'
*       %target = VALUE #( ( %cid = 'cid11'
*                            BookingDate = '20261009'
*                            %control-BookingDate = if_abap_behv=>mk-on
*
*       ) )
*
*     ) )
*
*     FAILED FINAL(it_failed)
*     MAPPED FINAL(it_mapped)
*     REPORTED FINAL(it_result).

*    IF ( it_failed IS NOT INITIAL ).
*      out->write( it_failed ).
*    ELSE.
*      COMMIT ENTITIES.
*    ENDIF.

    "BORRAR
*    MODIFY ENTITY zi_travel_afc_m
*    DELETE FROM VALUE #( ( %key-TravelId = '0000004167' ) )
*     FAILED FINAL(it_failed1)
*     MAPPED FINAL(it_mapped1)
*     REPORTED FINAL(it_result1).
*
*    IF ( it_failed1 IS NOT INITIAL ).
*      out->write( it_failed1 ).
*    ELSE.
*      COMMIT ENTITIES.
*    ENDIF.


*2->  |{ AUTO FILL CID WITH fields_tab }
*    MODIFY ENTITY zi_travel_afc_m
*    CREATE AUTO FILL CID WITH VALUE #(
*     ( %data-BeginDate = '20261006'
*       %control-BeginDate = if_abap_behv=>mk-on
*     ) )
*
*     FAILED FINAL(it_failed)
*     MAPPED FINAL(it_mapped)
*     REPORTED FINAL(it_result).
*
*    IF ( it_failed IS NOT INITIAL ).
*      out->write( it_failed ).
*    ELSE.
*      COMMIT ENTITIES.
*    ENDIF.
*
**3->  |{ [AUTO FILL CID] FIELDS ( comp1, comp2 ... ) WITH fields_tab }
*    MODIFY ENTITIES OF zi_travel_afc_m
*    ENTITY zi_travel_afc_m
*    UPDATE FIELDS ( BeginDate )
*    WITH  VALUE #( ( %key-TravelId = '0000004169'
*                     BeginDate = '20261009' ) ).
*    COMMIT ENTITIES.


*4->  |{ [AUTO FILL CID] SET FIELDS WITH fields_tab } ...
    MODIFY ENTITY zi_travel_afc_m
    UPDATE SET FIELDS WITH VALUE #( ( %key-TravelId = '0000004169'
                                      BeginDate = '20261012'
    ) ).
    COMMIT ENTITIES.


  ENDMETHOD.

ENDCLASS.
