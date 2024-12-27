with 
     source_people as (
        select
              cast(BUSINESSENTITYID as int) as pk_person
            , cast(PERSONTYPE as string) as type_person
            , cast(FIRSTNAME as string) as first_name
            , cast(LASTNAME as string) as last_name
        from {{ source('sources_adventure_works', 'person') }}
    )

select *
from source_people

