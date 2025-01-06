with credit_cards as (
    select 
         pk_credit_card
        ,type_card
    from {{ ref('stg_sources__creditcards') }}
)
select * from credit_cards