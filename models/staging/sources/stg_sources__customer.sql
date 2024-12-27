with 
     source_customers as (
        select
              cast(CUSTOMERID as int) as pk_customer
        from {{ source('sources_adventure_works', 'customer') }}
    )

select *
from source_customers

