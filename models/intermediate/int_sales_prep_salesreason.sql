with 
    sales_orders_reasons_header as (
        select *
        from {{ ref('stg_sources__salesorderheadersalesreason') }}
    )

    ,sales_orders_reasons as (
        select *
        from {{ ref('stg_sources__salesreason') }}
    )

    ,complete_sales_reason as (
        select
            
            sales_orders_reasons_header.pk_sales_order_reason
            ,sales_orders_reasons_header.fk_sales_order 
            ,sales_orders_reasons.name_sales_reason
            ,sales_orders_reasons.type_sales_reason
            from sales_orders_reasons_header
            left join sales_orders_reasons on sales_orders_reasons_header.fk_sales_reason = sales_orders_reasons.pk_sales_reason
    )
    select * from complete_sales_reason
