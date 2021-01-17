using CatalogService as srv from './cat-service';

// Define Filter Labels
annotate srv.FreightOrders with {
  fo_type @( Common: { Label: 'Order Type'} );
  carrier @( Common.Label: 'Carrier' );
}

annotate CatalogService.FreightOrders with @(
    //Freight Order List
    UI : {
        
        SelectionFields         : [
            fo_type,
            carrier
        ],

        LineItem                : [
            {
                $Type : 'UI.DataField',
                Label : 'Order Number',
                Value : doc_number,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Label : 'Order Type',
                Value : fo_type,                
            },
            {
                $Type : 'UI.DataField',
                Label : 'Order Type Description',
                Value : fo_type_descr,                
            },
            {
                $Type : 'UI.DataField',
                Label : 'Execution Status',
                Value : exec_status,                
            },
            {
                $Type : 'UI.DataField',
                Label : 'Mode of Transport',
                Value : transp_mode,
                
            },
            {
                $Type : 'UI.DataField',
                Label : 'Carrier',
                Value : carrier,
                
            },
            {
                $Type : 'UI.DataField',
                Label : 'Source Location',
                Value : source_loc
            },
            {
                $Type : 'UI.DataField',
                Label : 'Departure Date',
                Value : departure
            },
            {
                $Type : 'UI.DataField',
                Label : 'Destination Location',
                Value : dest_loc
            },
            {
                $Type : 'UI.DataField',
                Label : 'Arrival Date',
                Value : arrival
            }
        ]

    },
    // Freight Order Page
    UI: {
        HeaderInfo              : {
            TypeName       : 'Freight Order',
            TypeNamePlural : 'Freight Orders',
            Title: { Value: doc_number }
        },
        HeaderFacets                   : [
            {
                $Type             : 'UI.ReferenceFacet',
                Target            : '@UI.FieldGroup#Description',
                ![@UI.Importance] : #Medium
            },
            {
                $Type             : 'UI.ReferenceFacet',
                Target            : '@UI.FieldGroup#Price',
                ![@UI.Importance] : #High
            },
        ],

        FieldGroup #Description        : {
            Data : [
                {
                    $Type : 'UI.DataField',                
                    Value : fo_type_descr
                },
                {
                    $Type : 'UI.DataField',
                    Value : exec_status
                }
            ]
        },
        FieldGroup #Price        : {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Label: 'Price',
                    Value : cost
                },
                {
                    $Type : 'UI.DataField',
                    Label: 'Currency',
                    Value : currency
                }
            ]
        },
        FieldGroup #Details            : {Data : [
           
            {
                $Type : 'UI.DataField',
                Label : 'Source Location',
                Value : 'source_loc/@UI.loc_code'
            },
            {
                $Type : 'UI.DataField',
                Label: 'Departure Date',
                Value : departure
            },
            {
                $Type : 'UI.DataField',
                Label : 'Destination Location',
                Value : dest_loc
            },
            {
                $Type : 'UI.DataField',
                Label : 'Arrival Date',
                Value : arrival
            }
        ]}
    },
    // Page Details
    UI.Facets : [
        
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'FODetails',
            Label  : 'Freight Order Details',
            Facets : [{
                $Type  : 'UI.ReferenceFacet',                
                Target : '@UI.FieldGroup#Details'
            }]
        },
        // Line items
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Freight Order Items',
            Target : 'items/@UI.LineItem'
        }
    ]
);