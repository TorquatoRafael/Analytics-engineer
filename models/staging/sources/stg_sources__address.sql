with 
     source_address as (
        select
              cast(ADDRESSID as int) as pk_address
            , cast(STATEPROVINCEID as int) as fk_state
            , cast(CITY as string) as city
            
        from {{ source('sources_adventure_works', 'address') }}
    )

select *
from source_address

