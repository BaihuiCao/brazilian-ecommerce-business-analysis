DROP TABLE IF EXISTS ecommerce;

CREATE TABLE ecommerce AS
SELECT
    o.order_id,
    o.order_purchase_timestamp,

    c.customer_unique_id,
    c.customer_state,

    p.product_category_name,

    oi.price,
    oi.freight_value

FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE o.order_status = 'delivered';
