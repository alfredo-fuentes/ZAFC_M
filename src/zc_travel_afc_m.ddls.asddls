@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel projection view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZC_TRAVEL_AFC_M 
provider contract transactional_query
as projection on ZI_TRAVEL_AFC_M
{
    key TravelId,
    AgencyId,
    CustomerId,
    BeginDate,
    EndDate,
    @Semantics.amount.currencyCode: 'CurrencyCode'    
    BookingFee,
    @Semantics.amount.currencyCode: 'CurrencyCode'    
    TotalPrice,
    CurrencyCode,
    Description,
    OverallStatus,
//    CreatedBy,
//    CreatedAt,
//    LastChangedBy,
    LastChangedAt,
    /* Associations */
    _Agency,
    _Booking:  redirected to composition child ZC_BOOLINK_AFC_M,
    _Currency,
    _Customer,
    _Status
}
