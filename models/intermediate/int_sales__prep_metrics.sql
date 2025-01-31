/*
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
        ,sales.FK_SALESPERSON
        ,sales.FK_ADDRESS
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
        ,sales.ONLINE_FLAG
        from orders_detail
        inner join sales on orders_detail.FK_SALE = sales.PK_SALES
    )



    , metrics as (
        select
        PK_SALES
        ,FK_CUSTOMER
        ,FK_SALESPERSON
        ,FK_ADDRESS
        ,FK_CREDITCARD
        ,FK_PRODUCT_ORDER as FK_PRODUCT
        ,DATE_SALE
        ,QTY_SALE
        ,UNIT_PRICE_SALE
        ,QTY_SALE * UNIT_PRICE_SALE AS GROSS_SALES
        ,cast(
            (UNIT_PRICE_SALE * QTY_SALE * (1-UNIT_DISCOUNT_SALE))
            as numeric(18,2)) as NET_SALES
        ,cast((GROSS_SALES - NET_SALES) as numeric(18,2)) as DISCOUNT_SALE
        ,cast((DISCOUNT_SALE/QTY_SALE) as numeric(18,2)) as UNIT_DISCOUNT_SALE
        ,UNIT_DISCOUNT_SALE as PERCENTAGE_DISCOUNT_SALE
        ,SUBTOTAL_SALE
        ,TAX_SALE
        ,cast(
            (FREIGHT_SALE / count(*) over(partition by  PK_SALES))
            as numeric(18,2)) as SHARED_SHIPPING
        ,FREIGHT_SALE
        ,TOTAL_SALE
        ,ONLINE_FLAG
        ,case 
            when fk_creditcard is null then
                'Another payment method'
                else
                'Credit card' end as PAYMENT_METHOD 
        ,case
            when UNIT_DISCOUNT_SALE > 0 then
                true
                else
                false end as HAD_DISCOUNT
        from joined
    )

select * from metrics



