/* Query 10 Get the Top 3 products in each division that have a high
total_sold_quantity in the fiscal_year 2021? The final output contains these
fields,division,product_code, product,total_sold_quantity,rank_order */

with ctw as (with ctq as (select dim_product.product_code as pc, max(product) as pm, sum(sold_quantity) as sold from 
dim_product join fact_sales_monthly on dim_product.product_code=fact_sales_monthly.product_code
where fiscal_year=2021 group by dim_product.product_code )

select division, pc, pm, sold, rank() over(partition by division order by sold desc) as rank_order
from dim_product join ctq on dim_product.product_code = ctq.pc)

select * from ctw where rank_order<4;
;
