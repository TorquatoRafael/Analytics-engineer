/*
Aula 8 -> 2:03:27
->Número de pedidos = contagem distinta de salesorderid -> Sales Order Header
->Quantidade comprada = soma de orderqty -> Sales Order Detail
->Valor total negociado = soma de [unitprice*orderqty] -> Sales Order Detail
->Valor total negociado liquido =  soma de [unitprice * orderqty - (1-discount)] -> Sales Order Detail
*/


with
    orders_detail as (
        select *
        from {{ ref('stg_sources__salesorderdetail') }})
    
    ,sales as (
        select *
        from {{ ref('stg_sources__salesorderheader') }})

    , joined as (
        select 
        sales.PK_SALES
        ,sales.FK_CUSTOMER
        ,sales.FK_TERRITORY
        ,sales.FK_CREDITCARD
        ,orders_detail.FK_PRODUCT_ORDER
        ,sales.DATE_SALE
        ,orders_detail.QTY_SALE
        ,orders_detail.UNIT_PRICE_SALE
        ,orders_detail.UNIT_DISCOUNT_SALE
        ,sales.SUBTOTAL_SALE
        ,sales.TAX_SALE
        ,sales.FREIGHT_SALE
        ,sales.TOTAL_SALE
        ,sales.FK_SALES_ORDER_REASON
        from orders_detail
        inner join sales on orders_detail.FK_SALE = sales.PK_SALES
    )



    , metrics as (
        select
        PK_SALES
        ,FK_CUSTOMER
        ,FK_TERRITORY
        ,FK_CREDITCARD
        ,FK_PRODUCT_ORDER as FK_PRODUCT
        ,FK_SALES_ORDER_REASON as FK_SALES_REASON
        ,DATE_SALE
        ,QTY_SALE
        ,UNIT_PRICE_SALE
        ,QTY_SALE * UNIT_PRICE_SALE AS GROSS_SALES
        ,cast(
            (UNIT_PRICE_SALE * QTY_SALE * (1-UNIT_DISCOUNT_SALE))
            as numeric(18,2)) as NET_SALES
        ,UNIT_DISCOUNT_SALE
        ,case
            when UNIT_DISCOUNT_SALE > 0 then
                true
                else
                false end as HAD_DISCOUNT
        ,SUBTOTAL_SALE
        ,TAX_SALE
        ,cast(
            (FREIGHT_SALE / count(*) over(partition by  PK_SALES))
            as numeric(18,2)) as SHARED_SHIPPING
        ,FREIGHT_SALE
        ,TOTAL_SALE
        from joined
    )

select * from metrics

--select sum(GROSS_SALES) from metrics WHERE year(DATE_SALE) = 2011


