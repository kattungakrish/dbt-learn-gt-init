    --File Naming convention: <type of model- stg = staging model>_<schema_name>_<name_of_dataset>.sql
    
    select
        id as customer_id,
        first_name,
        last_name

    from raw.jaffle_shop.customers