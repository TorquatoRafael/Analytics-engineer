with 
     source_customers as (
        select
              cast(CUSTOMERID as int) as pk_customer
              ,cast(PERSONID as int) as fk_person
              ,cast(STOREID as int) as fk_store  
        from {{ source('sources_adventure_works', 'customer') }}
    )
select *
from source_customers

