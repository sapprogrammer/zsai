@AbapCatalog.sqlViewName: 'ZSAI_SQL_AGEN'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'interface cds view for agency'
@Metadata.ignorePropagatedAnnotations: true
define view zsai_i_agency as select from /dmo/agency as _agency
 association[1] to I_Country as _country
 on $projection.ACountryCode = _country.Country
{
    key _agency.agency_id as AgencyId,
    _agency.name as AName,
    _agency.street as AStreet,
    _agency.postal_code as APostalCode,
    _agency.city as ACity,
    _agency.country_code as ACountryCode,
    _agency.phone_number as APhoneNumber,
    _agency.email_address as AEmailAddress,
    _agency.web_address as AWebAddress,
    _country
}
