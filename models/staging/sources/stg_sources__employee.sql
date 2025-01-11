with 
     source_employee as (
        select
              cast(BUSINESSENTITYID as int) as pk_employee
              ,cast (JOBTITLE as string) as job_title
              ,cast (GENDER as string) as gender
              ,  
        from {{ source('sources_adventure_works', 'employee') }}
    )

select *
from source_employee

