using fonav as my from '../db/schema';

service CatalogService {
    @readonly
    entity FreightOrders as projection on my.FreightOrders;
    entity FreightOrderItems as projection on my.FreightOrderItems;
}

annotate CatalogService.FreightOrders with @(
    //Freight Order List
    UI : {
        
        SelectionFields         : [
            fo_type,
            exec_status
        ],

        LineItem                : [
            {
                $Type : 'UI.DataField',
                Value : doc_number,
                ![@UI.Importance] : #High
            },
            {
                $Type : 'UI.DataField',
                Value : carrier,
                ![@UI.Importance] : #Medium
            },
            {
                $Type : 'UI.DataField',
                Value : source_loc
            },
            {
                $Type : 'UI.DataField',
                Value : departure
            },
            {
                $Type : 'UI.DataField',
                Value : dest_loc
            },
            {
                $Type : 'UI.DataField',
                Value : arrival
            }
        ]

    },

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
                Value : source_loc
            },
            {
                $Type : 'UI.DataField',
                Value : departure
            },
            {
                $Type : 'UI.DataField',
                Value : dest_loc
            },
            {
                $Type : 'UI.DataField',
                Value : arrival
            }
        ]}
    },

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
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Freight Order Items',
            Target : 'items/@UI.LineItem'
        }
    ]
);

annotate CatalogService.FreightOrderItems with @( 

    // PO Items List
    UI        : {
        LineItem            : [
            {
                $Type             : 'UI.DataField',
                Label             : 'Item',
                Value             : item_number,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Label             : 'Quantity',
                Value             : quantity,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Label             : 'Description',
                Value             : descr,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Label             : 'Weight',
                Value             : weight,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Label             : 'UOM',
                Value             : weight_UOM,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Label             : 'Volume',
                Value             : volume,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Label             : 'UOM',
                Value             : volume_UOM,
                ![@UI.Importance] : #High
            }
        ]
    }
);

annotate CatalogService.FreightOrders {
    doc_number @(Common : {Label : 'Order Number'});
    carrier    @(Common.Label : 'Carrier');
    source_loc @(Common.Label : 'Source Location');
    departure  @(Common.Label : 'Departure Date');
    dest_loc   @(Common.Label : 'Destination Location');
    arrival    @(Common.Label : 'Arrival Date');
}