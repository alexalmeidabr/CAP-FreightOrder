using fonav as my from '../db/schema';

service CatalogService {
    @readonly
    entity FreightOrders as projection on my.FreightOrders;
    entity FreightOrderItems as projection on my.FreightOrderItems;
}