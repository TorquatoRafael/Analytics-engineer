with dim_address as (
    select * 
    from {{ ref('int_sales__prep_territory') }}
)

select * from dim_address