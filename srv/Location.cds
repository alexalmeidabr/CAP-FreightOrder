using CatalogService as srv from './cat-service';

 annotate srv.Locations with @( 

    // Location data
    UI        : {

        DataPoint#loc: {Value: loc_code, Title: 'Location'},            
        
        FieldGroup#LocationData:{
            Data:[
                {$Type: 'UI.DataField', Value: loc_code},
                {$Type: 'UI.DataField', Value: loc_descr},
                {$Type: 'UI.DataField', Value: street},
                {$Type: 'UI.DataField', Value: post_code},
                {$Type: 'UI.DataField', Value: city},
                {$Type: 'UI.DataField', Value: region},
                {$Type: 'UI.DataField', Value: country},
            ]
        },
        $Type: 'UI.DataField', Value: loc_code,  
    }
);

// annotate srv.Locations with {
//   loc_code @( Common.Label: 'Location' );
//   loc_descr @( Common.Label: 'Description' );
//   street @( Common.Label: 'Street' );
//   number @( Common.Label: 'Number' );
//   post_code @( Common.Label: 'Postal Code' );
//   city @( Common.Label: 'City' );
//   region @( Common.Label: 'Region' );
//   country @( Common.Label: 'Country' );
// }