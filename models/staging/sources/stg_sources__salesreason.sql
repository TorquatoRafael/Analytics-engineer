with 
    source_sales_reasons as (
        select
              cast(SALESREASONID as int) as pk_sales_reason 
            , cast(NAME as string) as name_sales_reason
            , cast(REASONTYPE as string) as type_sales_reason
        from {{ source('sources_adventure_works', 'salesreason') }}
    )

select *
from source_sales_reasons