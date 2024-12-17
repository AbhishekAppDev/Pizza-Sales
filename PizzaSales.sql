-- Determine the distribution of orders by hour of the day.

select hour(order_time),count(order_id) from orders
group by hour(order_time);

-- join relevant tables to find the category-wise distribution of pizzas.

select category, count(pizza_type.name) as types
from pizza_type
group by category order by types desc;

-- Group the orders by date and calculate the average number of pizzas ordered per day.

select round(avg(total),0) from
(select orders.order_date,sum(order_details.quantity) as total
from orders join order_details on orders.order_id = order_details.order_id
group by orders.order_date) as order_quantity;