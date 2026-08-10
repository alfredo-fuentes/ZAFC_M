CLASS ZCL_DATA_GENERATOR2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES:
      if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_DATA_GENERATOR2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " delete existing entries in the database table
    DELETE FROM ztravel_afc_m.
    DELETE FROM zBOOKING_afc_m.
    DELETE FROM zbooksupp_afc_m.
    COMMIT WORK.
    " insert travel demo data
    INSERT ztravel_afc_m FROM (
        SELECT *
          FROM /dmo/travel_m
      ).
    COMMIT WORK.

    " insert booking demo data
    INSERT zbooking_afc_m FROM (
        SELECT *
          FROM   /dmo/booking_m
*            JOIN ytravel_tech_m AS y
*            ON   booking~travel_id = y~travel_id

      ).
    COMMIT WORK.
    INSERT zbooksupp_afc_m FROM (
        SELECT *
          FROM   /dmo/booksuppl_m
*            JOIN ytravel_tech_m AS y
*            ON   booking~travel_id = y~travel_id

      ).
    COMMIT WORK.

    out->write('Travel and booking demo data inserted.').


  ENDMETHOD.
ENDCLASS.
