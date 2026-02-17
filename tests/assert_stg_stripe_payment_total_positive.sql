select orderid,
    sum(amount) as total_amount
from {{ref('stg_stripe_payments')}}
group by orderid
having total_amount < 0