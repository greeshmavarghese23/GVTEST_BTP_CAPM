using { anubhav.db.master, anubhav.db.transaction } from '../db/datamodel';
using { cappo.cds } from '../db/CDSView';


service CatalogService @(path: 'CatalogService')

{

    entity EmployeeSet as projection on master.employees;
    //entity OrderItems as projection on cds.CDSViews.ItemView;
    //entity Products as projection on cds.CDSViews.ProductView;
    entity ProductSet as projection on master.product;
    entity BusinessPartnerSet as projection on master.businesspartner;
    entity BusinessAddressSet as projection on master.address;
    entity POs as projection on transaction.purchaseorder{
    *,
    Items,
    case OVERALL_STATUS
    when 'P' then 'Pending'
    when 'N' then 'New'
    when 'A' then 'Approved'
    when 'X' then 'Rejected'
    end as OverallStatus : String(10),
       case OVERALL_STATUS
    when 'P' then 1
    when 'N' then 2
    when 'A' then 3
    when 'X' then 1
    end as ColorCode : Integer,

    }
    actions{
        @Common.SideEffects: {
          //$Type: 'Common.SideEffectsType',
          TargetProperties: [
          'in/GROSS_AMOUNT',
          ],
        }
        action boost() returns POs
    };
    function largestOrder() returns POs;
    entity POItems as projection on transaction.poitems;
 


}