/*Get the products that have the highest and lowest manufacturing costs.
The final output should contain these fields,
product_code
product
manufacturing_cost */

(select sum(manufacturing_cost) s,fact_manufacturing_cost.product_code,min(product) from fact_manufacturing_cost join dim_product
on fact_manufacturing_cost.product_code = dim_product.product_code
group by fact_manufacturing_cost.product_code order by s asc limit 1)

union

(select sum(manufacturing_cost) s,fact_manufacturing_cost.product_code,min(product) from fact_manufacturing_cost join dim_product
on fact_manufacturing_cost.product_code = dim_product.product_code
group by fact_manufacturing_cost.product_code order by s desc limit 1
)