with
    address as (
        select * 
        from {{ ref("stg_sources__address") }}
        )
    
    ,state as (
        select * 
        from {{ ref("stg_sources__state") }})


    ,country as (
        select *
        from {{ref("stg_sources__country")}})
    

    ,complete_territory as (
        select
             address.pk_address
            ,address.city
            ,state.state
            ,country.country
        from address
        left join state on address.fk_state = state.pk_state
        left join country on state.fk_country = country.pk_country)

    
select * from complete_territory




    
