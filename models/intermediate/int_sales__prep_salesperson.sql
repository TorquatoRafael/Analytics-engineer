with
    salesperson as (
        select *
        from {{ ref('stg_sources__salesperson') }})
    
    ,employee as (
        select *
        from {{ ref('stg_sources__employee') }})

    ,person as(
        select * 
        from {{ ref('stg_sources__person') }}
     )

    ,complete_salesperson as (
        select
            salesperson.pk_salesperson
            ,employee.job_title
            ,employee.gender
            ,person.full_name
        from salesperson
        left join employee on salesperson.pk_salesperson = employee.pk_employee
        left join person on person.pk_person = employee.pk_employee
    )
    
select * from complete_salesperson

