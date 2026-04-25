WITH return AS
(
    SELECT
        sales_id,
        product_sk,
        refund_amount,
        return_reason,
        store_sk
    FROM
        {{ ref('bronze_returns')}}
    ),
sales AS
(
    SELECT
        sales_id,
        customer_sk
    FROM
        {{ ref('bronze_sales')}}
),
products AS
(
    SELECT
        product_sk,
        category
    FROM
        {{ ref('bronze_product')}}
),

customer AS
(
    SELECT
        customer_sk,
        gender
    FROM
        {{ ref('bronze_customer')}}
        
        ),

JOINED AS (SELECT
    return.sales_id,
    return.refund_amount,
    return.return_reason,
    products.category,
    customer.gender
FROM
    return JOIN products ON return.product_sk = products.product_sk
    JOIN sales ON return.sales_id = sales.sales_id
    JOIN customer ON sales.customer_sk = customer.customer_sk

)

SELECT
    gender
    ,category
    ,sum(refund_amount) as total_refund
FROM
    JOINED
    Group by gender, category order by total_refund desc


