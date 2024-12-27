with 
     source_cards as (
        select
              cast(CREDITCARDID as int) as pk_credit_card
            , cast(CARDTYPE as string) as type_card
        from {{ source('sources_adventure_works', 'creditcard') }}
    )

select *
from source_cards

