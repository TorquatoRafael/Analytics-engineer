with dim_sales_reasons as (
    select * 
    from {{ ref("int_sales_prep_salesreason") }}
)

select * from dim_sales_reasons