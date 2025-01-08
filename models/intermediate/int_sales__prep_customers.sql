with
    customers as (
        select *
        from {{ ref('stg_sources__customer') }})
    
    ,person as (
        select *
        from {{ ref('stg_sources__person') }})

    ,store as(
        select * 
        from {{ ref('stg_sources__store') }}
     )

    ,complete_customers as (
        select
            customers.pk_customer
            ,CASE WHEN 
                person.full_name IS NOT NULL 
                THEN person.full_name 
                WHEN store.store_name IS NOT NULL 
                THEN store.store_name 
                ELSE 'Not Found' END AS name
            ,CASE WHEN 
                person.full_name IS NOT NULL 
                THEN 'Natural Person'
                WHEN store.store_name IS NOT NULL 
                THEN 'Legal Entity'
                ELSE 'Not Found' END AS type_customer    
        from customers
        left join person on person.pk_person = customers.pk_customer
        left join store on store.pk_store =  customers.pk_customer
    )
    
select * from complete_customers

