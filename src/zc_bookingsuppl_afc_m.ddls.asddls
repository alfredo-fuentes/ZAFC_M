@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Bookin Suppl. Projection view managed'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_BOOKINGSUPPL_AFC_M 
as projection on ZI_BOOKINGSUPPL_AFC_M
{
    key TravelId,
    key BookingId,
    key BookingSupplementId,
    SupplementId,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    Price,
    CurrencyCode,
    LastChangedAt,
    /* Associations */
    _Travel: redirected to ZC_TRAVEL_AFC_M,
    _Booking: redirected to parent ZC_BOOLINK_AFC_M,
    _Supplement,
    _SupplementText
}
