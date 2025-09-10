@AbapCatalog.sqlViewName: 'ZSAI_SQL_TRAVEL'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption cds view of travel'
@Metadata.ignorePropagatedAnnotations: true
define root view zsai_c_travel as select from /dmo/travel as _travel
  association[1] to zsai_i_agency as _agency on $projection.AgencyId = _agency.AgencyId
  association[1] to zsai_i_customer as _customer on $projection.CustomerId = _customer.CustomerId
  association[1] to I_Currency as _currency on $projection.CurrencyCode = _currency.Currency
  
{
  
@UI.facet:[{purpose : #STANDARD,type:#IDENTIFICATION_REFERENCE,label:'Details',position:10}]
 @UI.selectionField: [{ position : 10 }] 
 @UI.lineItem:[{position : 10,label:'Travel No'}] 


    key travel_id as TravelId,
  @UI.selectionField: [{ position : 20 }]  
  @EndUserText.label: 'Agency No'
  @UI.lineItem:[{position : 20}] 
  @UI.identification: [{ position:10 }]
   @ObjectModel.text.association: '_Agency'
    
   @Search.defaultSearchElement: true
   @Search.fuzzinessThreshold: 0.7
    agency_id as AgencyId,
  @UI.selectionField: [{ position : 30 }]  
    @EndUserText.label: 'Customer No'
    @UI.lineItem:[{position : 30}] 
     @UI.identification: [{ position:20 }]
      @ObjectModel.text.association: '_Customer'
    customer_id as CustomerId,
        @UI.identification: [{ position:30 }]
    begin_date as BeginDate,
        @UI.identification: [{ position:40 }]
    end_date as EndDate,
        @UI.identification: [{ position:50 }]
   @Semantics.amount.currencyCode:'CurrencyCode'
    booking_fee as BookingFee,
      @UI.lineItem:[{position : 40}] 
       @UI.identification: [{ position:60 }]
     @Semantics.amount.currencyCode:'CurrencyCode'
    total_price as TotalPrice,
      @UI.lineItem:[{position : 50}] 
       @UI.identification: [{ position:70 }]
    currency_code as CurrencyCode,
      @UI.lineItem:[{position : 60}] 
       @UI.identification: [{ position:80 }]
    description as Description,
     @UI.lineItem:[{position : 70}] 
      @UI.identification: [{ position:90 }]
    status as Status,
     @UI.lineItem:[{position : 80}] 
    _agency,
    _customer,
    _currency

}
