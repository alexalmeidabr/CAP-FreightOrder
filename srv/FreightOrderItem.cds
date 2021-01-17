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
    }
);
