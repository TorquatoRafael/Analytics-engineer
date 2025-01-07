
--This test checks if the gross sales for 2011 are correct according to the accounting value: $ 12,646,112.16


    with   
    gross_sales_2011 as (
        select 
            round(sum(GROSS_SALES),2) as SUM_GROSS_SALES
        from {{ref('fact_sales')}}
        where year(date_sale) = 2011

)

select SUM_GROSS_SALES 
from gross_sales_2011 
where SUM_GROSS_SALES != 12646112.16

