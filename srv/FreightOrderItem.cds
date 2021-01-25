using CatalogService as srv from './cat-service';

annotate srv.FreightOrderItems with @( 

    // PO Items in the Freight Order Page
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
    },

    // Freight Order Item Page

    UI:{

        HeaderInfo:{
            TypeName : 'Freight Order Item',
            TypeNamePlural : 'Freight Order Items',
            Title    : { Value: item_number}
        },
        HeaderFacets :[
            {
                $Type             : 'UI.ReferenceFacet',
                Target            : '@UI.FieldGroup#ItemDescription',                
            }
        ],

        FieldGroup #ItemDescription        : {
            Data : [
                {$Type : 'UI.DataField', Value : resource_type},
                {
                    $Type : 'UI.DataField',
                    Label : 'Description',
                    Value : descr
                },
                {
                    $Type : 'UI.DataField',
                    Label : 'Quantity',
                    Value : quantity
                },

            ]
        },
        FieldGroup #Shipper        : {
            Data : [
                { $Type : 'UI.DataField', Value : shipper.bp_number },
                {$Type: 'UI.DataField', Value: shipper.street, Label: 'Street'},
                {$Type: 'UI.DataField', Value: shipper.postal_code, Label: 'Zip code'},
                {$Type: 'UI.DataField', Value: shipper.city, Label: 'City'},
                {$Type: 'UI.DataField', Value: shipper.region, Label: 'State'},
                {$Type: 'UI.DataField', Value: shipper.country, Label: 'Country'},
                {$Type: 'UI.DataField', Value: shipper.email, Label: 'email'},
                {$Type: 'UI.DataField', Value: shipper.phone, Label: 'phone'},
                {$Type: 'UI.DataField', Value: shipper.website, Label: 'website'},
            ]
        },

        FieldGroup #ShipperTo        : {
            Data : [
                { $Type : 'UI.DataField', Value : shipperto.bp_number },
                {$Type: 'UI.DataField', Value: shipperto.street, Label: 'Street'},
                {$Type: 'UI.DataField', Value: shipperto.postal_code, Label: 'Zip code'},
                {$Type: 'UI.DataField', Value: shipperto.city, Label: 'City'},
                {$Type: 'UI.DataField', Value: shipperto.region, Label: 'State'},
                {$Type: 'UI.DataField', Value: shipperto.country, Label: 'Country'},
                {$Type: 'UI.DataField', Value: shipperto.email, Label: 'email'},
                {$Type: 'UI.DataField', Value: shipperto.phone, Label: 'phone'},
                {$Type: 'UI.DataField', Value: shipperto.website, Label: 'website'},
            ]
        },
        FieldGroup #Cargo        : {
            Data : [
                {$Type : 'UI.DataField', Value : descr, Label: 'Description' },
                {$Type : 'UI.DataField', Value : quantity, Label: 'Quantity' },
                {$Type: 'UI.DataField', Value: weight, Label: 'Weight'},
                {$Type: 'UI.DataField', Value: weight_UOM},
                {$Type: 'UI.DataField', Value: volume, Label: 'Volume'},
                {$Type: 'UI.DataField', Value: volume_UOM},
                {$Type: 'UI.DataField', Value: dg_ind, Label: 'Dangerous Good Indicator'},
                
            ]
        },
    },

    // Page Details
    UI.Facets : [
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'FOItemDetails',   
            Label  : 'Item Details',                    
            Facets : [
                {
                    $Type  : 'UI.ReferenceFacet',                  
                    Label  :  'Shipper',              
                    Target : '@UI.FieldGroup#Shipper'
                },
                {
                    $Type  : 'UI.ReferenceFacet',                  
                    Label  :  'Shipper To',              
                    Target : '@UI.FieldGroup#ShipperTo'
                },
                
            ]
        },
        {
            $Type  : 'UI.ReferenceFacet',                  
            Label  :  'Cargo Details',              
            Target : '@UI.FieldGroup#Cargo'
        },
    ]
);