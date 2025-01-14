with 
    source_sales as (
        select
              cast(SALESORDERID as int) as pk_sales
            , cast(CUSTOMERID as int) as fk_customer
            , cast(SALESPERSONID as int) as fk_salesperson
            , cast(SHIPTOADDRESSID as int) as fk_address
            , cast(CREDITCARDID as int) as fk_creditcard
            , SALESORDERID::varchar || '-' || STATUS::varchar as fk_sales_order_reason 
            , cast(ORDERDATE as date) as date_sale
            , cast(SUBTOTAL as numeric(18,2)) as subtotal_sale
            , cast(TAXAMT as numeric(18,2)) as tax_sale
            , cast(FREIGHT as numeric(18,2)) as  freight_sale
            , cast(TOTALDUE as numeric(18,2)) as total_sale
            , cast(ONLINEORDERFLAG as string) as online_flag
        from {{ source('sources_adventure_works', 'salesorderheader') }}
    )

select *
from source_sales