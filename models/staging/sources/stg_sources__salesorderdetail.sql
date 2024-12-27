with 
    source_sales_details as (
        select
              cast(SALESORDERID as int) as fk_sale
            , cast(PRODUCTID as int) as fk_product_order
            , cast(ORDERQTY as float) as qty_sale
            , cast(UNITPRICE as float) as unit_price_sale
            , cast(UNITPRICEDISCOUNT as float) as unit_discount_sale
        from {{ source('sources_adventure_works', 'salesorderdetail') }}
    )

select *
from  source_sales_details 
