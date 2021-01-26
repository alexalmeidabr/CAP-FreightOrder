using CatalogService as srv from './cat-service';
using CatalogService.FreightOrderItems as items from './FreightOrderItem';

// Define Filter Labels
annotate srv.FreightOrders with {
  fo_type @( Common: { Label: '{i18n>OrderType}'} );
}

annotate srv.FreightOrders with @(
    //Freight Order List
    UI : {
        
        SelectionFields         : [
            fo_type,
            carrier.bp_number
        ],

        LineItem                : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>OrderNumber}',
                Value : doc_number,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>OrderType}',
                Value : fo_type,                
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>OrderTypeDescr}',
                Value : fo_type_descr,                
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>ExecutionStatus}',
                Value : exec_status,                
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>ModeTransport}',
                Value : transp_mode,
                
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Carrier}',
                Value : carrier.bp_number,
                
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Source}',
                Value : source_loc.loc_code
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Departure}',
                Value : departure
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Destination}',
                Value : dest_loc.loc_code
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Arrival}',
                Value : arrival
            }
        ]

    },

    // Freight Order Page
    UI: {
        HeaderInfo              : {
            TypeName       : '{i18n>FreightOrder}',
            TypeNamePlural : '{i18n>FreightOrders}',
            Description    : {Value: fo_type_descr},
            Title: { Value: doc_number },            
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
                    Value : exec_status
                }
            ]
        },
        FieldGroup #Price        : {
            Data : [
                {
                    $Type : 'UI.DataField',
                    Label: '{i18n>Price}',
                    Value : cost
                },
                {
                    $Type : 'UI.DataField',
                    Label: '{i18n>Currency}',
                    Value : currency
                }
            ]
        },
        FieldGroup #Source:
        {
            Data:[
                {$Type: 'UI.DataField', Value: source_loc.loc_code, Label: '{i18n>LocationCode}'},
                {$Type: 'UI.DataField', Value: source_loc.street, Label: '{i18n>Street}'},
                {$Type: 'UI.DataField', Value: source_loc.post_code, Label: '{i18n>PostalCode}'},
                {$Type: 'UI.DataField', Value: source_loc.city, Label: '{i18n>City}'},
                {$Type: 'UI.DataField', Value: source_loc.region, Label: '{i18n>Region}'},
                {$Type: 'UI.DataField', Value: source_loc.country, Label: '{i18n>Country}'},
            ]
        },
        FieldGroup #Destination:
        {
            Data:[
                {$Type: 'UI.DataField', Value: dest_loc.loc_code, Label: '{i18n>LocationCode}'},
                {$Type: 'UI.DataField', Value: dest_loc.street, Label: '{i18n>Street}'},
                {$Type: 'UI.DataField', Value: dest_loc.post_code, Label: '{i18n>PostalCode}'},
                {$Type: 'UI.DataField', Value: dest_loc.city, Label: '{i18n>City}'},
                {$Type: 'UI.DataField', Value: dest_loc.region, Label: '{i18n>Region}'},
                {$Type: 'UI.DataField', Value: dest_loc.country, Label: '{i18n>Country}'},                
            ]
        },
        FieldGroup #Carrier:
        {
            Data:[
                {$Type: 'UI.DataField', Value: carrier.bp_number},
                {$Type: 'UI.DataField', Value: carrier.name},
                {$Type: 'UI.DataField', Value: carrier.city, Label: '{i18n>City}'},
                {$Type: 'UI.DataField', Value: carrier.email, Label: '{i18n>Email}'},
                {$Type: 'UI.DataField', Value: carrier.phone, Label: '{i18n>Phone}'},
                {$Type: 'UI.DataField', Value: carrier.website, Label: '{i18n>Website}'},                
            ]
        },
        FieldGroup #Dates:
        {
            Data:[                
                {$Type: 'UI.DataField', Value: departure, Label: '{i18n>Departure}'},
                {$Type: 'UI.DataField', Value: arrival, Label: '{i18n>Arrival}'},                
            ]
        },
        FieldGroup #CargoInfo:
        {
            Data:[
                {$Type: 'UI.DataField', Value: used_weight, Label: '{i18n>Weight}'},
                {$Type: 'UI.DataField', Value: weight_cap_uom, Label: '{i18n>UOM}'},
                {$Type: 'UI.DataField', Value: used_volume, Label: '{i18n>Volume}'},
                {$Type: 'UI.DataField', Value: volume_cap_uom, Label: '{i18n>UOM}'},  
            ]               
        },
    },

    // Page Details
    UI.Facets : [
        
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'FODetails',
            Label  : '{i18n>Details}',            
            Facets : [
                {
                    $Type  : 'UI.ReferenceFacet',                  
                    Label  :  '{i18n>Carrier}',              
                    Target : '@UI.FieldGroup#Carrier'
                },
                {
                    $Type  : 'UI.ReferenceFacet',                  
                    Label  :  '{i18n>Source}',              
                    Target : '@UI.FieldGroup#Source'
                },
                {
                    $Type  : 'UI.ReferenceFacet',  
                    Label  :  '{i18n>Destination}',              
                    Target : '@UI.FieldGroup#Destination'
                },
                {
                    $Type  : 'UI.ReferenceFacet',  
                    Label  :  '{i18n>CargoInfo}',              
                    Target : '@UI.FieldGroup#CargoInfo'
                },
            ]
        },
                    
        {
            $Type  : 'UI.ReferenceFacet',                  
            Label  :  '{i18n>Dates}',              
            Target : '@UI.FieldGroup#Dates'
        },     
                      
        //Line items
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : '{i18n>Items}',
            Target : 'items/@UI.LineItem'
        }
    ]
);
