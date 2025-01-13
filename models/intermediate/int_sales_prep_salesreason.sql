with 
    sales_orders_reasons_header as (
        select 
        FK_SALES_ORDER
        ,FK_SALES_REASON
        ,ROW_NUMBER() OVER (PARTITION BY FK_SALES_ORDER ORDER BY FK_SALES_REASON DESC) AS rn
        from {{ ref('stg_sources__salesorderheadersalesreason') }}
    )
    ,ranked_sales_orders_reasons as (
        select 
            FK_SALES_ORDER
            ,FK_SALES_REASON
        from sales_orders_reasons_header
        where rn = 1
    )

    ,sales_orders_reasons as (
        select *
        from {{ ref('stg_sources__salesreason') }}
    )

    ,complete_sales_reason as (
        select
            ranked_sales_orders_reasons.fk_sales_order 
            ,sales_orders_reasons.name_sales_reason
            ,sales_orders_reasons.type_sales_reason
            from ranked_sales_orders_reasons
            left join sales_orders_reasons on ranked_sales_orders_reasons.fk_sales_reason = sales_orders_reasons.pk_sales_reason
    )
    select * from complete_sales_reason 
