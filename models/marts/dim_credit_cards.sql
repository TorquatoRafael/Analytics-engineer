with dim_credit_card as (
    select * 
    from {{ ref('int_sales__prep_creditcards') }}
)

select * from dim_credit_card