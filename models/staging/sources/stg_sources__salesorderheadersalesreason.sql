with 
    source_sales_orders_reasons as (
        select
              cast(SALESREASONID as int) as fk_sales_reason 
            , cast(SALESORDERID as int) as fk_sales_order
        from {{ source('sources_adventure_works', 'salesorderheadersalesreason') }}
    )

select *
from source_sales_orders_reasons