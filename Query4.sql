/*follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference */

WITH product2020 as(
select segment, count(product) product_count_2020 from dim_product inner join 
fact_gross_price on dim_product.product_code=fact_gross_price.product_code where fiscal_year=2020
group by segment

),
product2021 as(
select segment, count(product) product_count_2021 from dim_product inner join 
fact_gross_price on dim_product.product_code=fact_gross_price.product_code where fiscal_year=2021
group by segment

)

select product2020.segment, product_count_2020, product_count_2021, abs(product_count_2020 - product_count_2021) as difference from product2020 inner join product2021
on product2020.segment = product2021.segment;

