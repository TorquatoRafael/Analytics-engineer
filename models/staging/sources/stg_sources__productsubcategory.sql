with 
     source_products_subcategory as (
        select
              cast(PRODUCTSUBCATEGORYID as int) as pk_product_subcategory
            , cast(PRODUCTCATEGORYID as int) as fk_product_category
            , cast(NAME as string) as name_product_subcategory
        from {{ source('sources_adventure_works', 'productsubcategory') }}
    )

select *
from source_products_subcategory