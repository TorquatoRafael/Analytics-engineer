with 
    source_sales as (
        select
              cast(SALESORDERID as int) as pk_sale
            , cast(CUSTOMERID as int) as fk_customer
            , cast(TERRITORYID as int) as fk_territory
            , cast(CREDITCARDID as int) as fk_creditcard
            , cast(ORDERDATE as date) as date_sale
            , cast(SUBTOTAL as float) as subtotal_sale
            , cast(TAXAMT as float) as tax_sale
            , cast(FREIGHT as float) as  freight_sale
            , cast(TOTALDUE as float) as total_sale
            , cast(STATUS as string) as status_sale
        from {{ source('sources_adventure_works', 'salesorderheader') }}
    )

select *
from source_sales