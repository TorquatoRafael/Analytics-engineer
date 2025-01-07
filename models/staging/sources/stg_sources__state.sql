with
    source_state as (
        select
            cast(stateprovinceid as int) as pk_state,
            cast(countryregioncode as string) as fk_country,
            cast(name as string) as state
        from {{ source("sources_adventure_works", "stateprovince") }}
    )

select *
from source_state
