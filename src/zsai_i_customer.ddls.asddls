@AbapCatalog.sqlViewName: 'ZSAI_SQL_CUST'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'customer interface cds'
@Metadata.ignorePropagatedAnnotations: true
define view zsai_i_customer as select from /dmo/customer as _customer 
  association[1] to I_Country as _country
  on $projection.CountryCode = _country.Country
{
    key _customer.customer_id as CustomerId,
    _customer.first_name as FirstName,
    _customer.last_name as LastName,
    _customer.title as Title,
    _customer.street as Street,
    _customer.postal_code as PostalCode,
    _customer.city as City,
    _customer.country_code as CountryCode,
    _customer.phone_number as PhoneNumber,
    _customer.email_address as EmailAddress,
   _country
}
