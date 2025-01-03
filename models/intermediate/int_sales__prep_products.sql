with
    products as (
        select * 
        from {{ ref("stg_sources__product") }})
    
    ,productsubcategorys as (
        select * 
        from {{ ref("stg_sources__productsubcategory") }})


    ,productcategorys as (
        select *
        from {{ref("stg_sources__productcategory")}})
    

    ,complete_product as (
        select
             products.pk_product
            ,products.name_product
            ,productcategorys.name_product_category
            ,productsubcategorys.name_product_subcategory
        from products 
        left join productsubcategorys on products.fk_product_subcategory = productsubcategorys.pk_product_subcategory
        left join productcategorys on productcategorys.pk_product_category = productsubcategorys.fk_product_category)

    
select * from complete_product




    
