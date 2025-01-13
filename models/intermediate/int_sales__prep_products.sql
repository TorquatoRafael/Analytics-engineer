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
            ,CASE WHEN 
                name_product_category IS NOT NULL 
                THEN name_product_category
                ELSE 'Raw Material/Maintenance Material' END AS name_product_category
            ,CASE WHEN 
                productsubcategorys.name_product_subcategory IS NOT NULL 
                THEN productsubcategorys.name_product_subcategory
                ELSE 'Raw Material/Maintenance Material' END AS name_product_subcategory
        from products 
        left join productsubcategorys on products.fk_product_subcategory = productsubcategorys.pk_product_subcategory
        left join productcategorys on productcategorys.pk_product_category = productsubcategorys.fk_product_category)

    
select * from complete_product




    
