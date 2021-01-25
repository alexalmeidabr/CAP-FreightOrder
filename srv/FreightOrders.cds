using CatalogService as srv from './cat-service';
using CatalogService.FreightOrderItems as items from './FreightOrderItem';

// Define Filter Labels
annotate srv.FreightOrders with {
  fo_type @( Common: { Label: 'Order Type'} );
  carrier @( Common.Label: 'Carrier' );
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
                Label : 'Order Number',
                Value : doc_number,
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
                Value : carrier.bp_number,
                
            },
            {
                $Type : 'UI.DataField',
                Label : 'Source Location',
                Value : source_loc.loc_code
            },
            {
                $Type : 'UI.DataField',
                Label : 'Departure Date',
                Value : departure
            },
            {
                $Type : 'UI.DataField',
                Label : 'Destination Location',
                Value : dest_loc.loc_code
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
        FieldGroup #Source:
        {
            Data:[
                {$Type: 'UI.DataField', Value: source_loc.loc_code, Label: 'Code'},
                {$Type: 'UI.DataField', Value: source_loc.street, Label: 'Street'},
                {$Type: 'UI.DataField', Value: source_loc.post_code, Label: 'Zip code'},
                {$Type: 'UI.DataField', Value: source_loc.city, Label: 'City'},
                {$Type: 'UI.DataField', Value: source_loc.region, Label: 'State'},
                {$Type: 'UI.DataField', Value: source_loc.country, Label: 'Country'},
            ]
        },
        FieldGroup #Destination:
        {
            Data:[
                {$Type: 'UI.DataField', Value: dest_loc.loc_code, Label: 'Code'},
                {$Type: 'UI.DataField', Value: dest_loc.street, Label: 'Street'},
                {$Type: 'UI.DataField', Value: dest_loc.post_code, Label: 'Zip code'},
                {$Type: 'UI.DataField', Value: dest_loc.city, Label: 'City'},
                {$Type: 'UI.DataField', Value: dest_loc.region, Label: 'State'},
                {$Type: 'UI.DataField', Value: dest_loc.country, Label: 'Country'},                
            ]
        },
        FieldGroup #Carrier:
        {
            Data:[
                {$Type: 'UI.DataField', Value: carrier.bp_number},
                {$Type: 'UI.DataField', Value: carrier.name},
                {$Type: 'UI.DataField', Value: carrier.city, Label: 'City'},
                {$Type: 'UI.DataField', Value: carrier.email, Label: 'Email'},
                {$Type: 'UI.DataField', Value: carrier.phone, Label: 'Phone'},
                {$Type: 'UI.DataField', Value: carrier.website, Label: 'Website'},                
            ]
        },
        FieldGroup #Dates:
        {
            Data:[                
                {$Type: 'UI.DataField', Value: departure, Label: 'Departure'},
                {$Type: 'UI.DataField', Value: arrival, Label: 'Arrival'},                
            ]
        },
        FieldGroup #CargoInfo:
        {
            Data:[
                {$Type: 'UI.DataField', Value: used_weight, Label: 'Weight'},
                {$Type: 'UI.DataField', Value: weight_cap_uom, Label: 'UOM'},
                {$Type: 'UI.DataField', Value: used_volume, Label: 'Volume'},
                {$Type: 'UI.DataField', Value: volume_cap_uom, Label: 'UOM'},  
            ]               
        },
    },

    // Page Details
    UI.Facets : [
        
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'FODetails',
            Label  : 'Details',            
            Facets : [
                {
                    $Type  : 'UI.ReferenceFacet',                  
                    Label  :  'Carrier',              
                    Target : '@UI.FieldGroup#Carrier'
                },
                {
                    $Type  : 'UI.ReferenceFacet',                  
                    Label  :  'Source Location',              
                    Target : '@UI.FieldGroup#Source'
                },
                {
                    $Type  : 'UI.ReferenceFacet',  
                    Label  :  'Destination Location',              
                    Target : '@UI.FieldGroup#Destination'
                },
                {
                    $Type  : 'UI.ReferenceFacet',  
                    Label  :  'Cargo Info',              
                    Target : '@UI.FieldGroup#CargoInfo'
                },
            ]
        },
                    
        {
            $Type  : 'UI.ReferenceFacet',                  
            Label  :  'Dates',              
            Target : '@UI.FieldGroup#Dates'
        },     
                      
        //Line items
        {
            $Type  : 'UI.ReferenceFacet',
            Label  : 'Items',
            Target : 'items/@UI.LineItem'
        }
    ]
);
