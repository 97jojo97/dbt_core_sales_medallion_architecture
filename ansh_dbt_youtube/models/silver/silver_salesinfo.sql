WITH sales AS
(
    SELECT
        sales_id,
        product_sk,
        customer_sk,
        {{ multiply('unit_price','quantity')}} as calculated_gross_amount,
        gross_amount,
        payment_method
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
JOINED_SALES AS (
SELECT
    sales.sales_id,
    sales.gross_amount,
    sales.payment_method,
    products.category,
    customer.gender
FROM
    sales JOIN products ON sales.product_sk = products.product_sk
    JOIN customer ON sales.customer_sk = customer.customer_sk
)

SELECT
    gender,
    category,
    sum(gross_amount) as total_sales
FROM
    JOINED_SALES
    Group by gender, category order by total_sales desc
