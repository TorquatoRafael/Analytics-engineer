with 
     source_salesperson as (
        select
              cast(BUSINESSENTITYID as int) as pk_salesperson
        from {{ source('sources_adventure_works', 'salesperson') }}
    )

select *
from source_salesperson

