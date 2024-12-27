with 
     source_products_category as (
        select
             cast(PRODUCTCATEGORYID as int) as pk_product_category
            , cast(NAME as string) as name_product_category
        from {{ source('sources_adventure_works', 'productcategory') }}
    )

select *
from source_products_category