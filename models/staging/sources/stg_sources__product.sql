with 
     source_products as (
        select
              cast(PRODUCTID as int) as pk_product
            ,  cast(PRODUCTSUBCATEGORYID as int) as fk_product_subcategory
            , cast(NAME as string) as name_product
        from {{ source('sources_adventure_works', 'product') }}
    )

select *
from source_products

