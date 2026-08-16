@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking projection view'   
define view entity ZC_BOOLINK_AFC_M 
as projection on ZI_BOOKING_AFC_M
{
    key TravelId,
    key BookingId,
    BookingDate,
    CustomerId,
    CarrierId,
    ConnectionId,
    FlightDate,
    FlightPrice,
    CurrencyCode,
    BookingStatus,
    LastChangedAt,
    /* Associations */
    _BookingSuppl: redirected to composition child ZC_BOOKINGSUPPL_AFC_M,
    _Booking_Status,
    _Carrier,
    _Connection,
    _Customer,
    _Travel: redirected to parent ZC_TRAVEL_AFC_M
}
