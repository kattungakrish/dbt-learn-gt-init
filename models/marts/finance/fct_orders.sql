
with orders as (

select * from {{ref('stg_jaffle_shop_orders')}}
stg_jaffle_shop_customers
),

payments as (
    select * from {{ref('stg_stripe_payments')}}
    stg_stripe_payments
),

final as (
select o.order_id, o.customer_id, coalesce(p.amount,0) as amount
from orders o
left join 
(
    select p.orderid, sum(p.amount) as amount
    from payments p
    where upper(p.status) = 'SUCCESS'
    group by p.orderid
) p on p.orderid = o.order_id
)
select *
from final

