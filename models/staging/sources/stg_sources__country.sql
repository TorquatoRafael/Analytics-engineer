with 
     source_country as (
        select
            cast(COUNTRYREGIONCODE as string) as pk_country
            , cast(name as string) as country
        from {{ source('sources_adventure_works', 'countryregion') }}
    )

select *
from source_country

