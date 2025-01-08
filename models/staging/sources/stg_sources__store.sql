with 
     source_people as (
        select
              cast(BUSINESSENTITYID as int) as pk_store
            , cast(NAME as string) as store_name
        from {{ source('sources_adventure_works', 'store') }}
    )


select *
from source_people


