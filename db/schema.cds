namespace fonav;
using { Currency } from '@sap/cds/common';

entity FreightOrders {
    
    key doc_number  : Integer;
    fo_type         : String;
    fo_type_descr   : String;
    subcontr_rel    : Boolean;
    transp_mode     : String;
    means_transp    : String;
    exec_status     : String;
    carrier         : String;
    carrier_ref     : String;
    driver          : String;
    driver_name     : String;
    cost            : Decimal;
    currency        : String;
    vehicle         : String;
    vehicle_descr   : String;
    reg_number      : String;
    weight_cap      : Decimal;
    weight_cap_uom  : String;
    volume_cap      : Decimal;
    volume_cap_uom  : String;
    used_weight     : Decimal;
    used_volume     : Decimal;
    pe_org          : Integer;
    pe_org_descr    : String;
    purch_org       : Integer;
    purch_org_descr : String;
    source_loc      : String;
    departure       : DateTime;
    dest_loc        : String;
    arrival         : DateTime;
    items           : Composition of many FreightOrderItems on items.parent = $self;
}

entity FreightOrderItems {
    
    key parent      : Association to FreightOrders;
    key item_number : Integer;    
    parent_item   : Integer;
    type          : String;
    descr         : String;
    resource_type : String;
    container     : String;
    quantity      : Integer;
    weight        : Decimal;
    weight_UOM    : String;
    volume        : Decimal;
    volume_UOM    : String;
    dg_ind        : Boolean;
    shipper       : String;
    shipperto_party : String;    
    
}

entity BusinessPartners {
  
  key ID      : UUID;
  bp_number   : String;
  name        : String;
  street      : String;
  number      : String;
  postal_code : String;
  city        : String;
  region      : String;
  country     : String;
  email       : String;
  phone       : String;
  website     : String;  
}