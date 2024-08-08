using CatalogService as service from '../../srv/CatalogService';
annotate service.POs with @(
   UI.HeaderInfo:{

   TypeName: 'PurChase Order',
   TypeNamePlural: 'Purchase Orders',
   Title: {Value : PO_ID},
   Description: {Value: PARTNER_GUID.COMPANY_NAME}
},

UI.SelectionFields: [

PO_ID,
PARTNER_GUID.COMPANY_NAME,
GROSS_AMOUNT,
OVERALL_STATUS

],
UI.LineItem:[
{
   $Type: 'UI.DataField' ,
   Value: PO_ID,
},
//{
  // $Type: 'UI.DataField' ,
   //Value: PARTNER.PARTNER_GUID.COMPANY_NAME,
//},
{
   $Type: 'UI.DataField' ,
   Value: PARTNER_GUID.ADDRESS_GUID.COUNTRY,
},
{
   $Type: 'UI.DataField' ,
   Value: OverallStatus,
   Criticality: ColorCode
},
{
   $Type: 'UI.DataField' ,
   Value: GROSS_AMOUNT,
},
{
   $Type: 'UI.DataFieldForAction',
   Action: 'CatalogService.boost',
   Label: 'boost',
   Inline: true

},
{
   $Type: 'UI.DataField' ,
   Value: CURRENCY_code,
},

],

UI.Facets:[
        {
            $Type : 'UI.CollectionFacet',
            Label : 'PO Details',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'More Info',
                    Target : '@UI.FieldGroup#MoreInfo',
                },{
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Pricing Details',
                    Target : '@UI.FieldGroup#Spiderman',
                },
            ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'PO Line Items',
            //Target : 'Items/@UI.LineItem',
        },
    ],
    UI.FieldGroup #MoreInfo: {
        Data : [
            {
                $Type : 'UI.DataField',
                Value : PO_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID_NODE_KEY,
            },
            {
                $Type : 'UI.DataField',
                Value : OVERALL_STATUS,
            }
        ],
    },
    UI.FieldGroup #Spiderman:{
        Data : [
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT,
            },{
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT,
            },{
                $Type : 'UI.DataField',
                Value : CURRENCY_code,
            },
        ],
    }    



);
