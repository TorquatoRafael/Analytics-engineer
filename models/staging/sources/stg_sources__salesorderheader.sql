with 
    source_sales as (
        select
              cast(SALESORDERID as int) as pk_sale
            , cast(CUSTOMERID as int) as fk_customer
            , cast(TERRITORYID as int) as fk_territory
            , cast(CREDITCARDID as int) as fk_creditcard
            , cast(ORDERDATE as date) as date_sale
            , cast(SUBTOTAL as numeric(18,2)) as subtotal_sale
            , cast(TAXAMT as numeric(18,2)) as tax_sale
            , cast(FREIGHT as numeric(18,2)) as  freight_sale
            , cast(TOTALDUE as numeric(18,2)) as total_sale
            , cast(STATUS as string) as status_sale
        from {{ source('sources_adventure_works', 'salesorderheader') }}
    )

select *
from source_sales