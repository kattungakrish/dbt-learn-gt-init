    --File Naming convention: <type of model- stg = staging model>_<schema_name>_<name_of_dataset>.sql    
    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status,
        _etl_loaded_at

    from {{source('jaffle_shop','orders')}}