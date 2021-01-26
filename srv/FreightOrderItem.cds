using CatalogService as srv from './cat-service';

annotate srv.FreightOrderItems with @( 

    // PO Items in the Freight Order Page
    UI        : {
        LineItem            : [
            {
                $Type             : 'UI.DataField',
                Label             : '{i18n>Item}',
                Value             : item_number,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Label             : '{i18n>Quantity}',
                Value             : quantity,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Label             : '{i18n>Description}',
                Value             : descr,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Label             : '{i18n>Weight}',
                Value             : weight,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Label             : '{i18n>UOM}',
                Value             : weight_UOM,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Label             : '{i18n>Volume}',
                Value             : volume,
                ![@UI.Importance] : #High
            },
            {
                $Type             : 'UI.DataField',
                Label             : '{i18n>UOM}',
                Value             : volume_UOM,
                ![@UI.Importance] : #High
            }
        ]
    },

    // Freight Order Item Page

    UI:{

        HeaderInfo:{
            TypeName : '{i18n>FreightOrderItem}',
            TypeNamePlural : '{i18n>FreightOrderItems}',
            Title    : { Value: item_number},
            Description    : {Value: descr},
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
                    Label : '{i18n>Quantity}',
                    Value : quantity
                },

            ]
        },
        FieldGroup #Shipper        : {
            Data : [
                { $Type : 'UI.DataField', Value : shipper.bp_number },
                {$Type: 'UI.DataField', Value: shipper.name},
                {$Type: 'UI.DataField', Value: shipper.street, Label: '{i18n>Street}'},
                {$Type: 'UI.DataField', Value: shipper.postal_code, Label: '{i18n>PostalCode}'},
                {$Type: 'UI.DataField', Value: shipper.city, Label: '{i18n>City}'},
                {$Type: 'UI.DataField', Value: shipper.region, Label: '{i18n>Region}'},
                {$Type: 'UI.DataField', Value: shipper.country, Label: '{i18n>Country}'},
                {$Type: 'UI.DataField', Value: shipper.email, Label: '{i18n>Email}'},
                {$Type: 'UI.DataField', Value: shipper.phone, Label: '{i18n>Phone}'},
                {$Type: 'UI.DataField', Value: shipper.website, Label: '{i18n>Website}'},
            ]
        },

        FieldGroup #ShipperTo        : {
            Data : [
                { $Type : 'UI.DataField', Value : shipperto.bp_number },
                {$Type: 'UI.DataField', Value: shipperto.name},
                {$Type: 'UI.DataField', Value: shipperto.street, Label: '{i18n>Street}'},
                {$Type: 'UI.DataField', Value: shipperto.postal_code, Label: '{i18n>PostalCode}'},
                {$Type: 'UI.DataField', Value: shipperto.city, Label: '{i18n>City}'},
                {$Type: 'UI.DataField', Value: shipperto.region, Label: '{i18n>Region}'},
                {$Type: 'UI.DataField', Value: shipperto.country, Label: '{i18n>Country}'},
                {$Type: 'UI.DataField', Value: shipperto.email, Label: '{i18n>Email}'},
                {$Type: 'UI.DataField', Value: shipperto.phone, Label: '{i18n>Phone}'},
                {$Type: 'UI.DataField', Value: shipperto.website, Label: '{i18n>Website}'},
            ]
        },
        FieldGroup #Cargo        : {
            Data : [
                {$Type : 'UI.DataField', Value : descr, Label: '{i18n>Description}' },
                {$Type : 'UI.DataField', Value : quantity, Label: '{i18n>Quantity}' },
                {$Type: 'UI.DataField', Value: weight, Label: '{i18n>Weight}'},
                {$Type: 'UI.DataField', Value: weight_UOM},
                {$Type: 'UI.DataField', Value: volume, Label: '{i18n>Volume}'},
                {$Type: 'UI.DataField', Value: volume_UOM},
                {$Type: 'UI.DataField', Value: dg_ind, Label: '{i18n>DangerousGoods}'},
                
            ]
        },
    },

    // Page Details
    UI.Facets : [
        {
            $Type  : 'UI.CollectionFacet',
            ID     : 'FOItemDetails',   
            Label  : '{i18n>ItemDetails}',                    
            Facets : [
                {
                    $Type  : 'UI.ReferenceFacet',                  
                    Label  :  '{i18n>Shipper}',              
                    Target : '@UI.FieldGroup#Shipper'
                },
                {
                    $Type  : 'UI.ReferenceFacet',                  
                    Label  :  '{i18n>ShipperTo}',              
                    Target : '@UI.FieldGroup#ShipperTo'
                },
                
            ]
        },
        {
            $Type  : 'UI.ReferenceFacet',                  
            Label  :  '{i18n>CargoDetails}',              
            Target : '@UI.FieldGroup#Cargo'
        },
    ]
);