with
    customers as (
        select *
        from {{ ref('stg_sources__customer') }})
    
    ,person as (
        select *
        from {{ ref('stg_sources__person') }})

    ,complete_customers as (
        select
            customers.pk_customer
            ,person.type_person
            ,person.first_name
            ,person.last_name
        from customers
        left join person on person.pk_person = customers.pk_customer
    )
    
select * from complete_customers