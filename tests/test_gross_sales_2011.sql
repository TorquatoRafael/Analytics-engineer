
/*
This test checks if the gross sales for 2011 are correct according to the accounting value: 
$ 12,646,112.16
*/


    with   
    gross_sales_2011 as (
        select 
            round(sum(GROSS_SALES),2) as SUM_GROSS_SALES
        from {{ref('fact_sales')}}
        where date_sale between  '2011-01-01' and '2011-12-31'
)

select SUM_GROSS_SALES 
from gross_sales_2011 
where SUM_GROSS_SALES not between 12646112.00 and 12646113.00

